# Electrolyzer Design & Gas Metrology

**Project:** The Agastya Galvanic System · **Date:** 2026-09-11

---

## 1. Overview

The electrolyzer is a **two-electrode water-splitting cell** driven by the 5.0 V regulated rail from the boost converter. Its sole function in this project is to demonstrate **visible, measurable H₂ generation** from the earthen cell stack alone — with zero secondary battery.

- **Electrodes:** graphite pencil leads (non-sacrificial carbon).
- **Electrolyte:** dilute buffered salt solution (Na₂SO₄ or dilute KOH).
- **Gas collection:** inverted graduated tube with mL-scale markings.

---

## 2. Electrode Assembly

### 2.1 Cathode (hydrogen evolution)

- **Material:** 0.5 mm graphite pencil lead, 2B–6B grade (higher B = more conductive, less brittle).
- **Length submerged:** 3–4 cm in electrolyte.
- **Reaction:** 2H₂O + 2e⁻ → H₂(g) + 2OH⁻
- **E° (alkaline pH 14):** −0.83 V vs SHE; E° (pH 7): −0.41 V vs SHE.

### 2.2 Anode (oxygen evolution)

- **Material:** same graphite pencil lead.
- **Reaction:** 2H₂O → O₂(g) + 4H⁺ + 4e⁻
- **E° (pH 7):** +0.82 V vs SHE.

### 2.3 Electrode Spacing

- **Target:** 0.5–1.0 cm between cathode and anode.
- Too close → gas bubbles bridge and short; too far → higher IR drop.
- Electrodes held in place by drilled rubber stopper.

---

## 3. Electrolyte Selection

| Option | Concentration | Pros | Cons |
|---|---|---|---|
| **Na₂SO₄ (aq)** — *chosen* | 0.25 M | Neutral pH, safe, good conductivity | Slower OER kinetics |
| KOH (aq) | 0.1 M | Fast kinetics, high conductivity | Caustic — higher safety |
| NaHCO₃ (aq) | 0.1 M | Bicarbonate buffer, mild | Lower conductivity |

> **Chosen:** 0.25 M Na₂SO₄ (aq) — balances safety, conductivity, and Faradaic efficiency.

---

## 4. Thermodynamic & Kinetic Analysis

### 4.1 Reversible Cell Voltage (E_rev)

At 25 °C, for water splitting at standard activity and pH 7:

```
E_rev = 1.23 V    (minimum, ΔG = 237 kJ/mol for H₂O → H₂ + ½O₂)
```

At higher pH (e.g. pH 9–10 with Na₂SO₄): E_rev remains ~1.23 V in practice because the cathode and anode pH shifts partially compensate.

### 4.2 Overpotentials

| Component | Typical value (graphite, Na₂SO₄, 15 mA) |
|---|---|
| η_cathode (HER on graphite) | 200–500 mV (graphite is poor catalyst) |
| η_anode (OER on graphite) | 400–800 mV (OER is slow on carbon) |
| Ohmic drop (electrolyte + contacts) | 100–300 mV |
| **Total overpotential** | **700–1600 mV** |

### 4.3 Actual Cell Voltage Required

```
V_cell = E_rev + η_c + η_a + I·R_elyte
       ≈ 1.23 + 1.0 (typical) + 0.2
       ≈ 2.0–3.0 V    (at 15 mA on graphite)
```

> **Conclusion:** The 5.0 V rail is **more than sufficient**. A series resistor or current-limiting element is needed to drop the excess to avoid electrode damage and set the current to 10–20 mA.

### 4.4 Current-Limiting Design

To limit current to ~15 mA when V_rail = 5.0 V and V_cell ≈ 2.5 V:

```
R_limit = (V_rail − V_cell) / I = (5.0 − 2.5) / 0.015 = 167 Ω
```

Use a **220 Ω resistor** (standard value, derate appropriately for power: P ≈ 1.6 W at 15 mA → use a 2 W or 3 W rated resistor, or two 100 Ω in series).

---

## 5. Gas Collection Apparatus

### 5.1 Graduated Tube

- **Type:** inverted graduated tube / syringe barrel / pasteur pipette (if available).
- **Bore:** 3–5 mm internal diameter preferred.
- **Scale:** 0.1 mL minimum division (or ruler + convert based on bore cross-section).
- **Bore cross-section calculation:**

```
A = π × (d/2)²
For d = 4 mm: A = 12.57 mm²

1 mL = 1000 mm³ → height per mL = 1000 / 12.57 ≈ 79.6 mm
→ 1 mm rise ≈ 0.0126 mL
```

### 5.2 Sealing

- Electrodes pass through a drilled rubber/silicone stopper.
- Tube mouth is open at the top (to atmosphere); bottom is submerged in beaker.
- Hydrogen rises to the top of the tube → water level drops → graduated mark reads gas volume.

### 5.3 Equilibration

- After 5 min of bubbling, wait 1–2 min before recording volume: gas pressure equilibrates, some H₂ dissolves.
- Record ambient temperature and pressure (for STP correction).

---

## 6. Faradaic Efficiency Measurement

### 6.1 Theoretical H₂ Volume

From Faraday's law:

```
V_theoretical = (I × t) / (nF) × V_molar

Where:
  I = current (A), t = time (s), n = 2, F = 96,485 C/mol
  V_molar = 22,400 mL/mol (at STP: 0 °C, 101.3 kPa)
```

**At 15 mA for 10 minutes (600 s):**

```
V_theoretical = (0.015 × 600) / (2 × 96485) × 22,400
              = 9 / 192,970 × 22,400
              = 1.045 mL
```

### 6.2 Experimental Measurement

| Time (min) | H₂ collected (mL, observed) | V_theoretical (mL) | η_F (%) |
|---|---|---|---|
| 0 | 0.0 | 0.0 | — |
| 2 | _TBD_ | 0.209 | _TBD_ |
| 5 | _TBD_ | 0.522 | _TBD_ |
| 10 | _TBD_ | 1.045 | _TBD_ |
| 20 | _TBD_ | 2.090 | _TBD_ |
| 30 | _TBD_ | 3.135 | _TBD_ |

**Target η_F ≥ 70 %** — standard for non-noble carbon electrodes in Na₂SO₄ at 15 mA.

### 6.3 Losses

| Loss mechanism | Effect on η_F |
|---|---|
| Gas dissolution in electrolyte | ~2–5 % loss in first 5 min |
| Parasitic side-reactions (carbon oxidation, peroxide formation) | ~5–15 % loss at 15 mA |
| Leakage past stopper seal | Variable, must be minimized by design |

---

## 7. Calibration Procedure

1. Fill graduated tube with water, invert in beaker, confirm zero mark aligns with water level.
2. Push a known volume of air through the tube via a syringe → confirm scale readings.
3. Record tube bore cross-section (A = πr²) by measuring 1 mL marks with a ruler.

---

## 8. Safety

- H₂ is **flammable** (4–75 % in air): do not run in enclosed space, no flames.
- See [`docs/SAFETY.md`](SAFETY.md) Section 4.4 for full H₂ safety protocol.
- Use a 2 W current-limiting resistor — it may get warm; do not touch immediately.

---

## 9. Data Logging Protocol

| Variable | How measured | Interval | Stored in |
|---|---|---|---|
| Electrolyzer current | Inline mA ammeter | 1 min | `data/electrolyzer/` |
| H₂ volume | Tube reading | 5 min | `data/electrolyzer/` |
| Ambient temperature | Thermometer | Start + end | `data/electrolyzer/` |
| Atmospheric pressure | Barometer (if available) | Start | `data/electrolyzer/` |
| Time of first visible bubble | Stopwatch + video | Once | `data/electrolyzer/` |

*Plot V_H₂(t) and compare to Faraday prediction in `tools/gas_collection.m`.*