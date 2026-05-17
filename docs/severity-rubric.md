# Severity-Rubric

Konsistente Severity-Bewertung über alle Skills hinweg.

---

## Vier-Tier-Modell

### Kritisch

**Definition:** Compliance-Verstoß, vollständiger Task-Blocker, Datenverlust, Vertrauensbruch.

**Beispiele:**
- WCAG Level A Verstoß (BFSG-relevant)
- DSGVO Art. 7 Verstoß (Cookie-Banner ohne echte Wahl)
- DSA Art. 25 Verstoß (manipulative Schnittstellen)
- Forced Continuity ohne Pre-Reminder (deutsches Recht)
- Hidden Costs unter UCPD
- Privacy Zuckering (DSGVO Art. 25 Privacy by Default)
- Datenverlust bei Form-Submit-Fehler

**Pflicht:** Vor Auslieferung oder Launch fixen. Bei Bestandsprodukten: in den nächsten 14 Tagen.

### Hoch

**Definition:** Senkt Conversion oder Aktivierung messbar (geschätzt >10 Prozent), frustriert Mehrheit der Nutzer, Reputations-Risiko.

**Beispiele:**
- WCAG Level AA Verstoß
- Nielsen-Severity 3 bis 4
- Hick's Law Verstoß mit >7 gleichrangigen Optionen im Kernflow
- Peak-End-Bruch im Onboarding
- Dark Patterns ohne direkten Compliance-Bezug, aber Reputations-Risiko (Confirmshaming, Asymmetrie)

**Pflicht:** Nächster Sprint, max. 4 Wochen.

### Mittel

**Definition:** UX-Reibung, sekundäre Funktion eingeschränkt, Task ist erreichbar.

**Beispiele:**
- Nielsen-Severity 2
- Best-Practice-Verstoß ohne direkten Standard-Bezug
- Inkonsistenter Style bei nicht-Primary-Elementen
- Tooltips ohne Touch-Alternative (außerhalb Kernflow)

**Pflicht:** In den nächsten 3 Monaten.

### Niedrig

**Definition:** Kosmetisch, Stil-Inkonsistenz, AAA-Empfehlung.

**Beispiele:**
- Nielsen-Severity 1
- Polishing-Themen
- Lang-Attribute auf Einzelzitaten
- WCAG Level AAA Empfehlungen

**Pflicht:** Backlog.

---

## Wann höher einstufen

Wenn ein Verstoß eines Tier-Kriteriums die Definition eines höheren Tiers trifft, höher einstufen. Beispiele:

- WCAG Level AA Verstoß (normalerweise Hoch), aber der Kontext ist BFSG-pflichtige B2C-Seite → Kritisch
- Hick's Law Verstoß (normalerweise Hoch), aber im Notfall-Flow (z.B. Stornieren eines Abos) → Kritisch
- Dark Pattern (normalerweise Hoch), aber explizit gegen DSA Art. 25 → Kritisch

---

## Wann niedriger einstufen

Selten. Nur wenn:
- Funktion ist in einem klar markierten Beta-Bereich, der nicht für reguläre Nutzer gedacht ist
- Es gibt einen dokumentierten Workaround mit klarer Hinweisstelle
- User-Gruppe ist explizit klein und alternative Pfade existieren

In allen anderen Fällen: lieber höher einstufen.

---

## Format für Severity-Begründung

Pro Finding kurz dokumentieren:

```
Severity: Hoch
Begründung: Level AA Verstoß WCAG 1.4.3 (Kontrast 2.8:1, Norm 4.5:1) auf Primary-CTA der Produktseite. Betrifft alle Nutzer mit Sehbehinderung. BFSG-relevant.
```

Keine Severity ohne Begründung.

---

## Häufige Fehler

- **Severity nach Aufwand zu setzen.** Aufwand und Severity sind unabhängige Dimensionen. Ein Fix mit S Aufwand kann kritisch sein, ein Fix mit L Aufwand niedrig.
- **Severity nach Sichtbarkeit zu setzen.** Sichtbar ≠ schlimm. Unsichtbare Issues (Screen-Reader-Probleme) können kritischer sein als sichtbare Polishing-Themen.
- **Compliance-Risiken als "niedrig" zu bagatellisieren.** Wenn ein Pattern in einem laufenden EU-Verfahren steht, ist es nicht "Stilfrage".
