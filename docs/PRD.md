# Product Requirements Document (PRD)

**Project:** The Agastya Galvanic System — A Biodegradable, Non-Lithium Earthen Solid-State Primary Battery with Sub-Volt Energy Harvesting for Disposable Off-Grid Micro-Sensors
**Document version:** v1.0 · **Date:** 2026-09-11 · **Owner:** Project Team

---

## 1. Objective

Design, build, and verify an **eco-friendly, non-lithium primary battery stack** that:

- Uses a **porous terracotta separator matrix** with a **lignocellulose (de-resinated hardwood sawdust) suspension** as the electrolyte-immobilizing medium.
- Couples to an **ultra-low-input synchronous boost power-management stage**.
- Drives a **solid-state micro-electrolyzer** producing hydrogen — with **zero secondary battery assistance**.

The system is a working demonstration of sustainable primary-energy technology mapped to three EEE domains: *Energy Storage Systems & Materials*, *Power Electronics*, and *Electrochemical Engineering*.

---

## 2. Functional Requirements

### FR-1 — Open-Circuit Voltage
> **F1:** The two-cell series configuration shall deliver an open-circuit voltage **V_oc ≥ 2.10 V**.

- Measurement: DMM (≥ 4½ digit), logged at 1 s interval for ≥ 30 min.
- Pass criterion: V_oc never drops below 2.10 V during the log window.

### FR-2 — Steady-State Short-Circuit Current
> **F2:** The stack shall maintain a steady-state short-circuit current **I_sc ≥ 20 mA** at ambient 25 °C.

- Measurement: short-pulse with series sense resistor + logging ammeter.
- Pass criterion: I_sc ≥ 20 mA sustained ≥ 60 s without thermal run-away or voltage collapse.

### FR-3 — DC-DC Regulation
> **F3:** The power stage shall step up the variable stack potential (1.6 V ≤ V_stack ≤ 2.2 V) to a regulated **5.0 V ± 2 % DC rail**.

- Regulation tolerance: 4.90 V ≤ V_out ≤ 5.10 V over the full input range and 0–50 mA load.
- Pass criterion: rail held inside window for ≥ 30 min continuous.

### FR-4 — End-to-End Conversion Efficiency
> **F4:** End-to-end power-conversion efficiency **η ≥ 82 %** measured from stack terminals to the regulated rail.

- Definition: η = P_out / P_in where P_in = V_stack × I_in measured at stack output, P_out = V_out × I_out at rail.
- Measured at the PRD operating point (15 mA rail load).

### FR-5 — Continuous Load Discharge
> **F5:** Continuous load discharge at **15 mA for ≥ 4 hours** without the stack voltage collapsing below **1.5 V**.

- Log V_stack(t) and V_rail(t) at 10 s intervals across the 4 h run.

### FR-6 — Electrolyzer Ignition
> **F6:** Visible cathodic gas bubbling within **10 seconds** of circuit closure.

- Verification: time-stamped video + eyewitness record.

### FR-7 — Zero Secondary Assistance
> **F7:** No rechargeable or secondary battery of any kind shall be used in the active power path.

- Audit: full BOM traceability in [`docs/BOM.md`](BOM.md); demo wiring inspected.

---

## 3. System Architecture (Summary)

| Stage | Key Elements |
|---|---|
| Primary cell | 2 × unglazed terracotta vessels (100 mL); 99.9 % Cu cathode plates; Zn anode sheets |
| Electrolyte | Saturated aqueous CuSO₄ (1.0 M), immobilized in de-resinated hardwood sawdust matrix |
| Power stage | Synchronous boost, cold-start V_in(min) ≤ 0.9 V |
| Electrolyzer | Non-sacrificial graphite pencil electrodes in graduated micro-fluidic gas collection tube |

Full detail in [`docs/ARCHITECTURE.md`](ARCHITECTURE.md).

---

## 4. Success Criteria & Tolerances (Verification Matrix)

| ID | Metric | Requirement | Tolerance | Method | Phase |
|---|---|---|---|---|---|
| SC-1 | V_oc (2-cell stack) | ≥ 2.10 V | sustained ≥ 30 min | DMM log | 1 |
| SC-2 | I_sc @ 25 °C | ≥ 20 mA | sustained ≥ 60 s | Ammeter | 1 |
| SC-3 | Regulated rail | 5.0 V | ± 2 % | Rail log | 2 |
| SC-4 | End-to-end η | ≥ 82 % | at 15 mA load | Power meter | 2 |
| SC-5 | 15 mA discharge | ≥ 4 h | V_stack ≥ 1.5 V final | V(t) log | 1/4 |
| SC-6 | Cathodic bubbling | ≤ 10 s | from closure | Video | 3 |
| SC-7 | Secondary battery | none | 0 in power path | BOM audit | 4 |

---

## 5. Non-Functional Requirements

### 5.1 Eco-sustainability
- All active electrode/electrolyte/structural materials biodegradable or recyclable (terracotta, sawdust, Cu, Zn, carbon). No Li, Pb, Cd, Hg, Ni-Cd.
- Waste CuSO₄ and zinc residue handled per [`docs/SAFETY.md`](SAFETY.md).

### 5.2 Cost
- Total materials budget target: **≤ ₹1,500** (see [`docs/BOM.md`](BOM.md)).

### 5.3 Safety
- Full hazard assessment in [`docs/SAFETY.md`](SAFETY.md). Mandatory PPE: nitrile gloves, safety glasses, lab coat, ventilated area.

### 5.4 Reproducibility
- Every build step and measurement recorded in `data/`; assembly recipes versioned.

### 5.5 Documentation
- ROADMAP, wiki, PRD, per-stage design docs, patent strategy, and defense prep all maintained under the repo root.

---

## 6. Out of Scope (v1)

- Recharge/sustainability cycling (primary cell is single-use by design).
- High-current applications (target is micro-sensor load class).
- Industrial kiln-fired terracotta engineering (vessels are commercially sourced).
- Scalability to grid-storage volumes.

---

## 7. Assumptions

- Ambient lab conditions 25 ± 5 °C; relative humidity 40–70 % to keep sawdust matrix moist.
- Tap/DM water for electrolyte; reagents ≥ lab grade.
- Two-cell stack assumed to deliver ~2 × 1.05–1.10 V at open circuit.

---

## 8. Revision History

| Version | Date | Change |
|---|---|---|
| v1.0 | 2026-09-11 | Initial release from Topic-1 brief |

*Traceability: every requirement links to a test in ROADMAP Section 5 and an evidence file under `data/`.*