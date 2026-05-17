---
name: ux-review
description: |
  Heuristisches UX-Review eines Interfaces, Konzepts, Mockups oder Screenshots. Prüft gegen Nielsen-Heuristiken, Laws of UX und Dark-Pattern-Taxonomie. Liefert priorisierte Findings mit Severity, Heuristik-Bezug, Quelle und Fix-Vorschlag. Triggert bei: UX-Review, Heuristik-Audit, Dark-Pattern-Check, Usability-Check, ist das nutzbar, prüf das Interface, review meinen Screen.
argument-hint: "[interface-beschreibung, screenshot-pfad, url oder figma-link]"
version: 0.2.0
license: MIT (skill code) + CC BY 4.0 (knowledge)
---

# UX Review (Heuristisches Audit)

## Zweck

Strukturierte Bewertung eines Interfaces gegen drei Frameworks: Nielsen-Heuristiken (was läuft schief), Laws of UX (warum es so wirkt), Dark Patterns (was ethisch und regulatorisch riskant ist).

Dieser Skill ersetzt keinen User-Test. Er liefert eine schnelle Diagnose im Stil eines Senior-Reviewers.

## Wann triggert dieser Skill

### Automatisch sinnvoll
- Vor Auslieferung eines UX-Konzepts (Quality Gate)
- Bei Pitch-Vorbereitung mit UX-Argument
- Vor Re-Design-Empfehlung

### Manuell
- Screenshot oder Figma-Link mit der Frage "wie nutzbar"
- Audit-Auftrag eines Kunden
- Dark-Pattern-Defense-Check für Compliance (DSA, AI Act, DSGVO)

## Phase 1: Kontext klären

**Pflicht-Fragen, falls nicht aus Anfrage ableitbar:**

1. Was ist das Interface (Mockup, Live-Produkt, Konzept)?
2. Wer ist die Zielgruppe (B2C, B2B, Expert-User, Erstnutzer)?
3. Welcher Use-Case wird betrachtet (Onboarding, Kern-Task, Recovery)?
4. Welche Tiefe wird gebraucht (Quick-Scan, Standard-Audit, Full-Audit)?

Bei "schnell": max 5 Findings pro Bereich, keine Tiefe.
Bei Kunden-Output: volle Tiefe, Severity-Ranking, Fix-Vorschläge mit Aufwand.

## Phase 2: Wissensquellen laden

**Pflicht zu lesen:**
- `knowledge/ux/00_ux-index.md` (Routing)
- `knowledge/ux/nielsen-heuristics.md` (Diagnose)
- `knowledge/ux/laws-of-ux.md` (Erklärung)
- `knowledge/ux/dark-patterns.md` (Anti-Pattern)

**Bei Kunden-Kommunikation zusätzlich:**
- `knowledge/ux/ux-grundprinzipien.md` (5er Übersetzung)

## Phase 3: Drei-Linsen-Audit

### Linse 1: Nielsen-Heuristiken
Alle 10 Heuristiken durchgehen. Pro Heuristik:
- Verstoß ja/nein
- Wenn ja: Was konkret, an welcher Stelle
- Severity nach Nielsen (0 bis 4)
- Fix-Vorschlag

### Linse 2: Laws of UX
Beobachtete Verhaltens-Probleme oder Reibung mit passendem Law erklären:
- Hick's Law bei zu vielen Optionen
- Fitts's Law bei Touch-Target-Problemen
- Doherty bei Wartezeiten
- Peak-End bei schwachem Session-Abschluss
- Miller/Cognitive Load bei Überforderung
- Jakob's Law bei Konventions-Brüchen

Pro relevantes Law: kurze Erklärung des Mechanismus plus Empfehlung.

### Linse 3: Dark-Pattern-Defense
6-Cluster-Check aus `dark-patterns.md`:
1. Asymmetrie
2. Versteckte Kosten/Konsequenzen
3. Manipulierte Aufmerksamkeit
4. Konstruierte Knappheit
5. Erzwungenes Verhalten
6. Privacy-Defaults

Pro Verstoß: Pattern-Name, Heuristik-Verstoß, regulatorischer Bezug (DSA, AI Act, DSGVO, UCPD, PAngV), Severity.

## Phase 4: Output-Format

### Format Quick-Scan (intern, 10 Findings max)

```
## UX-Review [Interface-Name]

**Kontext:** [1 Satz]
**Stand:** [Datum]

### Kritisch
- [Heuristik #X] [Finding]. Fix: [Vorschlag].

### Hoch
- [Heuristik #X] [Finding]. Fix: [Vorschlag].

### Mittel
- [Finding]. Fix: [Vorschlag].

### Compliance-Hinweise
- [Wenn Dark Pattern: Pattern-Name + EU-Akt].
```

### Format Kunden-Audit (Full)

Markdown-Datei mit dieser Struktur:

1. **Executive Summary** (5 Bulletpoints im "Insight, Action, Outcome"-Format)
2. **Kontext und Methodik** (Was untersucht, mit welchen Frameworks)
3. **Findings nach Severity** (kritisch, hoch, mittel, niedrig)
4. **Pro Finding:** Screenshot/Beschreibung, Heuristik-Bezug, Law-Erklärung, Fix-Vorschlag, Aufwandsschätzung (S/M/L)
5. **Compliance-Risiken** separat (Dark Patterns, DSA, AI Act, DSGVO)
6. **Empfohlene Reihenfolge** (Quick-Wins zuerst, strukturelle Issues danach)
7. **Quellen-Anhang** (Nielsen 2020, Yablonski 2020, Brignull 2010, ergänzt nach Bedarf)

## Phase 5: Severity-Logik

Severity nicht raten. Klare Regeln:

**Kritisch:**
- Compliance-Verstoß (DSA, AI Act, DSGVO, UCPD)
- Blockiert Kern-Task vollständig
- Datenverlust möglich
- Vertrauensbruch

**Hoch:**
- Senkt Conversion oder Aktivierung messbar (>10 Prozent Schätzung)
- Frustriert Mehrheit der Nutzer
- Nielsen-Severity 3 bis 4

**Mittel:**
- Reibung, aber Task ist erreichbar
- Nielsen-Severity 2

**Niedrig:**
- Kosmetisch, Stil-Inkonsistenz
- Nielsen-Severity 1

## Phase 6: Abgrenzung

**Dieser Skill macht nicht:**
- Accessibility-Audits (WCAG, BFSG) → separates Plugin `accessibility-audit-toolkit`
- Quantitative Analytics-Auswertung
- User-Testing (separate Methodik)
- Visual-Design-Kritik (Brand und Ästhetik separat)

**Bei diesen Fragen Skill abbrechen und passendes Tool vorschlagen.**

## Beispiel-Outputs

### Quick-Scan-Beispiel
"Checkout-Flow von shop.example.com. Quick-Scan, 8 Findings.

Kritisch:
- Hidden Costs: Versandkosten erscheinen erst auf Step 4 von 5. Fix: Versand-Schätzung schon im Warenkorb anzeigen. (Nielsen H1 + UCPD-Risiko)
- Forced Continuity: Trial wandelt sich ohne Pre-Reminder. Fix: 3-Tage-vor-Ende-Mail plus In-App-Banner.

Hoch:
- Hick's Law: 9 Payment-Optionen gleichrangig. Fix: Top 3 prominent, Rest unter Toggle.
..."

### Audit-Headline-Beispiel
"Drei Findings, die Conversion-Bremsen sind. Sieben Findings, die Vertrauen kosten. Zwei Compliance-Risiken (DSA Art. 25, DSGVO Art. 7), die vor Launch gefixt werden müssen."

---

## Verwandte Skills

- `audit-wizard` (Interaktiver Step-by-Step UX-Audit-Flow)
- `ux-toolkit-onboard` (Erst-Setup nach Installation)

## Companion-Plugins

- `accessibility-audit-toolkit` (WCAG 2.2 AA + BFSG/EAA, separates Plugin)
