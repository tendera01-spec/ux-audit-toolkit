# Nielsen Heuristiken (10 Usability-Prinzipien)

**Autor:** Jakob Nielsen, Nielsen Norman Group
**Erstveröffentlichung:** 1994, letzte Revision 2020
**Quelle:** https://www.nngroup.com/articles/ten-usability-heuristics/
**Verwendung:** Heuristische Evaluation von Interfaces. Linse, keine Checkliste.

> Eine heuristische Evaluation ist diagnostisch. Sie ersetzt keinen User-Test, sie findet Probleme schneller. Erwartung: 3 bis 5 Reviewer finden zusammen ca. 75 Prozent der Usability-Probleme.

---

## H1: Sichtbarkeit des Systemstatus

**Prinzip:** Das System informiert Nutzer durch passendes Feedback in angemessener Zeit darüber, was gerade passiert.

**Typische Verstöße:**
- Klick ohne Reaktion (kein Loader, kein Hover-State)
- Speichern ohne Bestätigung
- Lange Operationen ohne Fortschrittsanzeige
- Unklarer Login-Status nach Authentifizierung

**Fix-Muster:** Loading-States, Progress-Bars, Toast-Notifications, sichtbare Navigation des aktuellen Schritts, Hover- und Active-States.

---

## H2: Übereinstimmung zwischen System und realer Welt

**Prinzip:** Sprache der Nutzer verwenden, nicht System-Sprache. Konventionen aus dem Alltag respektieren.

**Typische Verstöße:**
- Technische Fehlermeldungen ("Error 500", "Null pointer exception")
- Fachjargon im Onboarding
- Icons ohne erkennbare Metapher
- Kalender-UI, die Wochenstart anders als regional üblich zeigt

**Fix-Muster:** Nutzersprache aus Interviews und Support-Tickets sammeln, Icons mit Labels, Fehlermeldungen in Klartext.

---

## H3: Nutzerkontrolle und Freiheit

**Prinzip:** Nutzer brauchen einen klaren "Notausgang" für versehentliche Aktionen. Undo, Redo, Abbrechen.

**Typische Verstöße:**
- Keine Undo-Funktion
- Bestätigungsdialoge, die nicht zurückgehen lassen
- Modale ohne sichtbares Close
- Irreversible Aktionen ohne Undo (Mail-Versand, Datei-Löschung)

**Fix-Muster:** Undo statt Bestätigungsdialog (Gmail-Modell), Soft-Delete, Cancel-Button neben jedem destruktiven CTA.

---

## H4: Konsistenz und Standards

**Prinzip:** Nutzer sollen nicht raten müssen, ob verschiedene Wörter, Situationen oder Aktionen dasselbe bedeuten. Plattform- und Industrie-Konventionen folgen.

**Typische Verstöße:**
- Buttons mit identischer Beschriftung, aber unterschiedlicher Wirkung
- Inkonsistente Terminologie (mal "Konto", mal "Profil", mal "User")
- Verstoß gegen Plattform-Konventionen (z.B. ungewohnte iOS-Navigation)
- Wechselnde Icon-Stile

**Fix-Muster:** Design-System, Glossar, Plattform-Guidelines (HIG, Material) prüfen.

---

## H5: Fehlervermeidung

**Prinzip:** Fehler verhindern ist besser als gute Fehlermeldungen. Risikoreiche Aktionen absichern.

**Typische Verstöße:**
- Datumsfelder, die ungültige Daten akzeptieren
- Forms ohne Inline-Validierung
- Lösch-Buttons direkt neben Speichern
- Auto-Submit bei Enter ohne Bestätigung

**Fix-Muster:** Inline-Validierung, Constraints im Input (Date-Picker statt Freitext), Bestätigung nur bei wirklich destruktiven Aktionen, sichere Defaults.

---

## H6: Erkennen statt Erinnern

**Prinzip:** Objekte, Aktionen und Optionen sichtbar machen. Nutzer sollen nicht Informationen aus einem Teil des Dialogs in einen anderen merken müssen.

**Typische Verstöße:**
- Komplexe Codes, die der Nutzer abschreiben muss
- Tutorials ohne Wiederholbarkeit
- Suchbegriff geht beim Filtern verloren
- Form-Inhalte beim Tab-Wechsel verloren

**Fix-Muster:** Autocomplete, sichtbare Auswahl, Breadcrumbs, persistente Filter, recently used.

---

## H7: Flexibilität und Effizienz

**Prinzip:** Shortcuts für Power-User, ohne Anfänger zu verwirren. Personalisierung erlauben.

**Typische Verstöße:**
- Keine Keyboard-Shortcuts in Produktivitäts-Tools
- Keine Bulk-Aktionen
- Wiederholte Schritte ohne Save-as-Template
- Keine Suche in langen Listen

**Fix-Muster:** Shortcut-Cheatsheet, Bulk-Edit, Templates, Saved Views, Command-Palette (Cmd+K).

---

## H8: Ästhetisches und minimalistisches Design

**Prinzip:** Dialoge enthalten keine irrelevanten oder selten benötigten Informationen. Jede zusätzliche Information konkurriert um Aufmerksamkeit.

**Typische Verstöße:**
- Überladene Dashboards
- Tooltip-Erklärungen, die das Eigentliche verdecken
- Stock-Bilder ohne Funktion
- Zu viele CTAs auf einer Seite

**Fix-Muster:** Progressive Disclosure, klare visuelle Hierarchie, ein Primary-CTA pro View, Daten-Tinten-Ratio prüfen.

---

## H9: Hilfe beim Erkennen, Verstehen und Beheben von Fehlern

**Prinzip:** Fehlermeldungen in Klartext (kein Error-Code), das Problem benennen, eine Lösung vorschlagen.

**Typische Verstöße:**
- "Ein Fehler ist aufgetreten"
- Fehler-Code ohne Erklärung
- Validierungsfehler erst nach Submit, nicht inline
- Keine Anleitung, was als Nächstes zu tun ist

**Fix-Muster:** "Das Passwort braucht mindestens 8 Zeichen. Bitte ergänzen." statt "Validation failed". Inline-Validierung, klare Recovery-Pfade.

---

## H10: Hilfe und Dokumentation

**Prinzip:** Auch wenn das System idealerweise selbsterklärend ist, kann Doku nötig sein. Sie soll auffindbar, aufgabenorientiert und kurz sein.

**Typische Verstöße:**
- Versteckte oder fehlende Hilfe
- Doku als PDF statt searchable
- Kein Kontext-Hilfe-Button
- Veraltete Screenshots

**Fix-Muster:** Inline-Hilfe (Tooltips, "Was ist das?"), durchsuchbare Knowledge Base, Empty States als Erklärung, Onboarding-Tour.

---

## Anwendung als Reviewer

**Schritt 1:** Interface in Use-Cases zerlegen (Onboarding, Kern-Task, Recovery, Settings).
**Schritt 2:** Pro Use-Case alle 10 Heuristiken durchgehen.
**Schritt 3:** Jeden Verstoß dokumentieren als: Heuristik, Beschreibung, Screenshot, Schwere (kritisch, hoch, mittel, niedrig), Fix-Vorschlag.
**Schritt 4:** Severity-Ranking nach Nielsen:
- 0: Kein Problem
- 1: Kosmetisch, optional fixen
- 2: Klein, niedrige Priorität
- 3: Groß, hohe Priorität
- 4: Katastrophe, vor Release fixen

---

## Verhältnis zu anderen Quellen

- Erweiterung durch [laws-of-ux](laws-of-ux.md) (psychologische Erklärung)
- Übersetzung für Kunden in [ux-grundprinzipien](ux-grundprinzipien.md)
- Anti-Pattern-Spiegel in [dark-patterns](dark-patterns.md)
