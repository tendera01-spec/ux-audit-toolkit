---
name: ux-toolkit-onboard
description: |
  Onboarding-Wizard für das ux-audit-toolkit. Begrüßt neue User, erklärt die UX-Audit-Skills, führt durch ein Demo-Audit, sammelt Kontext über Projekttyp und Audit-Bedarf, schlägt passende Defaults und Workflows vor. Triggert bei: setup, get started, ux toolkit onboard, neue installation, ersten audit, hilf mir beim einstieg, walk me through.
argument-hint: "[optional: projekttyp oder fokus]"
version: 0.1.0
license: MIT (skill code) + CC BY 4.0 (knowledge)
---

# UX Toolkit Onboard (Setup-Wizard)

## Zweck

Erste Anlaufstelle nach Installation des ux-audit-toolkit. Bringt einen neuen User in 10 bis 15 Minuten an den Punkt, an dem er die UX-Audit-Skills produktiv nutzen kann.

Unterschied zu den Audit-Skills:
- Audit-Skills bewerten Interfaces.
- Onboard-Skill bewertet, was der User braucht, und richtet das Plugin darauf aus.

## Phase 1: Begrüßung und Erwartungs-Check

**Sage:**

> Hi. Ich bin der Onboarding-Wizard fuer das ux-audit-toolkit. Wir machen das in vier Schritten, dauert insgesamt rund 15 Minuten. Am Ende hast du dein erstes UX-Audit, einen klaren Workflow und ein paar Defaults, die zu deinem Setup passen.

**Frage 1:**
"Was beschreibt dich am besten?"
- Strategic Designer oder UX Lead, eigene Mandate
- Product Owner oder Engineer, internes Audit
- Agentur oder Beratung, Kundenarbeit
- Anderes (Freitext)

Antwort speichern als `user_role`.

**Frage 2:**
"Was möchtest du primär auditieren?"
- B2C-Webseiten oder Apps
- B2B-SaaS
- E-Commerce
- Interne Tools
- Gemischt

Antwort speichern als `audit_scope`.

## Phase 2: Skill-Übersicht in 60 Sekunden

| Skill | Was er macht | Wann triggern |
|-------|--------------|---------------|
| `ux-review` | Heuristik-Audit nach Nielsen + Laws of UX + Dark Patterns | "review mein interface" |
| `audit-wizard` | Step-by-Step UX-Audit mit Zwischenständen | "geführter audit" |
| `ux-toolkit-onboard` | Dieser Skill, einmaliges Setup | "setup" |

**Hinweis ergänzen:**

> Wenn du auch WCAG- oder BFSG-Compliance-Checks brauchst, installiere das separate `accessibility-audit-toolkit` Plugin. Beide Plugins lassen sich parallel betreiben.

## Phase 3: Demo-Audit

**Sage:**
"Wir machen jetzt einen kurzen Demo-Audit. Du brauchst eine URL oder einen Screenshot. Optional: ein eigenes Projekt."

**Frage 3:**
"Womit machen wir den Demo-Audit?"
- Eigene URL
- Eigener Screenshot
- Beispiel aus dem Repo (`examples/sample-audit-saas.md`)
- Spaeter, nur Erklaerung jetzt

### Wenn User eigene URL oder Screenshot:

1. `ux-review` aufrufen mit Tiefe "Quick-Scan"
2. Maximal 5 Findings liefern
3. Pro Finding: welche Linse, welche Heuristik, Severity

### Wenn User Beispiel will:

Sample-Audit durchgehen, dabei zeigen:
- Drei-Linsen-Modell (Nielsen + Laws + Dark Patterns)
- Severity-Logik
- Fix-Vorschlag-Format

## Phase 4: Workflow-Setup

**Frage 4: Output-Präferenz**
"Welches Output-Format ist dein Standard?"
- Chat-Bullets (intern, schnell)
- Markdown-Audit-Report (für Engineering)
- Formelles Deliverable (für Kunden, mit Executive Summary)

**Frage 5: Compliance-Fokus**
"Wie wichtig sind Dark-Pattern-Checks mit DSA/AI-Act-Bezug für deine Projekte?"
- Sehr wichtig, jedes Audit
- Gelegentlich, bei B2C-Projekten
- Selten

**Frage 6: Wiederholungs-Cadence**
"Brauchst du regelmäßige Re-Audits derselben Produkte?"
- Ja, vierteljährliche Reviews
- Ja, nach jedem Release
- Nein, einmalige Audits

### Ableitungen

**Wenn Strategic Designer + formelles Deliverable:**
"Empfehlung: standardisiere dein Audit-Template auf Basis von `examples/sample-audit-saas.md`. Severity-Logik konsistent halten über alle Kunden. Bei B2C-Projekten zusätzlich `accessibility-audit-toolkit` installieren."

**Wenn Product Owner + Markdown-Report:**
"Empfehlung: `audit-wizard` als Standard-Einstieg, weil er strukturiert durch die Phasen führt. Pro Projekt ein Audit-Verzeichnis mit Vor-, Mid-, Nach-Audit-Reports anlegen."

**Wenn Agentur + Compliance-fokussiert:**
"Empfehlung: Dark-Pattern-Defense als Standard-Punkt in jedem Audit. EU-Compliance-Hinweise im Report standardmäßig auffächern (DSA Art. 25, GDPR Art. 7+25, AI Act Art. 5). Liability-Klausel im Audit-Vertrag prüfen."

## Phase 5: Output

Am Ende:

1. **Personalisierte Skill-Empfehlung:** Welche zwei Skills wird der User am häufigsten benutzen
2. **Workflow-Skizze:** Konkrete Schritte für seinen typischen Audit-Use-Case
3. **Erste echte Aufgabe:** "Probier es jetzt aus. Sag 'review mein interface' plus dein Interface."
4. **Companion-Plugin-Hinweis:** Falls Audit-Scope B2C ist, expliziter Hinweis auf `accessibility-audit-toolkit`

## Phase 6: Knowledge-Loop und Re-Onboarding

Speichere wenn möglich:
- `user_role`, `audit_scope`, `output_preference`, `compliance_focus`, `cadence`
- Datum des Onboardings

**Re-Onboarding:** Wenn der User später "settings ändern" sagt, kann der Onboard-Skill erneut laufen.

## Phase 7: Abgrenzung

**Dieser Skill macht nicht:**
- Echte Audits (das macht `ux-review`)
- Accessibility-Audits (separates Plugin `accessibility-audit-toolkit`)
- Tiefe Methodik-Erklärungen (`docs/methodology.md`)

**Wenn der User schon weiß was er will:**
Onboarding skippen, `ux-review` direkt aufrufen.

---

## Verwandte Skills

- `ux-review`: Der eigentliche Audit-Skill
- `audit-wizard`: Step-by-Step-Audit-Flow

## Companion-Plugins

- `accessibility-audit-toolkit`: WCAG 2.2 AA + BFSG/EAA-Compliance-Audits
