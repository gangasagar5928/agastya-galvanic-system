# The Agastya Galvanic System — Project Wiki

> **A Biodegradable, Non-Lithium Earthen Solid-State Primary Battery with Sub-Volt Energy Harvesting for Disposable Off-Grid Micro-Sensors**
>
> Academic Year 2026 · Last updated 2026-09-11

---

## Project Overview

An **eco-friendly primary battery stack** inspired by the *Agastya Samhita* — an ancient Sanskrit text on electrochemistry and electrical generation attributed to Sage Agastya:

### Classical Sanskrit Verses (*Agastya Samhita*)

**Cell Formulation:**
```sanskrit
संस्थाप्य मृण्मये पात्रे ताम्रपत्रं सुसंस्कृतम्।
छादयेच्छिखिग्रीवेन चार्द्राभिः काष्ठपांसुभिः॥
दस्तालोष्टो निधातव्यस्ततः पारदसंयुतः।
संयोगाज्जायते तेजो मित्रावरुणसंज्ञितम्॥
```
> *Saṃsthāpya mṛṇmaye pātre tāmrapatraṃ susaṃskṛtam |*  
> *Chādayecchikhigrīvena cārdrābhiḥ kāṣṭhapāṃsubhiḥ ||*  
> *Dastāloṣṭo nidhātavyastataḥ pāradasaṃyutaḥ |*  
> *Saṃyogājjāyate tejo mitrāvaruṇasaṃjñitam ||*  
>
> **Meaning:** Place a well-cleaned copper sheet (*tāmrapatra*) into an earthenware vessel (*mṛṇmaya pātra*). Cover it with copper sulfate (*shikhigrīva*, peacock-blue salt) and moist sawdust (*ārdra kāṣṭhapāṃsu*). Insert a zinc rod (*dastāloṣṭa*). By this galvanic combination is generated electrical energy (*tejas*) designated as *Mitra-Varuna* (complementary polarities / electromotive force).

**Electrolytic Gas Evolution:**
```sanskrit
अनेन जलभङ्गोऽस्ति प्राणोदानेषु वायुषु।
एवं शतानां कुम्भानां संयोगः कार्यकृत्तमः॥
```
> *Anena jalabhaṅgo'sti prāṇodāneṣu vāyuṣu |*  
> *Evaṃ śatānāṃ kumbhānāṃ saṃyogaḥ kāryakṛttamaḥ ||*  
>
> **Meaning:** By this electrical power, water is split (*jalabhaṅga*), evolving into *Prāṇa* (Oxygen at the positive electrode) and *Udāna* (Hydrogen at the negative electrode). Multiple cells in series provide powerful electrochemical actuation.

### Engineering Implementation
We implement this classical formulation using modern precision materials and power electronics:
1. **A primary galvanic cell** made from two **unglazed terracotta vessels** (100 mL each), **99.9 % copper cathode plates**, **zinc anode sheets/rods**, and a **1.0 M aqueous CuSO₄ electrolyte immobilized in a de-resinated hardwood sawdust matrix**.
2. **An ultra-low-input synchronous boost converter** that cold-starts below **0.9 V** and steps the variable 1.6–2.2 V stack up to a regulated **5.0 V ± 2 % rail at ≥ 82 % efficiency**.
3. **A solid-state micro-electrolyzer** using **non-sacrificial graphite pencil electrodes** inside a **graduated micro-fluidic gas collection tube** — producing visible hydrogen with **zero secondary battery assistance**.

The system is **100 % biodegradable, non-toxic, and lithium-free** — a disposable off-grid power source for micro-sensors.

---

## Table of Contents

| File | Purpose |
|---|---|
| [`ROADMAP.md`](ROADMAP.md) | Schedule, milestones, risk register, success criteria |
| [`docs/FULL_SCALE_BOM.md`](docs/FULL_SCALE_BOM.md) | Full-scale prototype BOM with component specs, sourcing & improvements |
| [`docs/PRD.md`](docs/PRD.md) | Requirements specification (functional + success criteria) |
| [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md) | System architecture, block diagram, interfaces |
| [`docs/BOM.md`](docs/BOM.md) | Benchtop PoC bill of materials with specs & sourcing |
| [`docs/SAFETY.md`](docs/SAFETY.md) | Hazard assessment, PPE, waste handling |
| [`docs/ELECTROCHEM.md`](docs/ELECTROCHEM.md) | Electrochemistry theory, ancient citations, Nernst, polarisation |
| [`docs/PMIC.md`](docs/PMIC.md) | Boost converter design, IC selection, efficiency budgeting |
| [`docs/ELECTROLYZER.md`](docs/ELECTROLYZER.md) | Electrolyzer design, Faradaic efficiency, gas metrology |
| [`docs/PATENT_STRATEGY.md`](docs/PATENT_STRATEGY.md) | Novelty analysis, prior art, claim strategy |
| [`docs/SYLLABUS_MAPPING.md`](docs/SYLLABUS_MAPPING.md) | EEE framework "New POV" mapping |
| [`docs/REPORT.md`](docs/REPORT.md) | Formal report skeleton (for thesis write-up) |
| [`docs/PRESENTATION.md`](docs/PRESENTATION.md) | Defense/viva Q&A bank & presentation outline |
| [`data/`](data/) | Raw measurement logs (Voc, Isc, V(t), efficiency, gas) |
| [`tools/`](tools/) | MATLAB/Python scripts for analysis & plotting |

---

## System Block Diagram

```
┌─────────────────────────── CELL STACK ───────────────────────────┐
│                                                                  │
│   ┌─────────────┐        ┌─────────────┐                        │
│   │ Cell 1      │        │ Cell 2      │                        │
│   │ Terracotta  │        │ Terracotta  │                        │
│   │ vessel      │        │ vessel      │                        │
│   │ 100 mL      │        │ 100 mL      │                        │
│   │              │        │              │                        │
│   │ Cu plate ⊕  │        │ Cu plate ⊕  │                        │
│   │ · sawdust   │        │ · sawdust   │                        │
│   │ · CuSO₄ 1 M │        │ · CuSO₄ 1 M │                        │
│   │ · Zn sheet ⊖│        │ · Zn sheet ⊖│                        │
│   └─────────────┘        └─────────────┘                        │
│          └──────────────┬──────────────┘                         │
│            Series stack: 1.6 V ≤ V_stack ≤ 2.2 V                 │
└─────────────────────────┬────────────────────────────────────────┘
                          │
                          ▼
              ┌───────────────────────┐
              │  Synchronous Boost    │  V_in(min) ≤ 0.9 V
              │  Power Management IC  │  → 5.0 V ± 2 % rail
              │  (cold-start capable) │  η ≥ 82 %
              └───────────┬───────────┘
                          │  5.0 V DC regulated rail
                          ▼
            ┌──────────────────────────┐
            │  Solid-State Micro-      │
            │  Electrolyzer            │
            │  Graphite pencil elect.  │
            │  Graduated gas tube      │
            │  → H₂(g) at cathode      │
            └──────────────────────────┘
```

---

## Core Chemistry (the "Daniell-with-a-twist")

**Anode (Zn):** Zn(s) → Zn²⁺(aq) + 2e⁻  &nbsp;&nbsp; E° = −0.76 V
**Cathode (Cu):** Cu²⁺(aq) + 2e⁻ → Cu(s) &nbsp;&nbsp; E° = +0.34 V

Overall: Zn(s) + Cu²⁺(aq) → Zn²⁺(aq) + Cu(s) &nbsp;&nbsp; **E°cell = 1.10 V**

> Two cells in series → **E° = 2.20 V** theoretical; PRD requires ≥ 2.10 V (≈ 95 % of ideal, realistic once overpotential is suppressed).

### What makes it *Agastya* and *novel*

- **The separator is a lignocellulose (sawdust) capillary matrix** suspended in a **porous terracotta wall** — not a paper/Celgard/zirconia separator.
- The micro-capillary structure of wet sawdust **immobilizes Cu²⁺** (retarding crossover) **while** providing interstitial pathways for Zn²⁺ and SO₄²⁻ migration.
- The wet organic matrix acts as a **dendrite-retardant solid–liquid separator** — the central patentable claim.

See [`docs/ELECTROCHEM.md`](docs/ELECTROCHEM.md) for the full treatment (Nernst, polarisation, R_int, Faradaic efficiency).

---

## Why terracotta + sawdust?

| Material | Role | Why |
|---|---|---|
| Unglazed terracotta | Vessel + porous wall | Cheap, porous, ionic-permeable, biodegradable, traditional |
| Hardwood sawdust (de-resinated) | Immobilizing matrix | Capillary retention of electrolyte; blocks Cu²⁺ crossover & dendrites |
| 1.0 M CuSO₄ | Catholyte | Standard Daniell cation, saturated-solution immobilization |
| 99.9 % Cu plate | Cathode | Non-reacting current collector, E° = +0.34 V |
| Zn sheet | Anode | Sacrificial, E° = −0.76 V |
| Graphite pencil electrodes | Electrolyzer electrodes | Non-sacrificial (H₂/O₂ evolution on carbon surface), cheap |

---

## Power Management (Boost Converter)

- **Topology:** synchronous boost (low-side + high-side switches) for ≥ 82 % efficiency at light load.
- **Input range:** 0.9–2.2 V (cold-start at ≤ 0.9 V; nominal stack window 1.6–2.2 V).
- **Output:** 5.0 V ± 2 % (4.90–5.10 V).
- **Load:** micro-electrolyzer; expect 10–50 mA draw.

Efficiency budget (at 15 mA, 5 V rail ⇒ P_out ≈ 75 mW):

| Block | Loss budget | Notes |
|---|---|---|
| Switching (FET gate drive + switching) | ≤ 3 % | Low V_gs logic FETs |
| Conduction (DCR, Rdson) | ≤ 4 % | Synchronous rectification |
| Inductor (DCR) | ≤ 3 % | Low-DCR, high-isat |
| Control/quiescent | ≤ 2 % | Low-IQ controller |
| Controller + layout parasitic | ≤ 6 % | Test at 82 % end-to-end target |

See [`docs/PMIC.md`](docs/PMIC.md) for IC candidates (e.g. TPS61200-family / *equivalent* ultra-low-Vin synchronous boost, SOT-236L-QFN packages) and the full efficiency model.

---

## Electrolyzer (H₂ production)

- **Electrodes:** graphite pencil "lead" rods — non-sacrificial carbon.
- **Electrolyte:** buffered dilute solution (see SAFETY); typically 0.1–0.5 M Na₂SO₄ or KOH trace for conductivity.
- **Collection:** inverted **graduated micro-fluidic tube** with mL scale.
- Cathodic half-reaction (reduction): 2H₂O + 2e⁻ → H₂(g) + 2OH⁻
- Anodic half-reaction (oxidation): 2H₂O → O₂(g) + 4H⁺ + 4e⁻

**Target:** visible cathodic bubbling ≤ 10 s after closure; steady collection rate; Faradaic efficiency assessed against the 2 F/mole rule. See [`docs/ELECTROLYZER.md`](docs/ELECTROLYZER.md).

---

## Verification / Success Criteria (from PRD)

| # | Requirement | Tolerance |
|---|---|---|
| 1 | Voc(stack), 2-cell series | ≥ 2.10 V |
| 2 | Isc @ 25 °C ambient | ≥ 20 mA |
| 3 | Boost output rail | 5.0 V ± 2 % |
| 4 | End-to-end power conversion efficiency | ≥ 82 % |
| 5 | Continuous discharge @ 15 mA | ≥ 4 h, stack ≥ 1.5 V |
| 6 | Cathodic gas bubbling | ≤ 10 s after closure |
| 7 | Secondary battery assistance | Zero (none) |

Evidence lives under [`data/`](data/).

---

## Patent Position (short version)

> Traditional knowledge (Agastya Samhita) and basic Daniell chemistry are **non-patentable** in India under §3(p). Do **not** claim the chemistry. Claim the **device + composition**:
> 1. A bio-galvanic composite separator — packing ratio of de-resinated lignocellulose fibers + porous earthen ceramic to retard Zn dendrites in open-cell devices.
> 2. An integrated self-boosting micro-electrolyzer — galvanic cell + PMIC impedance-matched (R_int) to micro-electrolysis loads.

Full detail: [`docs/PATENT_STRATEGY.md`](docs/PATENT_STRATEGY.md).

---

## EEE Syllabus "New POV"

| EEE Domain | This project's contribution |
|---|---|
| Energy Storage Systems & Materials | Non-toxic primary storage replacing Li/Pb chemistries |
| Power Electronics | Ultra-low-input synchronous boost; impedance-matched converters |
| Electrochemical Engineering | Polarization curves, overpotential, R_int, Faradaic efficiency |

Full mapping: [`docs/SYLLABUS_MAPPING.md`](docs/SYLLABUS_MAPPING.md).

---

## Directory Map

```
agastya-galvanic-system/
├── ROADMAP.md              ← you are here (start here)
├── wiki.md                 ← this file (project index & overview)
├── README.md               ← quick-start / one-page summary
├── docs/
│   ├── PRD.md
│   ├── ARCHITECTURE.md
│   ├── BOM.md
│   ├── SAFETY.md
│   ├── ELECTROCHEM.md
│   ├── PMIC.md
│   ├── ELECTROLYZER.md
│   ├── PATENT_STRATEGY.md
│   ├── SYLLABUS_MAPPING.md
│   ├── REPORT.md
│   └── PRESENTATION.md
├── data/                   ← raw logs + processed results
│   ├── voc_isc_logs/
│   ├── discharge/
│   ├── efficiency/
│   └── electrolyzer/
├── tools/                  ← analysis & plotting scripts
│   ├── plot_vt.m
│   ├── polarization_curve.m
│   ├── efficiency_sweep.m
│   └── gas_collection.m
└── hardware/               ← (future) schematic/PCB/layout files
```

---

## Quick Start

1. Read [`ROADMAP.md`](ROADMAP.md) for the schedule & gates.
2. Read [`docs/PRD.md`](docs/PRD.md) for exact requirements.
3. Order materials using [`docs/BOM.md`](docs/BOM.md) — read [`docs/SAFETY.md`](docs/SAFETY.md) **first**.
4. Start Phase 1 (cell chemistry bench) per the roadmap.
5. Log every measurement into `data/` and plot with `tools/`.

---

## License & Ethics Note

This is an **academic/educational project**. It intentionally references traditional knowledge (Agastya Samhita) for inspiration — the goal is to demonstrate that *sustainable, culturally-grounded electrochemistry* can feed modern micro-devices. All material handling follows the chemical safety sheet in [`docs/SAFETY.md`](docs/SAFETY.md). Waste CuSO₄ solution and sawdust must be disposed of per local environmental rules (see SAFETY).

*Maintain this wiki as the living index: every new measured value should trace back to a PRD requirement and land in `data/`.*