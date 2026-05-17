#!/usr/bin/env python3
"""
ux-audit-toolkit Setup Wizard

Installiert UX- und Accessibility-Skills plus Knowledge-Files in den
Ziel-Workspace (Claude Code, Cowork Vault oder Standalone-Verzeichnis).

Usage:
    python3 install.py
    python3 install.py --target ~/my-vault --platform cowork
    python3 install.py --dry-run

License: MIT
"""

import argparse
import json
import os
import shutil
import sys
from pathlib import Path

VERSION = "0.1.0"
TOOLKIT_NAME = "ux-audit-toolkit"

SKILLS = [
    "ux-review",
    "audit-wizard",
    "ux-toolkit-onboard",
]

KNOWLEDGE_DOMAINS = [
    "ux",
]


def color(text, code):
    """Simple ANSI color for terminals that support it."""
    if not sys.stdout.isatty():
        return text
    return f"\033[{code}m{text}\033[0m"


def info(text):
    print(color(f"[INFO] {text}", "36"))


def success(text):
    print(color(f"[OK]   {text}", "32"))


def warn(text):
    print(color(f"[WARN] {text}", "33"))


def error(text):
    print(color(f"[ERR]  {text}", "31"), file=sys.stderr)


def banner():
    print()
    print(color("=" * 60, "1"))
    print(color(f"  {TOOLKIT_NAME} v{VERSION} Setup", "1"))
    print(color("  UX und Accessibility Skills fuer Claude", "1"))
    print(color("=" * 60, "1"))
    print()


def ask(prompt, default=None, choices=None):
    """Prompt user with optional default and choices."""
    suffix = ""
    if choices:
        suffix = f" [{ '/'.join(choices) }]"
    if default:
        suffix += f" (default: {default})"
    while True:
        answer = input(f"{prompt}{suffix}: ").strip()
        if not answer and default:
            return default
        if choices:
            if answer.lower() in [c.lower() for c in choices]:
                return answer.lower()
            warn(f"Bitte eine der Optionen waehlen: {', '.join(choices)}")
            continue
        if answer:
            return answer


def confirm(prompt, default=True):
    suffix = "[Y/n]" if default else "[y/N]"
    answer = input(f"{prompt} {suffix}: ").strip().lower()
    if not answer:
        return default
    return answer in ("y", "yes", "j", "ja")


def detect_platform():
    """Best-effort guess at the current environment."""
    home = Path.home()
    candidates = {
        "claude-code": [home / ".claude" / "skills"],
        "obsidian-vault": [home / "Obsidian", home / "Documents" / "Obsidian"],
    }
    for platform_name, paths in candidates.items():
        for p in paths:
            if p.exists():
                return platform_name
    return "standalone"


def resolve_target(platform_name, target_arg):
    """Return (skills_root, knowledge_root) based on platform."""
    if target_arg:
        base = Path(target_arg).expanduser().resolve()
        return base / "skills", base / "knowledge"

    home = Path.home()
    if platform_name == "claude-code":
        skills = home / ".claude" / "skills"
        knowledge = home / ".claude" / "knowledge"
        return skills, knowledge

    if platform_name == "obsidian-vault":
        print()
        info("Obsidian-Vault-Modus.")
        info("Es gibt keine einheitliche Vault-Convention. Bitte gib die Pfade an.")
        print()
        vault = ask("Vault-Root-Pfad", default=str(home / "Obsidian"))
        base = Path(vault).expanduser().resolve()
        print()
        info(f"Vault-Root: {base}")
        skills_sub = ask("Skills-Subpfad (relativ zum Vault-Root)", default="skills")
        knowledge_sub = ask("Knowledge-Subpfad (relativ zum Vault-Root)", default="knowledge")
        skills = base / skills_sub
        knowledge = base / knowledge_sub
        return skills, knowledge

    # standalone
    target = ask("Ziel-Verzeichnis", default=str(home / TOOLKIT_NAME))
    base = Path(target).expanduser().resolve()
    return base / "skills", base / "knowledge"


def copy_tree(src, dst, dry_run=False):
    if not src.exists():
        warn(f"Quelle fehlt, uebersprungen: {src}")
        return 0
    if dst.exists():
        warn(f"Existiert bereits: {dst}")
        if not confirm("Ueberschreiben?", default=False):
            info(f"Uebersprungen: {dst}")
            return 0
        if not dry_run:
            shutil.rmtree(dst)
    if dry_run:
        info(f"[dry-run] copy {src} -> {dst}")
        return 1
    shutil.copytree(src, dst)
    return 1


def copy_file(src, dst, dry_run=False):
    if not src.exists():
        warn(f"Quelle fehlt, uebersprungen: {src}")
        return 0
    dst.parent.mkdir(parents=True, exist_ok=True)
    if dst.exists():
        warn(f"Existiert bereits: {dst}")
        if not confirm("Ueberschreiben?", default=False):
            return 0
    if dry_run:
        info(f"[dry-run] copy {src} -> {dst}")
        return 1
    shutil.copy2(src, dst)
    return 1


def install(args):
    banner()

    repo_root = Path(__file__).resolve().parent
    src_skills = repo_root / "skills"
    src_knowledge = repo_root / "knowledge"

    if not src_skills.exists() or not src_knowledge.exists():
        error(f"Repo-Struktur nicht gefunden in {repo_root}")
        sys.exit(1)

    # Platform
    if args.platform:
        platform_name = args.platform
        info(f"Plattform: {platform_name} (via Flag)")
    else:
        detected = detect_platform()
        info(f"Erkannte Plattform: {detected}")
        if confirm("Diese Plattform verwenden?", default=True):
            platform_name = detected
        else:
            platform_name = ask(
                "Plattform manuell waehlen",
                default="standalone",
                choices=["claude-code", "cowork-vault", "standalone"],
            )

    skills_root, knowledge_root = resolve_target(platform_name, args.target)
    print()
    info(f"Skills nach:    {skills_root}")
    info(f"Knowledge nach: {knowledge_root}")
    print()

    if not confirm("Mit Installation fortfahren?", default=True):
        info("Abgebrochen.")
        sys.exit(0)

    if not args.dry_run:
        skills_root.mkdir(parents=True, exist_ok=True)
        knowledge_root.mkdir(parents=True, exist_ok=True)

    # Skill-Auswahl
    print()
    info("Welche Skills installieren?")
    selected_skills = []
    for skill in SKILLS:
        if args.all:
            selected_skills.append(skill)
            continue
        if confirm(f"  {skill} installieren?", default=True):
            selected_skills.append(skill)

    if not selected_skills:
        warn("Keine Skills ausgewaehlt, Abbruch.")
        sys.exit(0)

    # UX-Plugin braucht immer die ux Knowledge-Domain
    needed_domains = set()
    if any(s in selected_skills for s in ["ux-review", "audit-wizard", "ux-toolkit-onboard"]):
        needed_domains.add("ux")

    print()
    info("Kopiere Skills ...")
    skill_count = 0
    for skill in selected_skills:
        src = src_skills / skill
        dst = skills_root / skill
        if copy_tree(src, dst, dry_run=args.dry_run):
            success(f"  {skill}")
            skill_count += 1

    print()
    info("Kopiere Knowledge-Domains ...")
    domain_count = 0
    for domain in needed_domains:
        src = src_knowledge / domain
        dst = knowledge_root / domain
        if copy_tree(src, dst, dry_run=args.dry_run):
            success(f"  {domain}")
            domain_count += 1

    # State-File schreiben fuer spaetere Updates
    state = {
        "toolkit": TOOLKIT_NAME,
        "version": VERSION,
        "platform": platform_name,
        "skills_root": str(skills_root),
        "knowledge_root": str(knowledge_root),
        "installed_skills": selected_skills,
        "installed_knowledge": sorted(needed_domains),
    }
    state_file = repo_root / ".installer-state.json"
    if not args.dry_run:
        state_file.write_text(json.dumps(state, indent=2))

    print()
    print(color("=" * 60, "32"))
    success(f"Installation abgeschlossen.")
    print(color("=" * 60, "32"))
    print()
    print(f"  {skill_count} Skills, {domain_count} Knowledge-Domains")
    print(f"  State: {state_file}")
    print()
    print("Naechste Schritte:")
    print("  1. Claude oder Cowork neu laden, damit die Skills erkannt werden.")
    print("  2. Mit 'review meinen Screen' oder 'BFSG-Check' testen.")
    print("  3. Bei Bedarf: knowledge-Files auf dein Projekt anpassen.")
    print()
    if args.dry_run:
        warn("Dry-run abgeschlossen, nichts wurde geschrieben.")


def main():
    parser = argparse.ArgumentParser(
        description=f"{TOOLKIT_NAME} Setup Wizard v{VERSION}",
    )
    parser.add_argument(
        "--target",
        help="Manuelles Ziel-Verzeichnis (override platform-detection)",
    )
    parser.add_argument(
        "--platform",
        choices=["claude-code", "obsidian-vault", "standalone"],
        help="Plattform manuell setzen",
    )
    parser.add_argument(
        "--all",
        action="store_true",
        help="Alle Skills ohne Rueckfrage installieren",
    )
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Nur anzeigen, was passieren wuerde",
    )
    args = parser.parse_args()

    try:
        install(args)
    except KeyboardInterrupt:
        print()
        warn("Abgebrochen.")
        sys.exit(1)


if __name__ == "__main__":
    main()
