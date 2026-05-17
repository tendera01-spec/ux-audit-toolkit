# UX-Grundprinzipien (5er Kunden-Version)

**Verwendung:** Kunden-Briefings, Workshops, Pitches, Stakeholder-Alignment. Wenn 10 Heuristiken zu viel sind.
**Verhältnis:** Übersetzung der [nielsen-heuristics](nielsen-heuristics.md) und [laws-of-ux](laws-of-ux.md) in Stakeholder-Sprache.

> Wer mit 10 Heuristiken einsteigt, verliert C-Level nach 2 Minuten. Wer mit 5 Prinzipien einsteigt, gewinnt die Diskussion.

---

## 1. Klarheit vor Eleganz

**Aussage:** Der Nutzer versteht in unter 5 Sekunden, was er hier macht und was als Nächstes passiert.

**Bezug:**
- Nielsen H1 (Sichtbarkeit Systemstatus), H2 (Sprache der Nutzer), H8 (Minimalismus)
- Laws: Hick's Law, Cognitive Load, Jakob's Law

**Fragen für Workshop:**
- Wenn ich diese Seite stumm zeige, weiß der Nutzer, was zu tun ist?
- Gibt es einen klaren Primary CTA pro View?
- Welche Information ist überflüssig?

---

## 2. Probleme lösen, nicht verstecken

**Aussage:** Friction da, wo sie Wert schafft. Friction weg, wo sie Nutzer blockiert.

**Bezug:**
- Nielsen H5 (Fehlervermeidung), H9 (Hilfe bei Fehlern)
- Laws: Tesler's Law (Komplexität verlagern), Postel's Law (tolerant in Inputs)

**Fragen für Workshop:**
- Wo verlieren wir Nutzer im Funnel?
- Welche Fehler treten oft auf, die wir designseitig verhindern können?
- Was muss der Nutzer wissen, was nicht?

---

## 3. Feedback ist Beziehung

**Aussage:** Jede Aktion bekommt eine Reaktion. Schnell, klar, ehrlich.

**Bezug:**
- Nielsen H1 (Sichtbarkeit), H3 (Kontrolle und Freiheit), H9 (Fehler verstehen)
- Laws: Doherty Threshold (unter 400ms), Peak-End Rule

**Fragen für Workshop:**
- Wo lassen wir Nutzer warten ohne Erklärung?
- Können wir destruktive Aktionen rückgängig machen?
- Wie endet eine Session, wie endet ein Task?

---

## 4. Elemente priorisieren, nicht sammeln

**Aussage:** Eine Hierarchie pro View. Was ist primary, was secondary, was Background?

**Bezug:**
- Nielsen H4 (Konsistenz), H8 (Minimalismus)
- Laws: Von Restorff Effect, Law of Proximity, Serial Position, Pareto

**Fragen für Workshop:**
- Was ist die wichtigste Aktion auf dieser Seite?
- Wenn wir 30 Prozent der Elemente entfernen, was geht kaputt?
- Welche 20 Prozent der Features tragen 80 Prozent des Werts?

---

## 5. Kontinuierlich messen und verbessern

**Aussage:** UX ist kein Ship-and-Forget. Daten, Tests, Iteration.

**Bezug:**
- Nielsen H10 (Hilfe und Doku), aber vor allem Methodik
- Laws: Aesthetic-Usability Effect (schöner ≠ besser), Pareto

**Fragen für Workshop:**
- Welche Daten haben wir aktuell zu Nutzerverhalten?
- Wo testen wir, wo nehmen wir an?
- Was würden wir nach 4 Wochen Live messen wollen?

**Methoden im Backlog:**
- Heuristische Evaluation (intern)
- Moderated Testing (5 User reichen meist)
- Analytics-Funnels (siehe AARRR im Framework-Index)
- A/B-Tests bei genug Traffic
- Session-Recordings (Hotjar, FullStory, datenschutzkonform)

---

## Anwendung im Kunden-Kontext

**Im Pitch:**
"Wir arbeiten nach fünf Prinzipien. Klarheit vor Eleganz, Probleme lösen, Feedback ist Beziehung, Elemente priorisieren, kontinuierlich messen. Das ist die Brille, mit der wir jeden Screen anschauen."

**Im Workshop:**
Pro Prinzip 5 Minuten: aktuelle Beispiele aus dem Produkt, was funktioniert, was nicht. Output: priorisierte Hot-Spots.

**Im Audit-Report:**
Findings nach Prinzip clustern. Pro Prinzip 1 Headline, 3 bis 5 konkrete Findings, Severity, Fix.

---

## Was bewusst weggelassen wurde

- Accessibility als eigenes Prinzip. Sollte überall mitgedacht werden, gehört aber für seriöse Projekte in separate WCAG-Liste.
- Inklusivität und Diversität. Wichtig, aber kein Usability-Prinzip im engeren Sinn.
- Performance. Teilweise unter "Feedback ist Beziehung" abgedeckt (Doherty), für Tech-Lastige Projekte separat addieren.
