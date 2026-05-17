# Dark Patterns (Deceptive Patterns)

**Begriff:** Harry Brignull, 2010, deceptive.design (vormals darkpatterns.org)
**Quelle:** https://www.deceptive.design/types
**Verwendung:** Identifikation, Audit, Compliance-Check, ethische Bewertung von Interfaces.

> Dark Patterns sind UI-Entscheidungen, die Nutzer zu Aktionen gegen ihr eigenes Interesse verleiten. Nicht alles, was Friction reduziert, ist ein Dark Pattern. Aber alles, was Nutzer täuscht oder unter Druck setzt, ist eins.

---

## Regulatorischer Kontext (2026)

Dark Patterns sind kein reines UX-Thema mehr, sondern Compliance-relevant. Stand 2026:

**EU Digital Services Act (DSA), Art. 25:**
Verbot von "manipulativen Schnittstellen-Praktiken" für Online-Plattformen. Direkt einklagbar.

**EU AI Act (in Kraft, gestaffelte Anwendung):**
Verbot manipulativer KI-Systeme, die kognitive Verzerrungen ausnutzen, um Schaden zu verursachen (Art. 5). Relevant bei KI-gestützten Personalisierungen, Recommendation-Engines, Chatbots.

**EU Consumer Rights Directive (UCPD):**
Aggressive oder irreführende Geschäftspraktiken seit langem verboten. Wird zunehmend auch auf Dark Patterns angewendet (ECJ-Verfahren laufend).

**DSGVO Art. 7 und 4(11):**
"Freiwillige, spezifische, informierte und unmissverständliche" Einwilligung. Cookie-Banner mit prominenter "Accept All"-Lösung und verstecktem "Reject" sind seit mehreren Gerichtsurteilen (CNIL, DSK) unzulässig.

**Praktische Folge:** Dark-Pattern-Defense ist für jeden Audit Pflicht-Punkt, nicht Bonus. Bei B2B-Plattformen, SaaS, E-Commerce und KI-Produkten doppelt relevant.

---

## Taxonomie (nach Brignull 2010, ergänzt durch Mathur et al. 2019 und Gray et al. 2018)

### 1. Trick Questions
**Was:** Fragen, die durch Formulierung das Gegenteil bewirken, was der Nutzer erwartet.
**Beispiel:** "Ich möchte keine Newsletter nicht erhalten" Checkbox.
**Heuristik-Verstoß:** Nielsen H2 (Sprache der Nutzer), H5 (Fehlervermeidung).
**Fix:** Klare, eindeutige Formulierung. Doppelte Verneinung weg.

### 2. Sneak into Basket
**Was:** Zusätzliche Produkte werden ohne klare Zustimmung in den Warenkorb gelegt.
**Beispiel:** Versicherung beim Flugbuchungs-Checkout vorausgewählt.
**Regulatorisch:** UCPD-Verstoß, DSA-relevant.
**Fix:** Opt-in statt Opt-out für Zusatzleistungen.

### 3. Roach Motel (Hotel California)
**Was:** Anmeldung in 30 Sekunden, Kündigung in 30 Minuten oder gar nicht.
**Beispiel:** Premium-Abo per 1-Click, Kündigung nur per Brief.
**Regulatorisch:** In DE: Faires-Verbraucher-Vertraege-Gesetz schreibt Kündigungsbutton vor.
**Fix:** Symmetrie zwischen Anmeldung und Kündigung. Cancellation-Flow so einfach wie Onboarding.

### 4. Privacy Zuckering
**Was:** Mehr persönliche Daten teilen lassen, als der Nutzer beabsichtigt.
**Beispiel:** Standard-Privatsphäre-Einstellungen sind "alle Daten öffentlich".
**Regulatorisch:** DSGVO Art. 25 (Privacy by Default), bei Verstoß bußgeldbewehrt.
**Fix:** Privacy by Default. Datenschutz-Settings sichtbar, mit klaren Konsequenzen pro Option.

### 5. Price Comparison Prevention
**Was:** Preise oder Spezifikationen so darstellen, dass Vergleich erschwert wird.
**Beispiel:** Unterschiedliche Einheiten pro Produkt, fehlende Total-Preise, versteckte Gebühren.
**Regulatorisch:** Preisangabenverordnung (PAngV), seit 2022 verschärft.
**Fix:** Pro Einheit normalisierter Preis, Total inkl. aller Gebühren sichtbar vor Checkout.

### 6. Misdirection
**Was:** Aufmerksamkeit gezielt auf eine Option lenken, andere visuell schwächen.
**Beispiel:** "Continue"-Button bunt, "Decline"-Link grau und klein.
**Heuristik-Verstoß:** Nielsen H4 (Konsistenz). Verstoß gegen Law of Von Restorff.
**Fix:** Visuell gleichwertige Behandlung, wenn beide Optionen valide sind.

### 7. Hidden Costs
**Was:** Versteckte Gebühren oder Kosten erscheinen erst beim Checkout.
**Beispiel:** Versand, Bearbeitungsgebühr, Service-Charge.
**Regulatorisch:** UCPD-Verstoß, Abmahnrisiko in DE.
**Fix:** Total-Preis im Warenkorb, alle Gebühren transparent vor Final-Step.

### 8. Bait and Switch
**Was:** Eine Aktion führt zu einem anderen Ergebnis als beworben.
**Beispiel:** "X" zum Schließen eines Modals löst eigentlich Installation aus (Windows 10 Upgrade-Skandal 2016).
**Fix:** Erwartungs-Konsistenz. X schließt, kein Workaround.

### 9. Confirmshaming
**Was:** Ablehnung wird mit Scham oder Schuldgefühl belegt.
**Beispiel:** "Nein danke, ich will keine 20 Prozent sparen", "Ich bin nicht klug genug für diesen Deal".
**Fix:** Neutrale Ablehnungs-Optionen. "Nein danke" oder "Später" reicht.

### 10. Disguised Ads
**Was:** Werbung sieht aus wie Content oder Navigation.
**Beispiel:** Native Ads ohne klare Kennzeichnung, fake Download-Buttons auf Software-Sites.
**Regulatorisch:** Trennungsgebot Werbung/Content (MStV in DE, DSA in EU).
**Fix:** Klare Werbe-Kennzeichnung, "Anzeige" oder "Sponsored".

### 11. Forced Continuity
**Was:** Trial wird ohne Vorwarnung in kostenpflichtiges Abo überführt.
**Beispiel:** "Kostenlose Testphase" mit Kreditkarte, Abbuchung am Tag 31 ohne Erinnerung.
**Regulatorisch:** In DE/EU Hinweispflicht. Bei Vertragsverlängerung Information vor Abbuchung Pflicht.
**Fix:** Erinnerung vor Ablauf Trial, Opt-in statt Opt-out für die Verlängerung.

### 12. Friend Spam
**Was:** Kontakte des Nutzers werden ohne klare Zustimmung kontaktiert.
**Beispiel:** LinkedIn-Skandal 2015, Adressbuch-Zugriff für "Find Friends".
**Regulatorisch:** DSGVO-Verstoß für die kontaktierten Dritten.
**Fix:** Explizite, granulare Einwilligung pro Kontakt-Aktion.

---

## Erweiterungen aus Mathur et al. 2019

Empirische Studie von 11.000 Shopping-Sites. Ergänzende Pattern-Kategorien:

### 13. Sneaking
- **Hidden Subscription:** Abo-Charakter wird versteckt.
- **Hidden Costs:** Siehe oben.
- **Sneak into Basket:** Siehe oben.

### 14. Urgency
- **Countdown-Timer:** Fake oder ohne Konsequenz nach Ablauf.
- **Limited-Time-Messages:** "Nur noch heute" ohne echte Begrenzung.
- **Bezug:** Knappheits-Heuristik, Cialdini. Wird zum Dark Pattern, wenn die Knappheit konstruiert ist.

### 15. Scarcity
- **Low-Stock-Messages:** "Nur noch 2 verfügbar" ohne Datenbasis.
- **High-Demand-Messages:** "X andere schauen sich das gerade an" ohne Verifikation.
- **Test:** Verschiedene Browser, gleicher Zeitpunkt. Wenn Zahlen identisch oder zufällig: Fake.

### 16. Social Proof
- **Fake Testimonials, Fake Activity Notifications:** "Anna aus Berlin hat gerade gekauft" als generierte Nachricht.
- **Fix:** Verifizierte Reviews, transparente Quellen.

### 17. Obstruction
- **Roach Motel:** Siehe oben.
- **Price Comparison Prevention:** Siehe oben.
- **Intermediate Currency:** Echte Preise hinter Spiel-Währung verstecken (Lootboxen, In-Game-Purchases).

### 18. Forced Action
- **Forced Enrollment:** Account-Erstellung erzwingen, wo Guest-Checkout reichen würde.
- **Forced Disclosure:** Mehr Daten als nötig.
- **Gamification mit Pflicht-Charakter:** Streak-Mechaniken, die Verlust drohen.

---

## Audit-Checkliste (für ux-review Skill)

Beim Audit jedes Interface gegen diese 6 Cluster prüfen:

1. **Asymmetrie** zwischen Anmeldung/Kündigung, Kauf/Retoure, Opt-in/Opt-out?
2. **Versteckte Kosten oder Konsequenzen** (Preise, Daten, Abo-Charakter)?
3. **Manipulierte Aufmerksamkeit** (Misdirection, Confirmshaming, Visual Bias)?
4. **Konstruierte Knappheit oder Dringlichkeit** ohne Datenbasis?
5. **Erzwungenes Verhalten** (Forced Enrollment, Forced Continuity, Friend Spam)?
6. **Privacy-Defaults** entsprechen DSGVO Art. 25 (Privacy by Default)?

Pro Verstoß dokumentieren:
- Pattern-Name (z.B. "Confirmshaming")
- Heuristik-Verstoß (welche Nielsen-H verletzt)
- Regulatorischer Bezug (welcher EU-Akt potenziell)
- Schwere: kritisch (Compliance), hoch (Conversion-Schaden), mittel (Vertrauen), niedrig (Stilfrage)
- Fix-Vorschlag

---

## Abgrenzung: Was ist KEIN Dark Pattern

- **Reduzierte Optionen** (Hick's Law) ist Hilfestellung, nicht Manipulation, solange die wichtigen Optionen erreichbar bleiben.
- **Defaults** sind nicht per se manipulativ. Aber sie müssen im Interesse des Nutzers sein und reversibel.
- **Persuasive Design** (Fogg) für gewünschtes Verhalten (z.B. gesünder essen, mehr lernen) ist legitim, solange das Ziel mit dem Nutzer-Interesse übereinstimmt.
- **Friction an destruktiven Stellen** (Bestätigung vor Löschung) ist Schutz, nicht Pattern.

**Faustregel:** Wenn der Nutzer rückblickend genauso entschieden hätte, wenn er die Konsequenz vorher gewusst hätte, ist es kein Dark Pattern. Wenn er sich getäuscht oder unter Druck gesetzt fühlt, ist es eins.

---

## Verhältnis zu anderen Quellen

- Spiegelt [nielsen-heuristics](nielsen-heuristics.md) in der negativen Form
- Nutzt [laws-of-ux](laws-of-ux.md) manipulativ (Goal-Gradient, Scarcity, Zeigarnik, Peak-End)
- Für Kunden-Kommunikation auf [ux-grundprinzipien](ux-grundprinzipien.md) zurückführen
