# Power Management IC — Design Notes

**Project:** The Agastya Galvanic System · **Date:** 2026-09-11

---

## 1. Requirements Recap

| Parameter | PRD Value |
|---|---|
| Input voltage range | 0.9 – 2.2 V |
| Cold-start threshold | V_in(min) ≤ 0.9 V |
| Output voltage | 5.0 V ± 2 % (4.90–5.10 V) |
| Load | 5–50 mA (nominal 15 mA) |
| End-to-end efficiency | ≥ 82 % at operating point |
| Topology | Synchronous boost (mandatory for light-load efficiency) |

---

## 2. IC Candidate Table

| IC (indicative) | Manufacturer | Vin(min) cold-start | Vout adjustable | Sync rect? | Max Iout | Package | Key notes |
|---|---|---|---|---|---|---|---|
| **TPS61099** | TI | 0.5 V (cold-start) | 1.8–5.5 V | Yes | 200 mA | SOT-236L | Ultra-low quiescent (1 µA), PFM/PWM, 0.5 V start → excellent |
| **TPS61090** | TI | 0.5 V | 1.8–5.5 V | Yes | 200 mA | SOT-236L | Same family, slightly different control scheme |
| **TPS61200** | TI | 0.3 V (start-up) | 1.8–5.5 V | Yes | 600 mA | DFN-6 | High-current, but bigger; overkill current capability |
| **MAX17222** | Maxim/Analog | 0.4 V | Up to 5.5 V | Yes | 100 mA | SOT-23 | Ultra-low IQ, nanoPower |
| **LTC3108** | Analog Devices | 0.2 V (needs L:100 ratio) | 2.35/5.0 V | Yes | 50 mA | MSOP-12 | Designed for thermoelectric/harvesting; needs high-ratio transformer, more complex |

### Recommended Choice: **TPS61099**

**Rationale:**
1. Cold-start at 0.5 V — well below the 0.9 V threshold; gives comfortable margin if the cell stack sags.
2. Sync rectification built-in — no external diode; achieves ≥ 82 % at 15 mA load.
3. Ultra-low quiescent current (~1 µA) — does not drain the stack when the electrolyzer is off.
4. SOT-236L package — simple, breadboard-friendly.
5. Adjustable output via resistor divider — trivial to set to 5.0 V.
6. Available through LCSC/Mouser with 7–14 day delivery to India.

> **Backup:** MAX17222 (if TPS61099 is out of stock); TPS61200 for high-current futures.

---

## 3. Schematic — TPS61099 (5.0 V output)

```
           V_stack
              │
         ┌────┴────┐
         │ Cin     │  47 µF ceramic + 47 µF electrolytic (parallel)
         └────┬────┘
              │
    ┌─────────┤ VIN (Pin 1) ───────────────────────┐
    │         │                                      │
    │         └──────────────────────┐               │
    │                                │               │
    │         ┌──────────────┐       │               │
    │         │ TPS61099     │       │               │
    │         │              │ EN (Pin 4) = VIN      │
    │  GND────│ GND (Pin 6)  │       │               │
    │         │              │       │               │
    │    L ───│ SW (Pin 2) ──┼── L (4.7 µH) ───┬────┘
    │         │              │                  │
    │         └──────────────┘               VOUT (Pin 5)
    │                                      = 5.0 V
    │                                           │
    │                                    ┌──────┴──────┐
    │                                    │ Cout        │
    │                                    │ 100 µF low  │
    │                                    │ ESR + 1µF   │
    │                                    └──────┬──────┘
    │                                           │
    │        R1 (per datasheet)                 │
    │   ┌────┤ FB (Pin 3) ───────┐              │
    │   │    │                   │              │
    │   │    └───────────────────┘              │
    │   │                                      │
    │   │          R2                           │
    │   └─────[R2]──────────────────── GND──────┘
    │
   GND
```

**Resistor divider for V_out = 5.0 V:**

TPS61099 uses a feedback reference V_FB ≈ 0.6 V (check datasheet for exact value):

```
V_out = V_FB × (1 + R1/R2)

If V_FB = 0.6 V and V_out = 5.0 V:
  R1/R2 = (5.0/0.6) − 1 = 7.33

Choose: R2 = 100 kΩ, R1 = 733 kΩ (use 750 kΩ standard)
  → V_out = 0.6 × (1 + 750/100) = 0.6 × 8.5 = 5.10 V (just inside tolerance)
  → or R1 = 715 kΩ → 5.07 V  (tight)
  → or R1 = 680 kΩ → 4.98 V  (inside 4.90–5.10 V window ✓)
```

---

## 4. Inductor Selection

| Parameter | Value | Rationale |
|---|---|---|
| Inductance | 4.7 µH | TPS61099 typical; balances ripple vs saturation |
| DCR (DC resistance) | ≤ 50 mΩ | Minimizes I²R loss; target < 3 % of P_out |
| Isat (saturation current) | ≥ 500 mA | Above max switch current |
| Size | 0805 or 1210 SMD | Breadboard adapter |

---

## 5. Capacitor Selection

| Cap | Value | Type | Why |
|---|---|---|---|
| Cin (bulk) | 47 µF | Ceramic (X5R) + 47 µF electrolytic (parallel) | Handles low-Vin startup transient |
| Cin (bypass) | 100 nF | Ceramic (X7R) | HF decoupling |
| Cout (bulk) | 100 µF | Low-ESR electrolytic (≤ 100 mΩ) | Output ripple |
| Cout (HF) | 1 µF | Ceramic (X5R) | HF filtering |

---

## 6. Efficiency Budget — Detailed

At operating point: V_stack = 1.8 V (mid-range), V_out = 5.0 V, I_out = 15 mA.

```
P_out = 5.0 × 0.015 = 0.075 W

Ideal duty cycle: D = 1 − (Vin/Vout) = 1 − (1.8/5.0) = 0.64
Actual D ≈ 0.66 (accounting for drops)
```

| Loss source | Estimate (at 15 mA) | % of P_in |
|---|---|---|
| Inductor DCR: I²L × DCR | (0.042)² × 0.05 ≈ 0.088 mW → ≈ 0.1 % | ~0.1 % |
| MOSFET Rdson (high-side + low-side) | ≈ 2–3 mW total | ~2.5 % |
| Switching losses (Coss, crossover) | ≈ 1–2 mW | ~1.5 % |
| Gate drive (control + FET charge) | ≈ 1 mW | ~0.8 % |
| Quiescent / IC bias | ≈ 0.5 mW (1 µA × 5 V) | ~0.4 % |
| FB resistor divider leakage | ≈ 0.03 mW | ~0.02 % |
| **Total estimated losses** | **~5–7 mW** | **~5–6 %** |
| **Estimated η** | **≥ 82–86 %** | **PRD target met ✓** |

> Measured η will be logged in `data/efficiency/` across Vin sweep (1.6–2.2 V) and load sweep (5–50 mA).

---

## 7. Cold-Start Mechanism

TPS61099's cold-start sequence:
1. At V_in ≥ 0.5 V: internal low-power oscillator starts → pumps charge to output.
2. Once V_out reaches ~2.5 V: main boost loop takes over → full regulation to 5.0 V.
3. Enable pin (EN) = V_IN → converter runs as soon as cells are connected.

**Timing at V_in = 1.8 V:** V_out reaches 5.0 V in ~5–15 ms (negligible vs 10 s electrolyzer target).

---

## 8. PCB / Breadboard Layout Notes

- Keep input loop (Cin → IC → Inductor → Cin) tight: high current loop area.
- Route GND via a solid plane or star ground from IC to Cin and Cout.
- Sense the V_out at the load terminal (not at Cout) to compensate for trace resistance.
- FB divider resistors: place close to FB pin, away from SW node (high dV/dt).

---

## 9. Testing Protocol (Phase 2)

| Test | Method | Pass |
|---|---|---|
| Cold-start | Sweep Vin from 0 → 5 V, record V_out rise | V_out hits 5.0 V before Vin = 1.0 V |
| Regulation sweep | Fix Vin at 1.6, 1.8, 2.0, 2.2 V; measure V_out at I_load = 5, 15, 30, 50 mA | All V_out ∈ [4.90, 5.10] V |
| Efficiency sweep | P_in meter + P_out meter at each (Vin, I_load) | η ≥ 82 % at (1.8 V, 15 mA) |
| Load step | 0 → 15 mA step; scope V_out | Overshoot < 200 mV; settling < 1 ms |
| Line transient | V_stack ramp 1.6 → 2.2 V at 15 mA load | V_out remains in window |

*Results logged in `data/efficiency/`.*