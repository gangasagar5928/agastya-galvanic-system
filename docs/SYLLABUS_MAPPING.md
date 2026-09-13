# EEE Framework — The "New POV"

**Project:** The Agastya Galvanic System · **Date:** 2026-09-11

> **Project Title:** A Biodegradable, Non-Lithium Earthen Solid-State Primary Battery with Sub-Volt Energy Harvesting for Disposable Off-Grid Micro-Sensors.

---

## 1. How This Project Fits the EEE Syllabus

| EEE Domain | Where this project engages | Educational output |
|---|---|---|
| **1. Energy Storage Systems & Materials** | Investigating primary non-toxic energy storage alternatives to toxic lithium and lead chemistries | Comparative material study: terracotta/sawdust/copper/zinc vs Li-ion/Pb-acid; environmental life-cycle thinking; TiO₂-free battery architecture |
| **2. Power Electronics** | Designing ultra-low-input synchronous boost regulators and impedance-matching converters for low-power sources | Cold-start circuit design, synchronous rectification, efficiency/optimization, PFM/PWM control, small-signal stability with high source impedance |
| **3. Electrochemical Engineering** | Analyzing polarization curves, overpotential losses, internal ohmic resistance (R_int), and Faradaic efficiency | Nernst analysis, electrode kinetics (Butler–Volmer concepts), impedance extraction, Faraday's law gas accounting, yielded experimental curves |

---

## 2. Syllabus Learning Objectives → Project Deliverables

| # | Syllabus outcome | Project artifact proving it |
|---|---|---|
| L1 | Compare energy storage chemistries by eco-footprint | `docs/ELECTROCHEM.md` §1, `wiki.md` material table, BOM sustainability notes |
| L2 | Design a DC–DC power stage for a low-power source | `docs/PMIC.md` (IC selection, schematic, efficiency budget) + Phase 2 hardware |
| L3 | Measure and interpret electrochemical cell behaviour | `docs/ELECTROCHEM.md` §6 polarization curve + `data/` logs |
| L4 | Compute and validate Faradaic efficiency | `docs/ELECTROLYZER.md` §6 + `data/electrolyzer/` |
| L5 | Quantify and minimize internal resistance | R_int extraction from I-V slope; impedance-matched PMIC (§ claim 2) |
| L6 | Communicate engineering results formally | `docs/REPORT.md`, `docs/PRESENTATION.md`, wiki as living index |

---

## 3. The "New POV" — Beyond a Standard Daniell Cell

| Dimension | Standard Daniell cell | This project (New POV) |
|---|---|---|
| Separator | Porous pot / paper / frit | **Lignocellulose capillary matrix in porous terracotta wall** |
| Electrolyte management | Liquid, gravity-fed | **Immobilized saturated CuSO₄ in sawdust** |
| Internal short risk | Dendrite + crossover failures common | **Dendrite-retardant matrix as claimed device** |
| Application | Education / classic primary cell | **Disposable off-grid micro-sensor power** |
| Power interface | Raw analogue, unregulated | **5.0 V regulated rail via sync boost, impedance matched** |
| Downstream use | — | **On-site hydrogen via micro-electrolyzer, no secondary battery** |
| End-of-life | Discarded electrolyte, metal waste | **Biodegradable matrix with chemical cementation of copper waste** |
| Cultural anchor | European 19th-century chemistry | **Agastya Samhita lineage — traditional knowledge inspiration for sustainable architecture** |
---

## 4. Sustainability Scorecard (vs Lithium & Lead)

| Criterion | Li-ion | Pb-acid | **This project** |
|---|---|---|---|
| Electrolyte | Organic carbonate + LiPF₆ (toxic, flammable) | 30–40 % H₂SO₄ (corrosive) | Aqueous CuSO₄ (aquatic ecotoxin, neutralized via scrap iron) |
| Metals | Li, Co, Ni (mining + geopolitics) | Pb (neurotoxin) | Cu, Zn (common, recyclable) |
| End of life | Special recharge-collection programs | Hazmat collection | Terracotta → pottery waste; sawdust → compost; Cu/Zn → scrap |
| Recyclability | Complex (~5 % energy recovery) | 95 %+ (established) | High (simple separation) |
| Rechargeability | Yes | Yes | **No (primary by design — the point)** |
| Fit for disposable μSensors | Over-engineered, cost-heavy | Hazard + weight | **Optimal (low-cost, lead/lithium-free, single-use)** |

---

## 5. Mapping to Evaluation Rubric (if applicable)

| Rubric item | Evidence |
|---|---|
| Technical correctness | `docs/ELECTROCHEM.md`, `docs/PMIC.md`, `docs/ELECTROLYZER.md` |
| Novelty & innovation | `docs/ARCHITECTURE.md` & `docs/ELECTROCHEM.md` — non-obvious separator + integrated package |
| Sustainability & ethics | wiki Sustainability Scorecard; SAFETY discipline; traditional-knowledge respect |
| Practical execution | `ROADMAP.md` phases, `data/` evidence, `tools/` analysis scripts |
| Communication | Wiki, report, presentation Q&A bank |

---

## 6. Thesis-One Paragraph (the "New POV" statement)

> This project reframes the 19th-century Daniell cell through an ancient Indian electrochemistry lens and a modern power-electronics lens: it replaces the liquid-electrolyte, porous-pot architecture with a **dendrite-retardant lignocellulose-terracotta composite**, couples the resulting high-impedance earthen source to a **sub-volt cold-start synchronous boost converter matched to the cell's internal impedance**, and drives a **graphite micro-electrolyzer** to produce measurable hydrogen — all in a **biodegradable, non-lithium, single-use package** aimed at disposable off-grid micro-sensors. It is sustainability and cultural heritage applied to modern micro-power engineering.

---

*This mapping should be included in the report introduction and any viva defence framing.*