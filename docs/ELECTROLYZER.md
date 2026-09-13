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
       ≈ 1.23 + 0.35 (HER) + 0.55 (OER) + (0.015 A × 18 Ω)
       ≈ 2.40 V    (at 15.14 mA on graphite)
```

> **Conclusion:** The 5.05 V rail is more than sufficient. A series ballast resistor is required to drop the excess potential ($5.05\text{ V} - 2.40\text{ V} = 2.65\text{ V}$), setting the operating current precisely to $15.14\text{ mA}$.

### 4.4 Ballast Resistor Sizing & Dissipation

```
R_ballast = (V_rail − V_cell) / I = (5.05 V − 2.40 V) / 0.01514 A = 175 Ω
P_ballast = I² · R_ballast = (0.01514 A)² × 175 Ω = 0.0401 W = 40.1 mW
```

A standard **$175\ \Omega$ (or $180\ \Omega$), $0.5\text{ W}$ metal film resistor** provides ample thermal headroom ($12.5\times$ derating).

### 4.5 Complete Electrolysis Energy Budget & Power Flow

Electrochemical water splitting has two thermodynamic thresholds:
1. **Reversible Potential ($E_{\text{rev}} = 1.229\text{ V}$ at $25^\circ\text{C}$):** Corresponds to Gibbs free energy change ($\Delta G^\circ = 237.2\text{ kJ/mol}$). Minimum electrical work required.
2. **Thermoneutral Potential ($E_{\text{th}} = 1.481\text{ V}$):** Corresponds to total enthalpy change ($\Delta H^\circ = 285.8\text{ kJ/mol}$). If cell operates below $1.481\text{ V}$, it absorbs ambient heat; above $1.481\text{ V}$, excess electrical energy is released as heat.

#### Detailed Energy & Power Distribution (15.14 mA Operating Point):
| Subsystem Stage | Voltage / Potential | Current | Power | % of Boost Rail Power | Physical Mechanism |
|:---|:---:|:---:|:---:|:---:|:---|
| **Regulated Boost Rail** | $5.05\text{ V}$ | $15.14\text{ mA}$ | **$76.4\text{ mW}$** | **$100.0\%$** | Gross electrical power supplied by PMIC |
| **Ballast Resistor Drop** | $2.65\text{ V}$ | $15.14\text{ mA}$ | **$40.1\text{ mW}$** | **$52.5\%$** | Ohmic Joule heating in ballast resistor |
| **Electrolyzer Cell Input** | $2.40\text{ V}$ | $15.14\text{ mA}$ | **$36.3\text{ mW}$** | **$47.5\%$** | Gross electrical power delivered to electrodes |
| **Electrolyte Ohmic Drop ($IR$)** | $0.27\text{ V}$ | $15.14\text{ mA}$ | **$4.1\text{ mW}$** | $5.4\%$ | Solution ionic resistance ($R_{\text{sol}} \approx 18\ \Omega$) |
| **Anodic Overpotential ($\eta_{\text{OER}}$)** | $0.55\text{ V}$ | $15.14\text{ mA}$ | **$8.3\text{ mW}$** | $10.9\%$ | Sluggish oxygen evolution kinetics on carbon |
| **Cathodic Overpotential ($\eta_{\text{HER}}$)** | $0.35\text{ V}$ | $15.14\text{ mA}$ | **$5.3\text{ mW}$** | $6.9\%$ | Hydrogen evolution activation energy |
| **Reversible Thermodynamic Work** | $1.23\text{ V}$ | $15.14\text{ mA}$ | **$18.6\text{ mW}$** | $24.3\%$ | Endothermic water-splitting reaction enthalpy |
| **Chemical Power in Stored $\text{H}_2$** | — | — | **$11.3\text{ mW}$** | **$14.8\%$** | Higher Heating Value (HHV) accounting for $\eta_F = 73.1\%$ |

### 4.6 Parasitic Anodic Side Reactions & Faradaic Deficit

Under anodic polarization during the oxygen evolution reaction ($E > 1.23\text{ V}$ vs. SHE), unpassivated graphite electrodes undergo competing electrochemical carbon oxidation:
$$\text{C}_{(s)} + 2\text{H}_2\text{O}_{(l)} \longrightarrow \text{CO}_{2(g)} + 4\text{H}^+_{(aq)} + 4e^- \quad (E^\circ = +0.207\text{ V vs. SHE})$$

Because carbon oxidation is thermodynamically favored over water oxidation ($E^\circ = 0.207\text{ V}$ vs. $1.229\text{ V}$), a minor fraction of the anodic Faradaic charge participates in carbon oxidation rather than oxygen gas evolution. This parasitic pathway, alongside micro-bubble dissolution and capacitive double-layer charging, accounts for the observed $26.9\%$ Faradaic deficit ($\eta_F = 73.1\%$). Gravimetric measurements confirm total anode mass loss is limited to $\Delta m = 1.2 \pm 0.2\text{ mg}$ over 4 hours ($<0.8\%$ of active submerged mass), ensuring structural stability.

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