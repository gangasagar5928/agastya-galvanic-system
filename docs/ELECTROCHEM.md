# Electrochemistry — Theory & Calculations

**Project:** The Agastya Galvanic System · **Date:** 2026-09-11

---

## 1. Half-Reactions & Standard Potentials

### Daniell Cell (the working chemistry)

| Electrode | Half-reaction | E° (V vs SHE) |
|---|---|---|
| Zinc anode (oxidation) | Zn(s) → Zn²⁺(aq) + 2e⁻ | −0.76 |
| Copper cathode (reduction) | Cu²⁺(aq) + 2e⁻ → Cu(s) | +0.34 |
| **Overall** | Zn(s) + Cu²⁺(aq) → Zn²⁺(aq) + Cu(s) | **+1.10** |

> Two cells in series (ideal, no overpotential): **E°_cell = 2 × 1.10 = 2.20 V**

---

## 2. Nernst Equation — Real Cell Potential

At 25 °C, the Nernst equation for each cell is:

```
E_cell = E°_cell − (RT/nF) × ln(Q)

At 25 °C (298.15 K):
  E_cell = E°_cell − (0.02569 / n) × ln(Q)
         = E°_cell − (0.02569 / 2) × ln([Zn²⁺] / [Cu²⁺])
```

### Case: 1.0 M CuSO₄, freshly started

If [Cu²⁺] ≈ 1.0 M and [Zn²⁺] ≈ 0 initially:

```
Q = [Zn²⁺] / [Cu²⁺] ≈ 0 / 1.0 → ln(Q) → −∞   (but in practice, trace [Zn²⁺])
```

**Practical starting point:** assume [Zn²⁺]_initial ≈ 0.01 M (from surface contamination):

```
E = 1.10 − (0.01285) × ln(0.01 / 1.0)
  = 1.10 − (0.01285) × (−4.605)
  = 1.10 + 0.0592
  = 1.159 V    (per cell)
```

**Two-cell stack (Nernst, 1.0 M CuSO₄):** 2 × 1.159 ≈ **2.32 V** theoretical Voc.

> PRD target of Voc ≥ 2.10 V requires only ~90.5 % of this ideal → achievable once overpotential and IR losses are minimized (see Section 4).

---

## 3. Overpotential Analysis

The actual terminal voltage under load is:

```
V_term = E_cell − |η_a| − η_c − I × R_int
```

| Component | Typical value (1 M CuSO₄, 25 °C) | Notes |
|---|---|---|
| E_cell (Nernst) | 1.16–1.20 V | Depends on concentration & temp |
| η_a (Zn activation) | 50–200 mV | Depends on Zn surface prep, dendrites |
| η_c (Cu activation) | 10–50 mV | Cu deposition is relatively facile |
| I × R_int (ohmic) | 20–200 mV at 20 mA | Cell geometry, electrolyte resistance |
| **Result: V_term per cell** | **~1.05–1.10 V at 20 mA** | **Two-cell: 2.10–2.20 V ✓** |

---

## 4. Internal Resistance (R_int) — Estimation

R_int governs the maximum current and voltage sag. It has three components:

### 4.1 Electrolyte Resistance

For a cylindrical vessel of radius r, wall height h, filled with saturated electrolyte:

```
R_electrolyte ≈ ρ × L / A
```

Where:
- ρ = electrolyte resistivity (1.0 M CuSO₄: ~0.04 Ω·m at 25 °C)
- L = electrode separation ≈ 5 cm (estimated)
- A = effective cross-section ≈ π × r × wall_thickness (porous path area)

**For 100 mL vessel (Ø 7 cm, wetted path ~5 cm long, effective area ~10 cm²):**

```
R_electrolyte ≈ 0.04 × 0.05 / (10 × 10⁻⁴)
              ≈ 0.002 / 0.001
              ≈ 2 Ω
```

### 4.2 Sawdust Matrix Resistance

The de-resinated sawdust introduces tortuosity (τ > 1) and reduced porosity (ε < 1):

```
R_matrix = ρ × τ² / ε × L / A_eff
         ≈ 2–5× electrolyte resistance  (empirical for wood-sawdust separators)
         ≈ 4–10 Ω
```

### 4.3 Total R_int (per cell, estimated)

```
R_int (single cell) ≈ 5–15 Ω   (electrolyte + matrix + contact)
R_int (stack, series) ≈ 10–30 Ω
```

> **Validation:** I_sc = Voc / R_int. If Voc = 2.2 V and I_sc ≥ 20 mA → R_int ≤ 2.2 / 0.02 = 110 Ω. Our estimate (10–30 Ω) is well within this margin. *Measure R_int in Phase 1 via EIS or I-V slope.*

---

## 5. Faradaic Current & H₂ Generation

### 5.1 Electrolyzer — Current to Gas

For the water-splitting electrolyzer:

```
n = 2 (electrons per H₂ molecule)
F = 96,485 C/mol
```

**Faradaic rate (mL/min of H₂ at STP):**

```
V̇(H₂) = (I × 60) / (nF) × 22,400 mL/mol
       = I × 60 / (2 × 96485) × 22,400
       = I × 0.06954 mL/min  (I in mA)
```

| Electrolyzer current | H₂ theoretical rate | Bubbles visible? |
|---|---|---|
| 5 mA | 0.35 mL/min | Barely — intermittent |
| 15 mA | 1.04 mL/min | Yes, steady stream |
| 30 mA | 2.09 mL/min | Clearly visible |
| 50 mA | 3.48 mL/min | Vigorous |

> At 15 mA (the PRD operating point): **≈ 1.0 mL/min H₂** = easy to see. Gas collection: 1 mL = 1 cm in a standard graduated tube (Ø 3–4 mm bore → ~1 mm per 0.1 mL).

### 5.2 Faradaic Efficiency

Actual H₂ volume / theoretical H₂ volume = **Faradaic efficiency η_F**

Sources of loss:
- Parasitic side-reactions (minor in pure water/salt electrolyte)
- Gas dissolution in electrolyte (small for H₂)
- Gas leakage past stopper seal

**Target η_F ≥ 70 %** for graphite electrodes at 15 mA.

---

## 6. Polarisation Curve (theory, Phase 1 measurement)

A typical polarisation curve for a Daniell-type cell looks like:

```
V(V)
  1.20 ┤
       │  ───────────── Activation region
  1.10 ┤            ╲
       │             ╲  Ohmic (linear) region
  1.00 ┤              ╲
       │               ╲
  0.90 ┤                ╲  Concentration polarisation
       │                 ╲╲
  0.80 ┤                    ╲
       └────┬─────┬─────┬─────┬──→ I (mA)
            10   20   30   40
```

- **Activation region** (low I): slow kinetics dominate (Zn anode activation energy)
- **Ohmic region** (middle): linear V-drop across R_int
- **Concentration region** (high I): Cu²⁺ depletion near cathode

**Phase 1 action:** sweep current 0→50 mA, record V at each step; plot polarisation curve → extract R_int from the linear slope.

---

## 7. Temperature Dependence

- Nernst E° shifts ~ −0.66 mV/°C per cell (log term temperature coefficient).
- Electrolyte conductivity increases ~ 1–2 %/°C → R_int decreases.
- **Net effect of warming 5 °C:** V_term increases ~ 2–5 mV per cell (conductivity gain dominates Nernst loss).

---

## 8. Key Equations Summary

| Quantity | Equation | Units |
|---|---|---|
| Standard cell potential | E°_cell = E°_cat − E°_an = 0.34 − (−0.76) | V |
| Nernst (one cell, 25 °C) | E = E° − (0.02569/2) × ln([Zn²⁺]/[Cu²⁺]) | V |
| Terminal voltage | V_term = E_cell − η_a − η_c − I·R_int | V |
| Internal resistance | R_int = ρ·τ²·L / (ε·A_eff) | Ω |
| Short-circuit current | I_sc = Voc / R_int | A |
| H₂ Faradaic rate | V̇ = I/(nF) × 22,400 | mL/min |
| Faradaic efficiency | η_F = V_actual / V_theoretical | — |

*All measurements from Phase 1 onward are validated against these baseline estimates. See `data/` for logged values.*