# System Architecture

**Document:** v1.0 · **Date:** 2026-09-11 · Part of the Agastya Galvanic System

---

## 1. Overview

The system is a four-stage energy chain:

```
Source
  (two-cell earthen galvanic stack)
      ↓  V_stack ∈ [1.6, 2.2] V, I_sc ≥ 20 mA
Stage 1 — Energy Source (Primary Cell)
      ↓  P_in ≈ V_stack × I_in
Stage 2 — Power Management (Synchronous Boost PMIC)
      ↓  5.0 V ± 2 % regulated rail, η ≥ 82 %
Stage 3 — Load (Solid-State Micro-Electrolyzer)
      ↓  2H₂O + 2e⁻ → H₂ + 2OH⁻ (cathode)
Stage 4 — Measurement (Gas collection, logging)
```

---

## 2. Stage-by-Stage Interface Definition

### 2.1 Energy Source (two-cell stack)

| Interface | Spec |
|---|---|
| Nominal Voc per cell | 1.05–1.10 V |
| Stack Voc (series) | ≥ 2.10 V |
| Stack I_sc | ≥ 20 mA |
| Source impedance R_int | TBD by measurement (Phase 1) — expected 10–100 Ω |
| Load window | 0–50 mA |

> **Design consequence:** PMIC must accept a source impedance of several tens of Ω without instability → input-side bulk capacitor + stable-control loop.

### 2.2 Power Management (Synchronous Boost)

| Interface | Spec |
|---|---|
| V_in range | 0.9 – 2.2 V (cold-start ≤ 0.9 V) |
| V_out | 5.0 V ± 2 % (4.90–5.10 V) |
| I_out loaded | 5–50 mA (nominal 15 mA) |
| Efficiency | ≥ 82 % at operating point |

Sub-blocks:
1. **Ultra-low-Vin cold-start oscillator** — ring osc that starts below 0.9 V and hands off to the normal PWM loop.
2. **Synchronous rectification** — hi-side PFET instead of diode (saves ~0.3 V, the difference between 75 % and 85 % efficiency).
3. **Voltage-mode / current-mode control loop** with compensation tuned for the high source impedance.
4. **Output soft-start** to avoid a hard inrush into the electrolyzer capacitance.

### 2.3 Load (Micro-Electrolyzer)

| Interface | Spec |
|---|---|
| Drive | 5.0 V rail, current-limited (10–50 mA) |
| Electrodes | Graphite pencil leads (non-sacrificial) |
| Electrolyte | Dilute buffered salt solution (see SAFETY) |
| Gas capture | Inverted graduated tube, mL scale |
| Target | H₂ visible ≤ 10 s; steady ≤ 30 min logging |

---

## 3. Cell Stack Details

### 3.1 Terracotta Vessel

- Unglazed (porous) earthenware; ~100 mL inner volume; wall porosity allows ionic exchange but the **sawdust matrix inside** is the real separator.
- Two vessels, series-connected externally (cell-1 Zn → cell-2 Cu link).

### 3.2 Electrode Assembly

- **Cathode:** 99.9 % Cu plate, cleaned (dilute acid etch + DI rinse) to expose bare metal surface.
- **Anode:** Zn sheet, surface sanded to remove oxide film; keep electrolyte from fully exsolving the zinc (matrix retention helps).
- Electrode spacing fixed with non-conductive standoffs to minimize IR drop.

### 3.3 Electrolyte Matrix (the novel separator)

- **Base electrolyte:** 1.0 M CuSO₄(aq).
- **Immobilizer:** de-resinated hardwood sawdust — boiled to strip resins/tannins, rinsed, dried, then graded.
- **Packing ratio:** controlled packing (see PATENT_STRATEGY for claimable ratios; target internal-porosity ≈ 50–60 % at Phase-1 calibration) so the gel/slurry wicks uniformly into the terracotta wall.
- Function: capillary retention of electrolyte, Cu²⁺ immobilization, **dendrite retardation**.

---

## 4. PMIC Functional Design

```
    V_stack ──┬──── L (1.5–4.7 µH) ──┬── V_out (5.0 V)
              │                       │
             Cin(≥47 µF)        Hi-side PFET
              │                       │
       ┌──────▼──────────┐           │
       │  Control IC     │──Lo-side──┘
       │ low-V start     │   FET
       │ sync rect drive │
       └─────────────────┘── Cout  (≥100 µF)
```

- **Low-Vin start:** separate ring-oscillator + charge-pump gate booster so the hi-side PFET can be driven above V_in.
- **Peak-power point:** the converter operates at the duty cycle that maximizes stack power → matches R_int (impedance matching per patent claim 2).
- **Design files:** (hardware output) `hardware/` in future revision.

---

## 5. Electrolyzer Cell Physics

- **Cathode (reduction):** 2H₂O + 2e⁻ → H₂(g) + 2OH⁻ &nbsp;&nbsp; E° = −0.83 V vs SHE (at pH 14)
- **Anode (oxidation):** 2H₂O → O₂(g) + 4H⁺ + 4e⁻ &nbsp;&nbsp; E° = +0.40 V (alkaline)
- Cell voltage needed at 25 °C ≈ 1.23 V + overpotentials (η_a + η_c) + JR drop. With 5.0 V rail and graphite overpotential, expect the cell to operate at ~2–3 V, remainder dropped across current-limiting element.
- **Gas metrology:** inverted graduated tube; 1 mol H₂ = 22.4 L at STP; Faradaic rate = I/(nF).

---

## 6. Interfaces & Connectors

| Connection | Notes |
|---|---|
| Stack → PMIC | Short, low-resistance; sense leads for DMM logging |
| PMIC → Electrolyzer | Terminal block; inline µA/mA ammeter tap |
| Gas tube | Sealed at electrode entry except exit to collection head |

---

## 7. Design Constraints & Trade-offs

| Constraint | Trade-off resolved |
|---|---|
| Low V_in | Mandates synchronous rectification + cold-start oscillator |
| High R_int source | Bulk input cap + current-mode control |
| Light-load efficiency | Low IQ (< 20 µA) standby, PFM/PWM auto-transition |
| Biodegradability | No plastics in cell construction; lid/clamps may be inert re-usable rig |
| Safety | Concentration ≤ 1 M CuSO₄; ventilation; PPE |

---

*See also: [`docs/PMIC.md`](PMIC.md) for component-level detail.*