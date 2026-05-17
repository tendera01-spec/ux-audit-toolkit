# Compliance Quick-Reference

Schnelle Übersicht über die Compliance-Rahmen, die in UX- und A11y-Audits relevant sind. Keine Rechtsberatung, Arbeitsmaterial. Bei konkreten Fragen Fachanwalt.

---

## EU-weit

### Digital Services Act (DSA)
- **Volltext:** Verordnung (EU) 2022/2065
- **In Kraft seit:** 17. Februar 2024 für alle Online-Plattformen
- **Art. 25:** Verbot manipulativer Schnittstellen-Praktiken ("Online-Plattformen dürfen ihre Online-Schnittstellen weder so gestalten, organisieren noch betreiben, dass dies Nutzer täuscht, manipuliert oder anderweitig deren Fähigkeit, freie und informierte Entscheidungen zu treffen, wesentlich beeinträchtigt.")
- **Audit-Relevanz:** Dark Patterns 1:1 betroffen. Confirmshaming, Misdirection, Sneak-Patterns.

### AI Act (EU)
- **Volltext:** Verordnung (EU) 2024/1689
- **Anwendung:** Gestaffelt, Hauptverbote ab 2. Februar 2025
- **Art. 5(1)(a):** Verbot von KI-Systemen, die unterschwellige Techniken oder gezielt manipulative oder täuschende Techniken einsetzen
- **Audit-Relevanz:** KI-gestützte Personalisierungen, Recommender, Chatbots. Dark Patterns mit KI-Komponente sind kritisch.

### DSGVO (GDPR)
- **Volltext:** Verordnung (EU) 2016/679
- **In Kraft seit:** 25. Mai 2018
- **Art. 7:** Bedingungen für die Einwilligung (freiwillig, spezifisch, informiert, unmissverständlich)
- **Art. 25:** Datenschutz durch Technikgestaltung und durch datenschutzfreundliche Voreinstellungen (Privacy by Default)
- **Audit-Relevanz:** Cookie-Banner mit Accept-All-Asymmetrie, vorausgewählte Opt-ins, Privacy Zuckering.

### European Accessibility Act (EAA)
- **Volltext:** Richtlinie (EU) 2019/882
- **In Kraft seit:** 28. Juni 2025 EU-weit
- **Umsetzung:** Durch nationale Gesetze
- **Standard:** WCAG 2.1 AA als Mindest-Anforderung (in der Praxis), WCAG 2.2 AA empfohlen
- **Audit-Relevanz:** Alle B2C-Plattformen, E-Commerce, Banken, Verkehr, Telekom, E-Books, audiovisuelle Mediendienste

### Unfair Commercial Practices Directive (UCPD)
- **Volltext:** Richtlinie 2005/29/EG
- **Audit-Relevanz:** Hidden Costs, Sneak into Basket, Bait and Switch. EU-weit Verbraucherschutz.

---

## Deutschland

### Barrierefreiheitsstärkungsgesetz (BFSG)
- **In Kraft seit:** 28. Juni 2025
- **Standard:** WCAG 2.1 AA Mindest, geregelt durch BFSGV
- **Geltungsbereich:** Webseiten und Apps mit B2C-Komponente, ausgenommen Kleinstunternehmen (<10 MA und <2 Mio. Euro Umsatz) für Dienstleistungen
- **Pflichten:** Konformität, Erklärung zur Barrierefreiheit, Feedback-Mechanismus
- **Sanktionen:** Geldbußen bis 100k Euro pro Verstoß

### Telekommunikation-Telemedien-Datenschutz-Gesetz (TTDSG)
- **In Kraft seit:** 1. Dezember 2021
- **Audit-Relevanz:** Cookie-Consent muss aktiv eingeholt werden (außer technisch notwendig). Default-Häkchen unzulässig.

### Preisangabenverordnung (PAngV)
- **Audit-Relevanz:** Total-Preise transparent, Grundpreise bei vergleichbaren Produkten, keine versteckten Gebühren.

### Faire-Verbraucherverträge-Gesetz
- **In Kraft seit:** 1. Juli 2022
- **Audit-Relevanz:** Kündigungs-Button für Online-Verträge Pflicht (1-Klick im Footer). Roach-Motel-Patterns unzulässig.

---

## Andere Märkte (Kurzüberblick)

| Land | Gesetz | Standard | Audit-Relevanz |
|------|--------|----------|----------------|
| USA | ADA Title III, Section 508 | WCAG 2.1 AA / 2.0 AA | Federal, Education, Healthcare |
| USA | FTC Act Section 5 | n/a | Dark Patterns Enforcement |
| Kanada | AODA (Ontario), ACA (Federal) | WCAG 2.1 AA | Public + Private Sector |
| UK | Equality Act 2010 | WCAG 2.2 AA empfohlen | Diskriminierungs-Klagen möglich |
| Frankreich | RGAA 4.1 / Décret 2023-931 | WCAG 2.1 AA Adaption | Public + B2C |
| Spanien | RD 193/2023 | EN 301 549 | Public Sector |

---

## Pragmatische Heuristik für Audits

1. **B2C-Komponente?** Wenn ja, Compliance-Lage prüfen (BFSG, EAA, DSA, UCPD).
2. **EU-Markt?** DSGVO und DSA sind immer relevant. AI Act wenn KI-System.
3. **US-Markt?** ADA und Section 508 relevant. FTC für Dark Patterns.
4. **Kleinstunternehmen-Ausnahme?** Nur für BFSG-Dienstleistungen. Für Produkte und für DSA gilt sie nicht.
5. **Bestandsprodukt?** Übergangsfristen prüfen (BFSG bis 2030 für Bestandsverträge).

---

## Was tun, wenn unklar

- Bei größeren Risiken: Fachanwalt für IT-Recht oder Datenschutz konsultieren.
- Bei Compliance-Anfragen aus dem Sales: dokumentieren, nicht raten.
- Bei US-Procurement: VPAT 2.5 anlegen, nicht improvisieren.

---

## Quellen

- EUR-Lex (https://eur-lex.europa.eu) für EU-Texte
- Gesetze im Internet (https://www.gesetze-im-internet.de) für DE-Texte
- W3C Web Accessibility Initiative (https://www.w3.org/WAI/) für WCAG
- ITI (https://www.itic.org/policy/accessibility/vpat) für VPAT
