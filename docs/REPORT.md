# Formal Report Skeleton

**Project:** The Agastya Galvanic System
**Document:** `REPORT.md` — outline + instruction checklist for the final thesis/write-up
**Status:** Draft v0.1 · **Date:** 2026-09-11 (to be completed after Phase 4 data collection)

---

## Structure (IEEE/Academic style)

### Title Page
- Full project title
- Author(s), department, institution, date
- Supervisor name & designation

### Abstract
> 200–250 words: problem, approach, key measurements (Voc, I_sc, η, H₂ rate), conclusion (viability of biodegradable primary micro-power).

### 1. Introduction
- [ ] Motivation: off-grid micro-sensors, lithium dependence, e-waste
- [ ] Historical context: Agastya Samhita, traditional knowledge (§3 discussion)
- [ ] The "New POV" (from `SYLLABUS_MAPPING.md` §6)
- [ ] Scope & objectives (from `PRD.md`)

### 2. Literature Review
- [ ] Daniell cell — history, fundamentals (cite primary chemistry sources)
- [ ] Porous separators & lignocellulose in batteries
- [ ] Ultra-low-voltage boost converters & energy harvesting
- [ ] Micro-electrolysis / water splitting on carbon electrodes
- [ ] Prior patent landscape (from `PATENT_STRATEGY.md` §2)

### 3. System Design & Architecture
- [ ] Top-level block diagram (`ARCHITECTURE.md` §1)
- [ ] Cell stack construction & materials (`BOM.md`, `ARCHITECTURE.md` §3)
- [ ] PMIC design (`PMIC.md` §3–§4)
- [ ] Electrolyzer design (`ELECTROLYZER.md` §2–§5)

### 4. Experimental Methodology
- [ ] Measurement setup (DMM, ammeter, logging)
- [ ] Procedures: Voc/I_sc, polarization sweep, 4 h discharge, efficiency sweep, H₂ collection
- [ ] Environmental conditions (25 °C, RH)
- [ ] Calibration protocols (`ELECTROLYZER.md` §7)

### 5. Results & Analysis
- [ ] Voc / I_sc tables + plots (`data/voc_isc_logs/`)
- [ ] Polarization curves + R_int extraction (`data/` + `tools/polarization_curve.m`)
- [ ] Discharge V(t) curves (`data/discharge/`)
- [ ] Efficiency maps (η vs Vin vs Iload) (`data/efficiency/`)
- [ ] H₂ volume vs Faraday prediction + η_F (`data/electrolyzer/`)
- [ ] Comparison to PRD verification matrix (`PRD.md` §4)

### 6. Discussion
- [ ] Derived dendrite-retardation evidence
- [ ] Efficiency bottlenecks & how addressed
- [ ] Limitations, error sources, uncertainty estimates
- [ ] Environmental & cost assessment (scorecard from `SYLLABUS_MAPPING.md` §4)

### 7. Conclusion & Future Work
- [ ] Restate achieved targets vs PRD
- [ ] Future: scaling, sensor integration, recharge-free IoT nodes, kiln-fired custom ceramics
- [ ] Research ethics & traditional-knowledge note

### 8. References
- [ ] IEEE numbered style
- [ ] Key references: Daniell (1836), Nernst, Butler–Volmer, boost IC datasheets (TPS61099), Faraday/electrolysis texts, Indian Patents Act §3(p)

### Appendices
- [ ] A: BOM with prices (`BOM.md`)
- [ ] B: Safety & MSDS extracts (`SAFETY.md`)
- [ ] C: Full data logs (`data/` pointers)
- [ ] D: Patent claim drafts (`PATENT_STRATEGY.md` §4)
- [ ] E: Fabrication photos (to be captured Phase 1–3)

---

## Writing Checklist

- [ ] Every numerical claim references a `data/` file
- [ ] Every PRD requirement has an explicit verdict in Results (pass/fail + margin)
- [ ] Units/stanexplicit: V, mA, Ω, %, mL/min, η
- [ ] Chemical safety and waste disposal documented
- [ ] Traditional-knowledge framing present throughout, without over-claiming
- [ ] Abstract written LAST (after results are real)

---

## Word budget (suggested, 8,000–12,000 words)

| Section | Words |
|---|---|
| Introduction | 800 |
| Literature | 2,000 |
| Design | 1,800 |
| Methodology | 1,200 |
| Results & Analysis | 2,500 |
| Discussion | 1,500 |
| Conclusion | 500 |
| (Abstract/refs/appendix extra) | — |

---

*Fill each `[ ]` as evidence accumulates. Start drafting §1–§2 now; they need no lab data.*