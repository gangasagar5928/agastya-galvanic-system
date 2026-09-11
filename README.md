# 🌱 The Agastya Galvanic System

> **A Biodegradable, Non-Lithium Earthen Solid-State Primary Battery with Sub-Volt Energy Harvesting for Disposable Off-Grid Micro-Sensors**

*Departmental Project · Topic 1 · Academic Year 2026*

---

## One Paragraph

A two-cell **terracotta + sawdust earthen galvanic stack** (Zn / 1.0 M CuSO₄-in-sawdust / Cu) drives an **ultra-low-input synchronous boost converter** that cold-starts below 0.9 V and outputs a regulated **5.0 V ± 2 % rail at ≥ 82 % efficiency**. That rail powers a **graphite-electrode micro-electrolyzer** that splits water into visible hydrogen — all with **zero secondary batteries** and **0 % lithium**.

## Headline Targets

| Metric | Target | Status |
|---|---|---|
| Stack open-circuit voltage (2-cell) | ≥ 2.10 V | ⬜ To verify (Phase 1) |
| Short-circuit current @ 25 °C | ≥ 20 mA | ⬜ To verify (Phase 1) |
| Regulated rail | 5.0 V ± 2 % | ⬜ To verify (Phase 2) |
| End-to-end efficiency | ≥ 82 % | ⬜ To verify (Phase 2) |
| Continuous discharge | ≥ 4 h @ 15 mA | ⬜ To verify (Phase 4) |
| Cathodic bubbling time | ≤ 10 s | ⬜ To verify (Phase 3) |
| Secondary battery assistance | 0 | ✅ By design |

## Quick Start

1. **Read** [`ROADMAP.md`](ROADMAP.md) — schedule, gates, risk register.
2. **Read** [`wiki.md`](wiki.md) — the live project index (start here).
3. **Read** [`docs/SAFETY.md`](docs/SAFETY.md) **before touching any chemicals.**
4. **Order parts** from [`docs/BOM.md`](docs/BOM.md) (≤ ₹1,500 budget).
5. **Build & log** per the phases — every measurement lands in [`data/`](data/).

## Documentation Index

| File | What it contains |
|---|---|
| [`ROADMAP.md`](ROADMAP.md) | Milestones, workback schedule, risk register, success gate checklist |
| [`wiki.md`](wiki.md) | Live project index, system overview, directory map |
| [`docs/PRD.md`](docs/PRD.md) | Formal requirements & verification matrix |
| [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md) | System block diagram & interfaces |
| [`docs/BOM.md`](docs/BOM.md) | Bill of materials with costs & sourcing |
| [`docs/SAFETY.md`](docs/SAFETY.md) | Hazard assessment, PPE, waste & emergency procedures |
| [`docs/ELECTROCHEM.md`](docs/ELECTROCHEM.md) | Nernst, polarisation, R_int, Faraday theory |
| [`docs/PMIC.md`](docs/PMIC.md) | Boost converter design, IC selection, efficiency budget |
| [`docs/ELECTROLYZER.md`](docs/ELECTROLYZER.md) | Electrolyzer design, gas metrology, η_F protocol |
| [`docs/PATENT_STRATEGY.md`](docs/PATENT_STRATEGY.md) | Novelty analysis & claim strategy |
| [`docs/SYLLABUS_MAPPING.md`](docs/SYLLABUS_MAPPING.md) | EEE domain mapping ("New POV") |
| [`docs/REPORT.md`](docs/REPORT.md) | Thesis/report skeleton |
| [`docs/PRESENTATION.md`](docs/PRESENTATION.md) | Slides outline + viva Q&A bank |

## Status

**Active · Phase 0/7** *(Foundations & Safety complete — documentation in place)*

- ✅ Documentation scaffold complete (2026-09-11)
- ⬜ Phase 1: Cell chemistry bench (next)

---

*Maintain statuses as phases progress. Every checkmark should be backed by a timestamped log in `data/`.*