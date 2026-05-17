#!/usr/bin/env bash
# build-plugin.sh
#
# Baut aus dem Repo eine valide .plugin-Datei fuer Cowork und Claude Code.
# Output landet in dist/<name>-<version>.plugin
#
# Usage:
#   ./build-plugin.sh           # baut Plugin
#   ./build-plugin.sh --check   # nur Validierung, kein Build
#   ./build-plugin.sh --clean   # dist/ leeren

set -euo pipefail

# -----------------------------------------------------------------------------
# Constants
# -----------------------------------------------------------------------------
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MANIFEST="$REPO_ROOT/.claude-plugin/plugin.json"
DIST_DIR="$REPO_ROOT/dist"
TMP_DIR="${TMPDIR:-/tmp}"

# -----------------------------------------------------------------------------
# Colors
# -----------------------------------------------------------------------------
if [[ -t 1 ]]; then
    C_INFO='\033[36m'
    C_OK='\033[32m'
    C_WARN='\033[33m'
    C_ERR='\033[31m'
    C_BOLD='\033[1m'
    C_RESET='\033[0m'
else
    C_INFO=''; C_OK=''; C_WARN=''; C_ERR=''; C_BOLD=''; C_RESET=''
fi

info()  { echo -e "${C_INFO}[INFO]${C_RESET} $*"; }
ok()    { echo -e "${C_OK}[OK]  ${C_RESET} $*"; }
warn()  { echo -e "${C_WARN}[WARN]${C_RESET} $*"; }
err()   { echo -e "${C_ERR}[ERR] ${C_RESET} $*" >&2; }

banner() {
    echo
    echo -e "${C_BOLD}=================================================="
    echo -e "  ux-audit-toolkit Plugin Builder"
    echo -e "==================================================${C_RESET}"
    echo
}

# -----------------------------------------------------------------------------
# Argparse
# -----------------------------------------------------------------------------
MODE="build"
case "${1:-}" in
    --check) MODE="check" ;;
    --clean) MODE="clean" ;;
    -h|--help)
        cat <<EOF
Usage: $0 [--check|--clean|--help]

  --check   Nur Validierung des Repos, kein Build
  --clean   dist/ leeren
  --help    Diese Hilfe

Ohne Flag: vollstaendiger Build inkl. Validierung
EOF
        exit 0 ;;
esac

banner

# -----------------------------------------------------------------------------
# Clean
# -----------------------------------------------------------------------------
if [[ "$MODE" == "clean" ]]; then
    if [[ -d "$DIST_DIR" ]]; then
        info "Leere dist/ ..."
        rm -rf "$DIST_DIR"/*
        ok "dist/ ist leer."
    else
        info "dist/ existiert nicht, nichts zu tun."
    fi
    exit 0
fi

# -----------------------------------------------------------------------------
# Validation
# -----------------------------------------------------------------------------
info "Validiere Repo-Struktur ..."

# Required files
REQUIRED_FILES=(
    ".claude-plugin/plugin.json"
    "README.md"
    "LICENSE"
)
for f in "${REQUIRED_FILES[@]}"; do
    if [[ ! -f "$REPO_ROOT/$f" ]]; then
        err "Fehlt: $f"
        exit 1
    fi
done
ok "  Pflicht-Files vorhanden"

# Manifest readable + has name/version
if ! command -v python3 >/dev/null 2>&1; then
    err "python3 wird fuer Manifest-Parsing gebraucht"
    exit 1
fi

PLUGIN_NAME=$(python3 -c "import json; print(json.load(open('$MANIFEST'))['name'])")
PLUGIN_VERSION=$(python3 -c "import json; print(json.load(open('$MANIFEST'))['version'])")

if [[ -z "$PLUGIN_NAME" || -z "$PLUGIN_VERSION" ]]; then
    err "plugin.json: name oder version leer"
    exit 1
fi
ok "  Manifest: $PLUGIN_NAME v$PLUGIN_VERSION"

# Skills
SKILL_COUNT=$(find "$REPO_ROOT/skills" -name "SKILL.md" 2>/dev/null | wc -l | tr -d ' ')
if [[ "$SKILL_COUNT" -lt 1 ]]; then
    err "Keine Skills gefunden (skills/<name>/SKILL.md)"
    exit 1
fi
ok "  Skills gefunden: $SKILL_COUNT"

# Skill frontmatter checks (name + description)
SKILL_ERRORS=0
for skill_file in "$REPO_ROOT"/skills/*/SKILL.md; do
    name_line=$(head -20 "$skill_file" | grep "^name:" || true)
    desc_line=$(head -20 "$skill_file" | grep "^description:" || true)
    if [[ -z "$name_line" || -z "$desc_line" ]]; then
        warn "  Frontmatter unvollstaendig: $skill_file"
        SKILL_ERRORS=$((SKILL_ERRORS + 1))
    fi
done
if [[ $SKILL_ERRORS -gt 0 ]]; then
    err "$SKILL_ERRORS Skill(s) mit fehlerhafter Frontmatter"
    exit 1
fi
ok "  Skill-Frontmatter sauber"

# Em-Dash Check (Hard fail). dist/ und .git/ ausnehmen.
# || true wegen set -e: grep mit 0 Treffern returnt non-zero
EM_DASH_FILES=$(grep -rl "—" "$REPO_ROOT" \
    --include="*.md" --include="*.json" \
    --exclude-dir="dist" --exclude-dir=".git" --exclude-dir="node_modules" \
    2>/dev/null || true)
if [[ -n "$EM_DASH_FILES" ]]; then
    err "Em-Dashes gefunden in:"
    echo "$EM_DASH_FILES" | head -5
    exit 1
fi
ok "  Keine Em-Dashes"

# Wikilink Check (Hard fail). Obsidian-Wikilinks [[file]] werden auf GitHub
# nicht klickbar. CONTRIBUTING.md ausgenommen (dort als Negativ-Beispiel).
WIKILINK_FILES=$(grep -rl -E "\[\[[^]]+\]\]" "$REPO_ROOT" \
    --include="*.md" \
    --exclude-dir="dist" --exclude-dir=".git" --exclude-dir="node_modules" \
    --exclude="CONTRIBUTING.md" \
    2>/dev/null || true)
if [[ -n "$WIKILINK_FILES" ]]; then
    err "Obsidian-Wikilinks [[...]] gefunden in:"
    echo "$WIKILINK_FILES" | head -5
    err "Bitte zu Standard-Markdown-Links umwandeln: [name](name.md)"
    exit 1
fi
ok "  Keine Obsidian-Wikilinks (GitHub-kompatibel)"

# -----------------------------------------------------------------------------
# Check-only?
# -----------------------------------------------------------------------------
if [[ "$MODE" == "check" ]]; then
    echo
    ok "Validierung erfolgreich. Bereit fuer Build."
    exit 0
fi

# -----------------------------------------------------------------------------
# Build
# -----------------------------------------------------------------------------
echo
info "Baue Plugin ..."

mkdir -p "$DIST_DIR"

OUTPUT_NAME="${PLUGIN_NAME}-${PLUGIN_VERSION}.plugin"
TMP_PLUGIN="$TMP_DIR/$OUTPUT_NAME"

# Cleanup any old build
rm -f "$TMP_PLUGIN"

# Files to include
INCLUDES=(
    ".claude-plugin"
    "skills"
    "knowledge"
    "docs"
    "examples"
    "README.md"
    "LICENSE"
    "CHANGELOG.md"
    "CONTRIBUTING.md"
)

# Excludes (don't pollute plugin with dev artifacts)
EXCLUDES=(
    "*.DS_Store"
    "__pycache__/*"
    "*.pyc"
    ".installer-state.json"
    "dist/*"
    ".git/*"
    ".github/*"
    "build-plugin.sh"
    "install.py"
)

cd "$REPO_ROOT"

ZIP_EXCLUDES=""
for ex in "${EXCLUDES[@]}"; do
    ZIP_EXCLUDES="$ZIP_EXCLUDES -x $ex"
done

# shellcheck disable=SC2086
zip -rq "$TMP_PLUGIN" "${INCLUDES[@]}" $ZIP_EXCLUDES

if [[ ! -f "$TMP_PLUGIN" ]]; then
    err "Plugin-Build fehlgeschlagen"
    exit 1
fi

PLUGIN_SIZE=$(du -h "$TMP_PLUGIN" | cut -f1 | tr -d ' \n')
PLUGIN_FILES=$(unzip -l "$TMP_PLUGIN" 2>/dev/null | tail -1 | awk '{print $2}' | head -1 | tr -d ' \n')
PLUGIN_FILES=${PLUGIN_FILES:-unknown}

ok "  Plugin gebaut: $PLUGIN_SIZE, $PLUGIN_FILES Files"

# Copy to dist/ (cp + rm statt mv, weil mv across filesystems failen kann)
cp "$TMP_PLUGIN" "$DIST_DIR/$OUTPUT_NAME"
rm -f "$TMP_PLUGIN"

# Latest-Symlink (tolerant gegenueber existierendem Symlink)
(cd "$DIST_DIR" && ln -sf "$OUTPUT_NAME" "${PLUGIN_NAME}-latest.plugin" 2>/dev/null || true)

echo
ok "Build abgeschlossen."
echo
echo "  Plugin:  $DIST_DIR/$OUTPUT_NAME"
echo "  Latest:  $DIST_DIR/${PLUGIN_NAME}-latest.plugin"
echo
echo "Naechste Schritte:"
echo "  - Plugin in Cowork installieren: Datei oeffnen via Doppelklick"
echo "  - Oder via Claude Code: 'claude plugin install $DIST_DIR/$OUTPUT_NAME'"
echo "  - Oder im Repo commiten und auf GitHub als Release hochladen"
echo
