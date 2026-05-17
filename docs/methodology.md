# Methodology

Wie dieses Toolkit denkt, was es leistet, was nicht. Für AI-User wie für Human-Reviewer.

---

## Grundprinzipien

1. **Diagnose vor Reparatur:** Erst finden, was läuft. Erst dann fixen.
2. **Severity nicht raten:** Klare Regeln pro Tier (kritisch, hoch, mittel, niedrig).
3. **Quellen zitieren:** Jedes Finding hat Frame und Quelle. Kein Bauchgefühl.
4. **Wirkung vor Methode:** Wenn ein Framework nicht passt, weglassen. Nicht Checkbox-Compliance machen.
5. **Compliance ist Pflicht, nicht Bonus:** DSA, DSGVO, BFSG/EAA sind Audit-Pflichtbereiche.

---

## Drei-Linsen-Modell (für UX)

Aus `skills/ux-review/SKILL.md`:

| Linse | Quelle | Wofür |
|-------|--------|-------|
| Nielsen-Heuristiken | NN/g 1994/2020 | Was läuft schief |
| Laws of UX | Yablonski 2020 | Warum es so wirkt |
| Dark Patterns | Brignull 2010, Mathur 2019 | Was ethisch und regulatorisch riskant ist |

Jede Linse fängt unterschiedliche Probleme. Audit-Reihenfolge: Heuristiken zuerst (deckt am meisten ab), dann Laws zur Erklärung, dann Dark Patterns als Defense.

---

## Vier-Phasen-Modell (für Accessibility)

Aus `skills/accessibility-audit/SKILL.md`:

1. **Automatisierte Tests:** axe, WAVE, Pa11y, Lighthouse. Fängt 30 bis 50 Prozent der Verstöße.
2. **Keyboard-Audit:** Manuell mit Tab und Esc. Fängt Tastatur-Bedienbarkeit.
3. **Screen-Reader-Audit:** NVDA + Firefox oder VoiceOver + Safari. Fängt assistive-Tech-Themen.
4. **Visueller Audit:** Zoom 200 Prozent, Reflow 320 Pixel, Greyscale. Fängt Wahrnehmungs-Themen.

WCAG-EM 1.0 als Sample-Methodik bei größeren Audits.

---

## Severity-Logik

| Tier | Definition | Beispiel |
|------|-----------|----------|
| **Kritisch** | Compliance-Verstoß oder vollständiger Task-Blocker | Level-A-WCAG-Verstoß, DSGVO-Verstoß, Datenverlust möglich |
| **Hoch** | Conversion-Killer, Vertrauensbruch | Level-AA-Verstoß, deutlicher Funnel-Drop, Dark Pattern mit Reputations-Risiko |
| **Mittel** | Reibung, aber Task erreichbar | Best-Practice-Verstoß, sekundäre Funktion eingeschränkt |
| **Niedrig** | Kosmetisch, Stil-Inkonsistenz | Polishing-Backlog |

Severity nicht raten. Wenn unklar: lieber höher einstufen und Begründung dokumentieren.

---

## Output-Formate

Vier Standard-Outputs, je nach Empfänger:

1. **Chat-Quick-Scan:** 5 bis 10 Findings, kein File. Für interne Schnell-Checks.
2. **Markdown-Audit-Report:** Strukturiertes Deliverable. Für Engineering und Product.
3. **BFSG-Erklärung:** Plain-Text-Template für Footer. Für Compliance.
4. **VPAT 2.5 / ACR:** Internationales Tabellen-Format. Für Procurement und US-Märkte.

Templates in `knowledge/accessibility/conformance-templates.md`.

---

## Wann welcher Skill

| Anfrage-Typ | Skill |
|-------------|-------|
| "Review meinen Screen" | audit-router (entscheidet) |
| "BFSG-Check" | accessibility-audit |
| "Dark-Pattern-Check" | ux-review |
| "Geführt durch ein Audit" | audit-wizard |
| "Heuristik-Audit nach Nielsen" | ux-review |
| "WCAG 2.2 AA Test" | accessibility-audit |
| "Beides bitte" | audit-router (orchestriert) |

---

## Was dieses Toolkit nicht ersetzt

1. **User-Tests mit echten Nutzern, insbesondere Menschen mit Behinderungen.** Goldstandard. Vendoren: Fable Tech Labs, AccessWorks (WebAIM), nationale Verbände.
2. **Fachanwaltliche Beratung** bei konkreten Compliance-Fragen.
3. **Automatisierte Tools** wie axe-core, Pa11y. Diese liefern Rohdaten, das Toolkit interpretiert sie.
4. **Performance-, Security-, Brand-Audits.** Andere Methodiken nötig.

---

## Kalibrierung und Bias

- **Aesthetic-Usability Effect:** Hübsches Design verzeiht Usability-Probleme. Audits sollten dagegen anarbeiten, nicht mitlaufen.
- **Confirmation Bias:** Wer das Tool gut findet, sucht eher Bestätigung. Disagreement im Audit-Team explizit einfordern.
- **Cultural Bias:** Konventionen unterscheiden sich pro Markt. Plattform-Konventionen (HIG, Material) sind nicht universell.
- **Compliance-Theater:** "Wir haben axe laufen lassen" ist kein Audit. Manuelle Tests sind Pflicht.

---

## Empfohlene Aufwände

Aus den Skill-Files konsolidiert. Vor Auftragsannahme mit Kunden abklären.

| Audit-Typ | Stunden |
|-----------|---------|
| UX-Quick-Scan | 1 bis 2 |
| UX-Full-Audit | 8 bis 16 |
| A11y-Quick-Check | 2 bis 4 |
| A11y-Sample-Audit (10 bis 20 Screens) | 8 bis 16 |
| A11y-Full-Audit (50+ Screens) | 32 bis 60 |
| BFSG-Erklärung erstellen | 2 bis 4 |
| VPAT 2.5 / ACR | 6 bis 12 |
| Kombiniertes UX + A11y-Audit | Summe + 20 Prozent |

---

## Erweiterungen (Backlog)

- Cognitive Biases (Kahneman, Ariely, Cialdini) als eigene Domain
- Persuasive Design Patterns (Fogg)
- Form Design Heuristiken (Wroblewski)
- Microinteraction-Prinzipien (Saffer)
- Mobile-spezifische Patterns (Hoekman, Mobile Touch-Guidelines)
- WCAG 3.0 (Silver) sobald released

Diese Erweiterungen werden gebaut, wenn konkreter Bedarf entsteht. PRs willkommen.
