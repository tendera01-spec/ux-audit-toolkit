---
name: audit-wizard
description: |
  Interaktiver Step-by-Step-Flow für UX-Audits. Führt durch vier Phasen mit Zwischenständen: Kontext, Quick-Scan, Tiefen-Audit, Output. User entscheidet nach jeder Phase ob weiter, tiefer oder fertig. Liefert finalen UX-Audit-Report im gewählten Format. Triggert bei: ux audit wizard, geführter ux audit, schritt für schritt review, interaktives audit, walk me through, audit-flow.
argument-hint: "[interface, url, screenshot oder scope-beschreibung]"
version: 0.1.0
license: MIT (skill code) + CC BY 4.0 (knowledge)
---

# Audit Wizard (Geführter UX-Audit-Flow)

## Zweck

Geführter UX-Audit für User, die durch den Prozess geführt werden wollen statt direkt einen Skill aufzurufen. Vier Phasen mit Decision-Points dazwischen.

Empfohlene Nutzung: erste Audits mit dem Plugin, Workshop-Settings, Teaching-Kontext, Audits mit unklarem Scope.

## Phase 0: Begrüßung und Setup

Pflicht-Fragen:

1. **Was wird auditiert?** URL, Screenshot, Figma-Link, App-Bezeichnung, Beschreibung
2. **Wer ist die Zielgruppe?** B2C, B2B, Power-User, Erstnutzer
3. **Was ist der Use-Case?** Onboarding, Kern-Task, Checkout, Recovery, Settings

Output: Audit-Header für späteren Report.

## Phase 1: Quick-Scan (10 bis 15 Minuten)

Schneller Heuristik-Plus-Dark-Pattern-Smell-Test.

### Schritt 1.1: Nielsen Top 5

Die fünf Heuristiken, die am häufigsten Probleme zeigen:
1. H1 Sichtbarkeit Systemstatus
2. H4 Konsistenz
3. H5 Fehlervermeidung
4. H8 Minimalismus
5. H9 Hilfe bei Fehlern

### Schritt 1.2: Laws-of-UX Quick-Check

- Hick's Law: zu viele Optionen?
- Fitts's Law: Touch-Target-Größen ausreichend?
- Doherty: spürbare Latenz?
- Jakob's Law: Konventions-Brüche?

### Schritt 1.3: Dark-Pattern-Smell-Test

- Cookie-Banner asymmetrisch?
- Versteckte Kosten beim Checkout?
- Asymmetrische Anmeldung/Kündigung?
- Confirmshaming bei Decline-Optionen?

### Zwischenstand 1

Output: 5 bis 10 Top-Findings, Severity-Grobeinschätzung.

**Decision-Point:** "Reicht das?" oder "Tiefer rein?"

## Phase 2: UX-Tiefen-Audit (optional)

Vollständiger ux-review durch alle drei Linsen:

### Schritt 2.1: Alle 10 Nielsen-Heuristiken
### Schritt 2.2: Laws-of-UX-Erklärungen
### Schritt 2.3: Dark-Pattern-6-Cluster-Check

### Zwischenstand 2

Output: vollständige UX-Findings nach Severity.

**Decision-Point:** "Fertig" oder "Output-Format wählen"?

**Hinweis:** Wenn der User auch Accessibility-Befund braucht, auf das separate `accessibility-audit-toolkit` Plugin verweisen.

## Phase 3: Output-Generierung

User wählt Format:

### Option A: Schneller Chat-Output
Bullet-Liste mit Top-Findings, kein File.

### Option B: Markdown-Audit-Report
Strukturiertes Dokument, Executive Summary plus Findings-Tabellen.

### Option C: Kunden-Deliverable
Formell, mit Executive Summary in POV-Formula-Format ("Insight, Action, Outcome").

## Phase 4: Follow-up

Nach Output:

1. **Next-Steps anbieten:** Workshop, Re-Design-Sprint, Implementation-Begleitung
2. **Methodisches Feedback:** Was war hilfreich, was fehlte?
3. **Wenn neue Patterns auftauchen:** als Vorschlag für Knowledge-Update sammeln

## Phase 5: Abgrenzung

**Wann nicht der Wizard, sondern ux-review direkt:**
- User weiß genau, was er braucht (z.B. nur Dark-Pattern-Check)
- Wiederholungs-Audit derselben Site
- Time-Box unter 30 Minuten

**Wann auf accessibility-audit-toolkit verweisen:**
- WCAG-Konformität gefragt
- BFSG/EAA-Compliance
- Screen-Reader-Tests
- VPAT/Conformance-Statement

---

## Verwandte Skills

- `ux-review`: UX-Audit ohne Step-by-Step
- `ux-toolkit-onboard`: Erst-Setup nach Installation
- `accessibility-audit-toolkit` (separates Plugin): WCAG + BFSG + EAA
