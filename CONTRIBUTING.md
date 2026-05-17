# Contributing

Danke für dein Interesse. Pull Requests, Issues und Feedback sind willkommen.

## Was wird gesucht

- **Übersetzungen:** Knowledge-Files sind aktuell auf Deutsch. Englische Versionen sind in Arbeit.
- **Knowledge-Updates:** Neue WCAG-Versionen, neue Laws of UX, neue Dark-Pattern-Beobachtungen.
- **Plattform-Adapter:** Skills für andere AI-Assistenten (Cursor, Continue, Aider, Codex).
- **Sample-Audits:** Anonymisierte Beispiele aus realen Projekten.
- **Bug-Fixes:** Fehler im Setup-Wizard, in den SKILL.md-Files oder in den Knowledge-Tabellen.

## Was nicht passt

- Personalisierte Skills, die nur in einem bestimmten Setup laufen.
- Proprietäre Frameworks ohne offene Quelle oder Lizenz.
- Anti-Pattern, die als legitime Designs framen wollen.

## Workflow

1. Issue öffnen, bevor du größere Änderungen baust.
2. Fork, Branch (`feature/<kurzname>` oder `fix/<kurzname>`), Commit, PR.
3. Beschreibe in der PR: Was, Warum, Wie getestet.
4. Halte dich an die Stilrichtlinien (siehe unten).

## Stilrichtlinien

### Skill-Files (`skills/<name>/SKILL.md`)

- YAML-Frontmatter mit `name`, `description`, `argument-hint`, `license`.
- Phasen klar nummeriert.
- Trigger-Phrasen in der `description` listen, damit der AI-Assistent matchen kann.
- Keine personenbezogenen Daten, keine Mandanten-Namen.

### Knowledge-Files (`knowledge/<domain>/*.md`)

- Quellen zitieren (Autor, Jahr, Link).
- Praktische Anwendung pro Konzept, nicht nur Theorie.
- Querverweise zu anderen Knowledge-Files via Standard-Markdown-Links `[file-name](file-name.md)`. Keine Obsidian-Wikilinks `[[file]]`, weil GitHub und andere Renderer die nicht klickbar machen.
- Keine Em-Dashes (Punkt, Komma oder neuer Satz).
- Konsistente Umlaute (ä, ö, ü, ß).

### Setup-Wizard und Scripts

- Python 3.9+, keine externen Dependencies (Standard-Library only).
- Inline-Docs auf Englisch oder Deutsch konsistent pro Datei.
- Dry-Run-Option pflegen, damit User vor Ausführung sehen, was passiert.

## Code of Conduct

- Respektvoller Umgangston, auch bei Disagreements.
- Keine Kommentare, die Nutzergruppen diffamieren (besonders Menschen mit Behinderungen).
- Issues und PRs werden nach Inhalt bewertet, nicht nach Person.

## Lizenzen für Beiträge

Mit dem Einreichen eines PRs erklärst du dich einverstanden, dass deine Beiträge unter den im Repo geltenden Lizenzen veröffentlicht werden:

- Code: MIT License
- Knowledge-Content: CC BY 4.0

Wenn du Material einbringst, das anderen Lizenzen unterliegt, kennzeichne das klar in der PR.

## Kontakt

- GitHub Issues für Bugs und Feature-Requests
- GitHub Discussions für allgemeines Feedback und Fragen
