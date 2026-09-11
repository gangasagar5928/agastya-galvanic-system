# Bill of Materials (BOM)

**Project:** The Agastya Galvanic System · **Date:** 2026-09-11 · **Budget target: ≤ ₹1,500**

---

## Cell Stack Materials

| # | Item | Spec | Qty | Source (indicative) | Approx. cost |
|---|---|---|---|---|---|
| 1 | Unglazed terracotta vessels | 100 mL, plain porous earthenware, inner Ø ~7 cm | 2 | Local potter / online craft supply | ₹60 |
| 2 | Copper cathode plate | 99.9 % Cu, ~4 × 7 cm, ~1 mm thick, flat | 2 | Metal supplier (Laxmi Pipes / local) | ₹120 |
| 3 | Zinc anode sheet | Commercial zinc, ~4 × 6 cm, ~0.5 mm thick | 2 | Science supplier / online | ₹80 |
| 4 | Copper sulfate (CuSO₄·5H₂O) | Lab grade (AR), ≥ 99 % | 500 g | Loba / Merck / S.D. Fine | ₹180 |
| 5 | Hardwood sawdust | De-resinated; hardwood (teak/shorea preferred) | 1 kg | Carpenter / lumber yard (free/cheap) | ₹20 |
| 6 | Distilled / DM water | Conductivity < 1 µS/cm | 5 L | Lab supply / local pharmacy | ₹100 |
| 7 | Conductive copper wire | 0.5 mm tinned, for cell interconnects | 2 m | Local electronics store | ₹30 |
| 8 | Alligator clips / banana plugs | For DMM/ammeter connections | 4 | Electronics shop | ₹60 |

**Cell stack subtotal: ~₹650**

---

## Boost Converter (Power Management)

| # | Item | Spec | Qty | Source | Approx. cost |
|---|---|---|---|---|---|
| 9 | Synchronous boost IC | TPS61099 / *equivalent* (see `PMIC.md`); SOT-23 or similar | 1 | Mouser / LCSC / Digi-Key (via LCSC) | ₹120 |
| 10 | Inductor (power) | 4.7 µH, low DCR, 100 mA sat, 0805/1210 size | 1 | Same as above | ₹25 |
| 11 | Input capacitor | ≥ 47 µF electrolytic or ceramic | 1 | — | ₹10 |
| 12 | Output capacitor | ≥ 100 µF low-ESR electrolytic + 1 µF ceramic | 2 | — | ₹20 |
| 13 | Feedback resistor divider | Per IC datasheet for 5.0 V out | 1 kit | — | ₹5 |
| 14 | Bypass caps, decoupling | 100 nF × 2, 10 nF × 1 | pack | — | ₹5 |
| 15 | SOT-236 / SOT-236L breakout board | FR4, for IC mounting | 1 | Online | ₹30 |
| 16 | Breadboard / perfboard | Small (170 pts) for final integration | 1 | — | ₹20 |
| 17 | Screw terminal blocks | 2-pin, 5 mm pitch, for connectors | 3 | — | ₹15 |

**Power management subtotal: ~₹250**

---

## Electrolyzer

| # | Item | Spec | Qty | Source | Approx. cost |
|---|---|---|---|---|---|
| 18 | Graphite pencil leads | 2B–6B, 0.5 mm, non-sacrificial carbon | 6 | Stationery shop | ₹30 |
| 19 | Graduated glass / plastic tube | 10 mL graduated (1 mL divisions), ~15 cm tall | 1 | Lab supply | ₹60 |
| 20 | Silicone / rubber stoppers | For sealing tube around electrodes | 2 | — | ₹20 |
| 21 | Dilute NaOH (or Na₂SO₄) | Lab grade, 0.1–0.5 M for electrolyzer electrolyte | 100 g | — | ₹30 |
| 22 | Micro-tubing (silicone) | ID 1.5 mm, for water seal / overflow | 10 cm | — | ₹10 |
| 23 | Beaker (electrolyzer bath) | 50–100 mL, glass | 1 | — | ₹20 |

**Electrolyzer subtotal: ~₹170**

---

## Tools & Measurement Consumables

| # | Item | Spec | Notes |
|---|---|---|---|
| 24 | Digital multimeter (DMM) | 4½ digit (lab-provided) | For Voc, I_sc logging |
| 25 | Ammeter (µA/mA) | 20 mA range (lab) | For continuous current logging |
| 26 | Stopwatch | Phone / lab timer | Bubbling timing |
| 27 | pH paper / indicator strips | Range 1–14 | Electrolyte check |
| 28 | Thermometer | 0–100 °C | Ambient confirmation |
| 29 | Clamp stand + bosshead | Lab standard | Holds gas tube |
| 30 | String / tape, marker pens | — | Lab consumables |

*Assumed lab-provided; cost = ₹0*

---

## Grand Total

| Category | Cost |
|---|---|
| Cell stack materials | ~₹650 |
| Boost converter parts | ~₹250 |
| Electrolyzer parts | ~₹170 |
| **Total materials** | **~₹1,070** |

> **Within the ₹1,500 target** with margin for re-order (≈ ₹430 contingency).

---

## Procurement Lead Times

| Item | Typical lead time |
|---|---|
| Terracotta vessels | 3–7 days (local); 7–14 (online) |
| Cu plates, Zn sheets | 3–5 days (local metal supplier) |
| CuSO₄, NaOH/Na₂SO₄ | 2–3 days (lab supply store) |
| IC + passives (TPS61099) | 7–14 days (LCSC/Mouser) |
| Pencil leads, tube, misc | 1–2 days (stationery) |

> **Procurement window:** Order IC + passives immediately; everything else can be gathered within 1 week.

---

## Notes

- All prices are indicative (INR) as of Sept 2026; verify before ordering.
- For the DMM and ammeter: confirm availability with lab coordinator.
- Keep receipts for project file; note lot numbers for CuSO₄ batch if required for reproducibility.
- De-resination of sawdust: boiling (boil × 2 h, dry overnight) can be done at lab sink — no special equipment beyond a hotplate + beaker.

*Verify all items against the SAFETY checklist before starting Phase 1.*