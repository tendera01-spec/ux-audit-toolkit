# Laws of UX

**Kurator:** Jon Yablonski (lawsofux.com), Buch "Laws of UX" (O'Reilly, 2020)
**Quelle:** https://lawsofux.com/
**Verwendung:** Psychologische Linse. Erklärt warum Heuristik-Verstöße wirken oder Verhalten so läuft, wie es läuft.

> Heuristiken sagen was schief läuft. Laws of UX erklären warum. Beide zusammen ergeben Diagnose plus Mechanismus.

---

## Aufmerksamkeit und Wahrnehmung

### Hick's Law
**Definition:** Entscheidungszeit wächst logarithmisch mit Anzahl und Komplexität der Optionen.
**Quelle:** Hick 1952, Hyman 1953
**Anwendung:** Menüs, Onboarding-Schritte, Pricing-Tabellen. Optionen reduzieren oder gruppieren.
**Fallstrick:** Nicht radikal kürzen, wenn Power-User Granularität brauchen. Progressive Disclosure.

### Fitts's Law
**Definition:** Zeit für eine Zielbewegung ist eine Funktion aus Distanz und Größe des Ziels.
**Quelle:** Fitts 1954
**Anwendung:** CTAs groß und nah am Cursor. Mobile: Touch-Targets mindestens 44x44 Pixel (Apple HIG), 48x48 (Material).
**Implikation:** Destruktive Buttons absichtlich kleiner oder weiter weg vom Primary-CTA.

### Miller's Law
**Definition:** Kurzzeitgedächtnis hält ca. 7 plus/minus 2 Einheiten. Heute eher 4 plus/minus 1 (Cowan 2001).
**Anwendung:** Chunking. Telefonnummern, IBANs, Onboarding-Schritte gruppieren. Keine Navigation mit 12 Top-Level-Items.

### Aesthetic-Usability Effect
**Definition:** Nutzer empfinden ästhetisch ansprechende Designs als nutzbarer, auch wenn sie es objektiv nicht sind.
**Quelle:** Kurosu & Kashimura 1995, repliziert mehrfach
**Implikation für Audits:** Hübsches Design verzeiht Usability-Schwächen. Auch der Umkehrschluss gilt: schlecht designte Interfaces werden härter beurteilt als sie objektiv sind.
**Vorsicht:** Kein Freibrief für schlechte Usability. Bei Stress oder Fehlerlast bricht der Effekt zusammen.

### Von Restorff Effect (Isolation Effect)
**Definition:** Was sich von der Umgebung abhebt, wird besser erinnert.
**Anwendung:** Primary-CTA visuell singulär, kritische Warnungen kontrastreich, Highlights sparsam.
**Fallstrick:** Wenn alles hervorgehoben ist, wirkt nichts.

### Law of Proximity
**Definition:** Objekte, die nah beieinander stehen, werden als Gruppe wahrgenommen (Gestaltgesetz).
**Anwendung:** Form-Labels nah am Input, Buttons klar getrennt von Body-Content, Gruppierung durch Whitespace statt Borders.

### Law of Common Region
**Definition:** Elemente in einem gemeinsamen visuellen Container werden gruppiert wahrgenommen.
**Anwendung:** Cards, Sections mit Background, Borders.

### Law of Similarity
**Definition:** Visuell ähnliche Elemente werden als zusammengehörig gesehen.
**Anwendung:** Konsistente Button-Styles für gleiche Funktionen, Icons mit einheitlichem Stil.

### Law of Prägnanz (Gestalt: Gute Form)
**Definition:** Das Gehirn interpretiert komplexe Bilder so einfach wie möglich.
**Anwendung:** Reduzierte Icons, klare Layouts, weniger Linien und Boxen.

### Jakob's Law
**Definition:** Nutzer verbringen die meiste Zeit auf anderen Sites. Sie erwarten, dass deine Site funktioniert wie die, die sie kennen.
**Quelle:** Jakob Nielsen
**Implikation:** Konventionen nicht ohne Grund brechen. Innovation an der Stelle, wo sie Wert schafft, nicht im Footer-Layout.

---

## Verhalten und Entscheidung

### Doherty Threshold
**Definition:** Produktivität steigt deutlich, wenn die Antwortzeit eines Systems unter 400ms liegt.
**Quelle:** Doherty & Thadhani 1982 (IBM)
**Anwendung:** Performance-Budget setzen, Optimistic UI, Skeleton-Loader, Caching.

### Peak-End Rule
**Definition:** Menschen erinnern Erlebnisse anhand des emotionalen Höhepunkts und des Endes, nicht des Durchschnitts.
**Quelle:** Kahneman & Fredrickson 1993
**Anwendung:** Onboarding-Ende, Checkout-Bestätigung, Empty-States nach Aktionen besonders gestalten. Erste Erfolgserlebnisse früh ermöglichen (Aha-Moment).

### Serial Position Effect (Primacy and Recency)
**Definition:** Erstes und letztes Item einer Liste werden am besten erinnert.
**Anwendung:** Navigation: wichtigste Items zuerst und zuletzt. Nicht in die Mitte verstecken.

### Zeigarnik Effect
**Definition:** Unterbrochene Aufgaben werden besser erinnert als abgeschlossene.
**Anwendung:** Progress-Indikatoren ("3 von 5 Schritten"), "Profil zu 80 Prozent vollständig", offene To-do-Liste.
**Fallstrick:** Künstliche Unvollständigkeit als Dark Pattern (siehe [dark-patterns](dark-patterns.md)).

### Goal-Gradient Effect
**Definition:** Motivation steigt mit Nähe zum Ziel.
**Anwendung:** Progress-Bars, Punktekarten (Kaffee Nr. 9 von 10), Onboarding-Endspurt mit kürzeren Schritten.

### Tesler's Law (Law of Conservation of Complexity)
**Definition:** Jedes System hat ein nicht reduzierbares Maß an Komplexität. Frage ist nur, wer es trägt: Nutzer oder System.
**Anwendung:** Komplexität ins Backend pushen, nicht ins Frontend. Smart Defaults statt 20 Settings.

### Postel's Law (Robustness Principle)
**Definition:** Sei konservativ in dem, was du sendest, liberal in dem, was du akzeptierst.
**Anwendung:** Input-Felder tolerant (Telefonnummern mit oder ohne Leerzeichen), Outputs strikt.

### Pareto Principle (80/20)
**Definition:** 80 Prozent der Wirkung kommt aus 20 Prozent der Ursachen.
**Anwendung:** Welche 20 Prozent der Features nutzen 80 Prozent der User? Dort Energie. Long Tail nicht zum Hauptfokus machen.

### Parkinson's Law
**Definition:** Arbeit dehnt sich auf die zur Verfügung stehende Zeit aus.
**Anwendung:** Defaults setzen, Time-Boxing in Tools, Erinnerungen mit Deadline.

### Occam's Razor
**Definition:** Die einfachste Erklärung ist meist die richtige.
**Anwendung:** Feature-Reduktion, unnötige Settings entfernen, Standard-Lösungen vor Custom.

---

## Sozial und Kontext

### Chunking
**Definition:** Information in kleinere, verarbeitbare Einheiten brechen (verwandt mit Miller's Law).
**Anwendung:** Forms in Sektionen, Telefonnummern in 3er- oder 4er-Gruppen, lange Texte mit Zwischenüberschriften.

### Cognitive Load
**Definition:** Mentale Anstrengung beim Erfüllen einer Aufgabe. Drei Typen: intrinsic, extraneous, germane.
**Anwendung:** Extraneous Load reduzieren (visuelle Klarheit, weniger Optionen, klare Pfade). Germane Load gezielt nutzen für Lerneffekte.

---

## Anwendung im Audit

1. Beobachtetes Verhalten oder Problem aus dem Interface.
2. Passendes Law identifizieren als Erklärung.
3. Verstoß und Wirkung dokumentieren.
4. Fix-Vorschlag entlang des Mechanismus.

**Beispiel:**
"User bricht beim Checkout ab. Hick's Law: 12 Payment-Optionen blockieren Entscheidung. Empfehlung: Top 3 prominent, Rest unter 'weitere Optionen'."

---

## Verhältnis zu anderen Quellen

- Ergänzt [nielsen-heuristics](nielsen-heuristics.md) mit dem Warum
- Wird in [ux-grundprinzipien](ux-grundprinzipien.md) auf Kunden-Sprache reduziert
- Manche Laws (Goal-Gradient, Zeigarnik, Peak-End) werden in [dark-patterns](dark-patterns.md) missbraucht
