# Presentation & Viva Defence Prep

**Project:** The Agastya Galvanic System · **Date:** 2026-09-11

---

## 1. Presentation Outline (10–15 slides)

| Slide | Content |
|---|---|
| 1 | **Title:** A Biodegradable, Non-Lithium Earthen Solid-State Primary Battery with Sub-Volt Energy Harvesting for Disposable Off-Grid Micro-Sensors |
| 2 | **Problem:** Lithium dependence, e-waste, off-grid micro-sensor power gap |
| 3 | **Inspiration:** Agastya Samhita — traditional knowledge as engineering inspiration |
| 4 | **Concept (New POV):** The 4-stage chain (cell → boost → electrolyzer → H₂) |
| 5 | **Architecture:** Block diagram + materials summary |
| 6 | **The Cell:** Terracotta + sawdust matrix + Cu/Zn — the dendrite-retardant separator |
| 7 | **Electrochemistry:** Half-reactions, Nernst (E° = 2.20 V stack → 2.32 V Nernst), overpotentials |
| 8 | **PMIC:** TPS61099, cold-start < 0.9 V, sync rectification, efficiency budget → 82 %+ |
| 9 | **Electrolyzer:** Faraday's law, 15 mA → ~1 mL/min H₂, Faradaic efficiency ≥ 70 % |
| 10 | **Results:** Empirical Voc/I_sc/Polarization/η/H₂ plots (bench logs from `data/`) |
| 11 | **PRD Verification Matrix:** Gate status (Phase 0 complete; experimental verification gates) |
| 12 | **Patent & Publication Strategy:** Provisional filing (§3(p) device/composition claim) & IEEE TENSYMP 2026 conference track |
| 13 | **Sustainability Scorecard:** vs Li-ion & Pb-acid |
| 14 | **Future:** Scaling, sensor integration, IoT nodes |
| 15 | **Q&A** |

---

## 2. Anticipated Viva Questions & Answers

### Category A — Electrochemistry
**Q1. Why 2 cells in series?**
A1. Nernstideal gives 2.20 V stack (2 × 1.10 V); PRD requires ≥ 2.10 V; series pairing leaves ~0.1 V headroom for overpotential.

**Q2. What is the Nernst potential under load?**
A2. Per cell ≈ 1.05–1.10 V at 20 mA (Nernst 1.159 V minus η_a + η_c + IR). Two-cell ≈ 2.10–2.20 V.

**Q3. How do you estimate R_int?**
A3. From the slope of the polarization curve (linear ohmic region), V = E − I·R_int. Expected 10–30 Ω per stack.

**Q4. What limits I_sc to 20 mA?**
A4. R_int and electrode surface area; not chemistry. I_sc = Voc/R_int.

**Q5. How does the sawdust restrict Cu²⁺ crossover?**
A5. De-resinated wood fibres have micron capillaries; hydrated Cu²⁺ complexes are retained by electrostatic + geometric confinement; tortuosity τ² multiplies effective resistance.

### Category B — Power Electronics
**Q6. Why synchronous rectification?**
A6. A Schottky diode wastes ~0.3–0.5 V (≈ 25–30 % of P_out at this scale); a hi-side PFET drops ~10–50 mV → this is the difference between ~75 % and 82 %+ efficiency.

**Q7. How does cold-start below 0.9 V work?**
A7. Internal ring oscillator + charge-pump booster drives the high-side FET gate above V_in, starting the boost cycle; once V_out crosses ~2.5 V, main PWM loop takes over.

**Q8. What is impedance matching here?**
A8. The converter duty/current is set so the stack operates at its peak-power point — where V_stack ≈ Voc/2 — matching the source's R_int to the load's effective R. Maximizes P transferred.

**Q9. Why is the input capacitor large (≥ 47 µF)?**
A9. The earthen cell is a high-R_int source; the converter draws pulsed input current. A large cap decouples the controller from source sag, preventing dropout oscillation.

**Q10. Efficiency = ?** — hint
A10. η = P_out / P_in = (V_out·I_out)/(V_in·I_in). Budget ~ 82–86 % at 15 mA (PMIC.md §6). At 5 mA, efficiency drops (quiescent + switching fixed costs dominate).

### Category C — Electrolyzer
**Q11. Why graphite pencil electrodes?**
A11. Carbon is non-sacrificial in aqueous electrolysis (it doesn't dissolve as an active anode material, unlike, say, Al). Cheap, abundant, conductive.

**Q12. How do you compute the H₂ volume?**
A12. V = I·t/(nF)·22,400 mL with n=2, F=96485 C. 15 mA × 600 s → 1.045 mL theoretical.

**Q13. Why is our Faradaic efficiency below 100 %?**
A13. Parasitic side reactions (carbon oxidation, peroxide), gas dissolution, leakages. Target ≥ 70 % is realistic for carbon in Na₂SO₄.

**Q14. What happens to the gas? H₂ safety?**
A14. H₂ rises and disperses safely in a ventilated room; never enclosed; no flames. (SAFETY.md §4.4)

### Category D — Patent / Novelty
**Q15. Is this patentable?**
A15. Chemistry is not (public domain + §3(p) traditional knowledge). We claim device + composition: (1) dendrite-retardant lignocellulose–ceramic separator at a specific packing ratio; (2) integrated PMIC↔R_int-matched micro-electrolyzer package.

**Q16. Isn't the Agastya Samhita claim pseudoscience?**
A16. We don't claim the text as a scientifically reproducible recipe; we use it as an inspiration for the sustainable-material combination and give it due cultural credit. All measurements are modern and verifiable.

**Q17. Why target 45–50 % grant probability?**
A17. The claims are narrow (device/composition), prior art is dense (Daniell, wood separators, boost converters). Narrow, well-evidenced claims → moderate chance; worth it for a provisional filing.

### Category E — Sustainability / Ethics
**Q18. Why not lithium-ion?**
A18. Our target is disposable µ-sensors: Li is over-engineered (cost, recycling complexity) and has toxic extraction chain. Terracotta + wood + Cu/Zn is 100 % biodegradable/recyclable at a fraction of cost.

**Q19. How is waste handled?**
A19. Spent CuSO₄ → hazardous-waste point (copper is aquatic toxin, not down the drain). Sawdust → compostable. Cu/Zn → scrap. Documented in `SAFETY.md`.

**Q20. What's the environmental footprint?**
A20. Materials: kiln-fired clay (~CO₂ from firing), mined Cu/Zn (pre-existing supply chains), wood by-product. All offset by zero recharge-cycle energy and biodegradable end-of-life.

### Category F — Reviewer Challenges & Edge Cases
**Q21. Your stack internal resistance is 14–18 Ω/cell (~30 Ω stack), 4–9× higher than a classic Daniell cell. Won't startup inrush current collapse the input voltage below the TPS61099 cold-start threshold?**
A21. Direct hardwired startup (`EN = VIN`) would indeed sag voltage below UVLO ($50\text{ mA} \times 30\ \Omega = 1.5\text{ V}$ drop). We mitigated this by: (1) an input buffer reservoir capacitor ($C_{\text{in}} = 220\ \mu\text{F} \parallel 47\ \mu\text{F}$) supplying $\sim 0.61\text{ mJ}$ of energy to absorb the 5 ms startup inrush spike; (2) a delayed/hysteretic enable pin holding the PMIC in 1 µA shutdown until $C_{\text{in}}$ reaches full $V_{\text{oc}}$; and (3) larger surface-area electrodes in the full-scale build dropping stack $R_{\text{int}}$ to $\le 16\ \Omega$.

**Q22. Why target an IEEE conference rather than an IEEE Transactions journal?**
A22. Transactions journals require 2+ years of continuous cycling data and advanced EIS spectroscopy. An IEEE Region 10 conference (such as IEEE TENSYMP 2026 or TENCON) provides peer-reviewed IEEEXplore indexing suitable for an undergraduate capstone, while establishing verified prior art to support our provisional patent application.

**Q23. Why does the GitHub repository show Phase 0 while the presentation outline covers the entire pipeline?**
A23. Phase 0 represents completed foundations (safety analysis, PMIC modeling, PRD specification, and BOM procurement). The remaining phases represent the planned 6-week execution gates. Metrics in the presentation are explicit target thresholds to be verified on the bench, not pre-claimed results.

---

## 3. Demo Script (2–3 min for evaluators)

1. **Show** the two terracotta vessels + electrodes + sawdust matrix cold.
2. **Connect** stack → PMIC → measuring DMMs (Voc display).
3. **Close circuit** to electrolyzer; **start stopwatch**.
4. **At ≤ 10 s:** point at tube — H₂ bubbles rising. Narrate "10-second criterion met."
5. **Show** rail at 5.00–5.10 V on DMM.
6. **Narrate** the 4 h discharge, the η ≥ 82 %, and the zero-secondary-battery fact.
7. **Close** with sustainability line + patent claims slide.

---

## 4. Materials to Have at the Viva

- [ ] 1 A4-page system diagram (colour, laminated)
- [ ] PRD verification matrix printout
- [ ] 2–3 representative plots (polarization, η map, H₂ curve)
- [ ] Printed patent claim sketch
- [ ] Safety card (PPE + spill actions)
- [ ] Live demo rig (if permitted) or recorded video

---

*Update results slides as `data/` fills. Practice the demo ≤ 2 minutes repeatedly.*