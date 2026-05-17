# Sample Audit: SaaS-Onboarding (anonymisiert)

**Auditor:** ux-audit-toolkit (Skill: ux-review)
**Datum:** 2026-04-15 (anonymisiertes Beispiel)
**Standard:** Nielsen-Heuristiken, Laws of UX, Dark-Pattern-Taxonomie
**Scope:** Sign-up + Onboarding-Flow eines B2B-SaaS-Tools, 7 Screens
**Methodik:** Heuristisches Audit nach ux-review SKILL

> Hinweis: Dieses Audit ist ein Sample. Produktname, Screenshots und Personen-Daten wurden entfernt oder generalisiert.

---

## Executive Summary

1. Drei Compliance-Risiken (DSGVO-Cookie-Consent, fehlende Privacy-Defaults) müssen vor weiterem Rollout gefixt werden.
2. Onboarding hat einen klaren Hick's-Law-Verstoß (zu viele Workspace-Optionen direkt nach Sign-up) und einen Peak-End-Bruch (kein Success-Moment nach Setup).
3. Zwei Dark-Pattern-Verstöße (Confirmshaming bei Notification-Opt-out, asymmetrische Account-Löschung) sind 1:1 Reputation-Risiken.
4. UI-Kontraste auf zwei Buttons unter Best-Practice, aber nicht WCAG-Verstoß (Cross-Check mit accessibility-audit empfohlen).
5. Empfohlene Fix-Reihenfolge: Compliance zuerst, dann Onboarding-Friction, dann Dark Patterns, dann Polishing.

## Kontext und Methodik

**Was untersucht:** Sign-up-Form, E-Mail-Bestätigung, Workspace-Auswahl, Tour-Modal, erste Aufgabe, Notification-Opt-in, Settings-Bereich

**Wie:** Drei-Linsen-Audit pro Screen (Nielsen, Laws of UX, Dark Patterns)

**Nicht im Scope:** Accessibility (separater Audit empfohlen), Performance, Visual-Design-Kritik

## Findings nach Severity

### Kritisch (Compliance-Risiken)

| ID | Pattern | Stelle | Beschreibung | Fix | Aufwand |
|----|---------|--------|--------------|-----|---------|
| C001 | Dark-Pattern: Privacy Zuckering | Settings → Notifications | Default = alle E-Mails an, kein Hinweis auf Profiling-Opt-out | Privacy by Default: alle Opt-ins explizit, Profiling als separates Opt-in | M |
| C002 | DSGVO Art. 7 | Cookie-Banner | "Accept All" prominent, "Reject" nur über "Settings" erreichbar | Symmetrische Buttons, "Reject All" auf erster Ebene | S |
| C003 | DSA Art. 25 | Sign-up-Form | "Marketing-E-Mails" mit Default-Häkchen | Default unset, Opt-in explizit | S |

### Hoch (Conversion-Risiken)

| ID | Pattern | Stelle | Beschreibung | Fix | Aufwand |
|----|---------|--------|--------------|-----|---------|
| H001 | Hick's Law | Workspace-Auswahl | 12 Workspace-Templates gleichrangig auf einem Screen | Top 3 prominent ("Starter", "Team", "Custom"), Rest unter "Mehr Optionen" | M |
| H002 | Peak-End Rule | Setup-Abschluss | Kein Success-Moment nach Onboarding, direkt Dashboard mit Zero-State | "Du bist startklar" Banner plus Empfehlung: erste Aktion | S |
| H003 | Nielsen H1 (Sichtbarkeit) | E-Mail-Bestätigung | Kein Hinweis, wo die Bestätigungs-Mail hingeschickt wurde, kein "Resend"-Button | "Bestätigung an x@y.com gesendet. Nicht erhalten? Erneut senden." | S |

### Mittel (UX-Reibung)

| ID | Pattern | Stelle | Beschreibung | Fix | Aufwand |
|----|---------|--------|--------------|-----|---------|
| M001 | Nielsen H4 (Konsistenz) | Buttons | Primary-CTA wechselt zwischen Steps zwischen Blau und Lila | Design-Token im Component-Lib durchsetzen | S |
| M002 | Confirmshaming (Dark Pattern) | Notification-Opt-out | "Nein, ich will keine wichtigen Updates verpassen" als Decline-Label | Neutral: "Nicht jetzt" oder "Später entscheiden" | S |
| M003 | Nielsen H9 (Fehlerhilfe) | Sign-up-Form | "Ungültiges Format" ohne Hinweis was gültig wäre | Inline-Beispiel: "z.B. name@firma.de" | S |

### Niedrig (Polishing)

| ID | Pattern | Stelle | Beschreibung | Fix | Aufwand |
|----|---------|--------|--------------|-----|---------|
| L001 | Nielsen H8 (Minimalismus) | Tour-Modal | 5 Bullet-Points, davon 2 wiederholen sich | Reduziere auf 3 prägnante Punkte | S |
| L002 | Fitts's Law | Mobile Touch-Targets | Sekundäre Links unter 32 Pixel Höhe | Mind. 44 Pixel Touch-Target | S |

## Compliance-Risiken (Zusammenfassung)

- **DSGVO Art. 7 (informierte Einwilligung):** C002, C003
- **DSA Art. 25 (manipulative Schnittstellen):** C003 (vorausgewähltes Marketing-Opt-in)
- **Privacy by Default (DSGVO Art. 25):** C001

Risikoeinschätzung: Bei einer Beschwerde nach DSA ist die Plattform-Verantwortlichkeit gegeben. Bußgeldrisiko bei DSGVO-Verstoß bis 4 Prozent Jahresumsatz.

## Empfohlene Reihenfolge

1. **Diese Woche (Compliance):** C002, C003, C001
2. **Nächster Sprint (Conversion):** H001, H002, H003
3. **In den nächsten 4 Wochen (Vertrauen):** M002, M003, M001
4. **Polishing-Backlog:** L001, L002

## Quellen

- Nielsen, J. (2020). 10 Usability Heuristics for User Interface Design. NN/g.
- Yablonski, J. (2020). Laws of UX. O'Reilly.
- Brignull, H. (2010). Deceptive Design Taxonomy.
- EU (2022). Digital Services Act, Verordnung (EU) 2022/2065.
- EU (2016). DSGVO, Verordnung (EU) 2016/679.
