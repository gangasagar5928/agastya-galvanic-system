# ROADMAP — The Agastya Galvanic System

> **A Biodegradable, Non-Lithium Earthen Solid-State Primary Battery with Sub-Volt Energy Harvesting for Disposable Off-Grid Micro-Sensors**

*Last updated: 2026-09-11*

---

## 1. Project Vision & North Star

Build a working, demonstrable **eco-friendly primary battery stack** that:

- Delivers **Voc ≥ 2.10 V** (two-cell series configuration), **Isc ≥ 20 mA**.
- Boosts the variable 1.6–2.2 V stack to a regulated **5.0 V ± 2 % rail at ≥ 82 % end-to-end efficiency**.
- Drives a **solid-state micro-electrolyzer** producing visible H₂ gas — **zero secondary battery assistance**.
- Uses only **biodegradable, non-toxic, non-lithium materials**: terracotta, sawdust, copper, zinc, aqueous CuSO₄.
- Roots itself in the **Agastya Samhita** traditional-knowledge lineage while remaining a defensible patent claim (device + composition, not chemistry).

**North Star metric:** Standalone demo where the cell stack alone (no bench supply, no rechargeable buffer) sustains ≥ 4 h continuous discharge at 15 mA while bubbling hydrogen within 10 s of circuit closure.

### Traditional Sanskrit Text Citations (*Agastya Samhita*)

#### Cell Construction (*Agastya Samhita*, Verse 1)
```sanskrit
संस्थाप्य मृण्मये पात्रे ताम्रपत्रं सुसंस्कृतम्।
छादयेच्छिखिग्रीवेन चार्द्राभिः काष्ठपांसुभिः॥
दस्तालोष्टो निधातव्यस्ततः पारदसंयुतः।
संयोगाज्जायते तेजो मित्रावरुणसंज्ञितम्॥
```
> *Saṃsthāpya mṛṇmaye pātre tāmrapatraṃ susaṃskṛtam |*  
> *Chādayecchikhigrīvena cārdrābhiḥ kāṣṭhapāṃsubhiḥ ||*  
> *Dastāloṣṭo nidhātavyastataḥ pāradasaṃyutaḥ |*  
> *Saṃyogājjāyate tejo mitrāvaruṇasaṃjñitam ||*  
>
> **Translation:** Place a well-cleaned copper sheet (*tāmrapatra*) into an earthenware vessel (*mṛṇmaya pātra*). Cover it with copper sulfate (*shikhigrīva*, peacock-blue salt) and moist sawdust (*ārdra kāṣṭhapāṃsu*). Insert a zinc rod (*dastāloṣṭa*). By this galvanic conjunction is generated electrical energy (*tejas*) designated as *Mitra-Varuna* (complementary polarities / electromotive force).

#### Water Splitting & Gas Evolution (*Agastya Samhita*, Verse 2)
```sanskrit
अनेन जलभङ्गोऽस्ति प्राणोदानेषु वायुषु।
एवं शतानां कुम्भानां संयोगः कार्यकृत्तमः॥
```
> *Anena jalabhaṅgo'sti prāṇodāneṣu vāyuṣu |*  
> *Evaṃ śatānāṃ kumbhānāṃ saṃyogaḥ kāryakṛttamaḥ ||*  
>
> **Translation:** By this electrical power, water decomposition occurs (*jalabhaṅga*), separating into *Prāṇa* (Oxygen at the positive electrode) and *Udāna* (Hydrogen at the negative electrode). Connecting multiple such vessels in series provides powerful electrochemical actuation.

---

## 2. Phase Plan

### Phase 0 — Foundations & Safety (Week 0–1) ✅ THEREFORE COMPLETE (documentation in place)

| Deliverable | Status | Notes |
|---|---|---|
| PRD (Product Requirements Document) | ✅ | See `docs/PRD.md` |
| Project Wiki (`wiki.md`) | ✅ | See `wiki.md` |
| BOM & procurement list | ✅ | See `docs/BOM.md` |
| Hazard assessments (MSDS, ventilation, PPE) | ✅ | See `docs/SAFETY.md` |
| Syllabus mapping (EEE framework New POV) | ✅ | See `docs/SYLLABUS_MAPPING.md` |

### Phase 1 — Cell Chemistry Bench (Week 1–3)

**Goal:** Prove the core galvanic cell meets PRD electrical targets at stack level.

- [ ] Fabricate 2 × terracotta vessels (100 mL unglazed) in-house or procure.
- [ ] Machine 99.9 % Cu cathode plates + Zn anode sheets.
- [ ] De-resinate hardwood sawdust (boil → rinse → dry); grade by particle size.
- [ ] Formulate 1.0 M CuSO₄; immobilize in sawdust matrix at specified packing ratio.
- [ ] Build single-cell test jig: record Voc, Isc, polarization sweep.
- [ ] Assemble 2-cell series stack; verify Voc ≥ 2.10 V & Isc ≥ 20 mA.
- [ ] Run 4 h soak test at 15 mA constant-current load; log V(t).

**Exit criteria (Phase 1 gates):**
- `Voc(stack) ≥ 2.10 V` sustained for 30 min.
- `Isc ≥ 20 mA` at 25 °C ambient.
- Voltage at 15 mA load stays `≥ 1.5 V` for 4 h.

### Phase 2 — Power Management Stage (Week 3–5)

**Goal:** A synchronous boost converter with cold-start below 0.9 V that regulates 5 V ± 2 %.

- [ ] Select boost IC (see `docs/PMIC.md` for candidate table + rationale).
- [ ] Prototype converter on breakout/PCB; confirm cold-start at Vin ≤ 0.9 V.
- [ ] Closed-loop regulation check: 5.00 V ± 100 mV across Vin sweep 1.6 → 2.2 V.
- [ ] Efficiency sweep across load (5–50 mA); log η(Vin, Iload) — target η ≥ 82 % end-to-end.
- [ ] Load-step transient test (0 mA → 15 mA) — overshoot/undershoot & settling time.
- [ ] MPPT-lite impedance matching: sweep duty cycle to find peak-power operating point of the stack.

**Exit criteria:**
- Cold-start confirmed below 0.9 V (documented in `data/` logs).
- Regulated 5 V rail within 2 % tolerance under 15 mA constant load.
- End-to-end power conversion efficiency ≥ 82 % at the operating point.

### Phase 3 — Electrolyzer Stage (Week 5)

**Goal:** Visible, measurable H₂ generation from regulator rail — nothing else.

- [ ] Assemble non-sacrificial graphite pencil electrodes in graduated micro-fluidic gas collection tube.
- [ ] Calibrate collection tube graduations (mL of gas per cm) in `docs/ELECTROLYZER.md`.
- [ ] Confirm cathodic bubbling ≤ 10 s after circuit closure (video-document with timestamp).
- [ ] Measure gas collection rate (µL/min) & Faradaic efficiency vs. expected.
- [ ] On-line impedance check: verify electrolyzer load keeps the boost converter in its ≥ 82 % window.

**Exit criteria (Phase 3 gates):**
- Visible bubbling at cathode ≤ 10 s of closure.
- Steady collection rate logged for ≥ 30 min.
- Faradaic efficiency calculation documented (≥ 70 % target).

### Phase 4 — System Integration & Characterization (Week 6)

**Goal:** Complete physical integration and empirical data collection on display rig.

- [ ] Full-system integration in display acrylic containment tray (per `docs/FULL_SCALE_BOM.md`).
- [ ] 4-hour continuous discharge run at 15 mA; record $V_{\text{stack}}(t)$ and $V_{\text{rail}}(t)$.
- [ ] Empirical $V\text{–}I$ polarization curves ($0\text{ to }30\text{ mA}$) and internal resistance extraction.
- [ ] Inrush current capture on digital storage oscilloscope (DSO) validating $C_{\text{in}}$ buffer sizing.
- [ ] Video recording of live cold-start without wall power or external buffer.

**Exit criteria (Phase 4 gates):**
- System operates autonomously for 4 hours meeting all PRD thresholds.
- Zero battery assistance verified.
- Empirical datasets logged in `data/` directory.

### Phase 5 — Patent Filing & IEEE Conference Publication (Week 7)

**Goal:** Secure intellectual property priority date and submit conference paper.

- [ ] **Provisional Patent Application:** File provisional patent with Indian Patent Office (IPO) under Educational Institution tier (Statutory fee: ₹1,750). Claims focus on:
  1. Composite separator architecture (de-resinated lignocellulose + unglazed porous ceramic shell).
  2. Sub-volt energy-harvesting electrolyzer package with source-impedance matched PMIC.
- [ ] **IEEE Conference Manuscript Preparation:** Target IEEE TENSYMP 2026 / IEEE TENCON (Region 10 conference with IEEEXplore indexing):
  1. Empirical polarization and discharge curves.
  2. Randles equivalent circuit model validation.
  3. Faradaic efficiency ($\eta_F$) and gas yield calculations.
  4. Comparative benchmarking table against $\ge 3$ recent sustainable energy harvesting works.
- [ ] Departmental viva presentation rehearsal with live hardware demonstrator.

**Exit criteria (Phase 5 gates):**
- Provisional patent application filed with IPO.
- Conference manuscript completed with empirical datasets.
- Successful viva defense with live working prototype.

---

## 3. Milestones (Gantt-style)

| Milestone | Target Date | Gate | Blocking Risk |
|---|---|---|---|
| M1 Material procurement complete | Week 2 | All BOM items in hand | Terracotta vessel sourcing |
| M2 Single-cell meets spec | Week 3 | Voc ≥ 1.05 V/cell, Isc ≥ 10 mA/cell | Electrolyte matrix mold/dehydration |
| M3 Stack meets spec | Week 4 | Voc ≥ 2.10 V, Isc ≥ 20 mA, 4 h soak | Zinc anode passivation under load |
| M4 Boost stage cold-starts & regulates | Week 6 | Vin(min) ≤ 0.9 V, 5 V ± 2 %, η ≥ 82 % | Low-Vin cold-start latch-up |
| M5 Electrolyzer bubbling ≤ 10 s | Week 6 | Gas visible & steady | Cell/rail sag under converter inrush |
| M6 End-to-end 4 h demo | Week 7 | All success criteria green | Cumulative voltage decay |
| M7 Documentation + patent paper | Week 8 | All docs reviewed | — |

---

## 4. Risk Register

| # | Risk | Likelihood | Impact | Mitigation |
|---|---|---|---|---|
| R1 | Voc below 2.10 V across two cells | Med | High | Cell preconditioning, higher-purity Cu, tighter Zn surface prep |
| R2 | Copper crossover through sawdust matrix | Med | Med | Denser matrix, thicker wall, de-resination removes capillary shortcuts |
| R3 | Zinc dendrites bridging to Cu | Med | High | Dendrite-retardant matrix (core claim), periodic osmosis check |
| R4 | Cold-start below 0.9 V failure | Med | High | Redundant boost IC options (see `docs/PMIC.md`); keep cell ≥ 1.6 V working range |
| R5 | Efficiency dips < 82 % at 15 mA | Med | Med | Operate at peak-power duty cycle; synchronous rectification is mandatory |
| R6 | Electrolyzer sags the rail on connection | Med | Med | Soft-start / pre-charge cap on electrolyzer bus |
| R7 | Sawdust matrix dries out mid-test | Low–Med | High | Saturate with CuSO₄ before runs; humidity-controlled storage |
| R8 | Patent objection under Indian Patents Act §3(p) | High | — | Claim device & composition only, never chemical formula; see `docs/PATENT_STRATEGY.md` |

---

## 5. Success Criteria Checklist (traceable to PRD)

| PRD Requirement | Tolerance | Verification Method | Phase |
|---|---|---|---|
| Voc ≥ 2.10 V (2-cell) | sustained ≥ 30 min | DMM logging, `data/` | 1 |
| Isc ≥ 20 mA @ 25 °C | ambient | Ammeter short pulse | 1 |
| Boost to 5.0 V ± 2 % | 4.90–5.10 V | Rail logging under 15 mA load | 2 |
| End-to-end η ≥ 82 % | at 15 mA operating point | Input/output power metering | 2 |
| Continuous load 15 mA ≥ 4 h | V(stack) ≥ 1.5 V end of run | V(t) log | 4 |
| Cathodic bubbling ≤ 10 s | from circuit closure | Video timestamp | 3 |
| Zero secondary battery assistance | none used anywhere | BOM audit + demo | 4 |

---

## 6. Workback Schedule (6-week sprint from today 2026-09-11)

| Week | Focus |
|---|---|
| **W0 (11–13 Sep)** | Finalize BOM, order materials, safety review, calibrate kit |
| **W1 (14–20 Sep)** | Single-cell fabrication + first Voc/Isc data |
| **W2 (21–27 Sep)** | 2-cell stack, polarization curve, 4 h soak test |
| **W3 (28 Sep–4 Oct)** | Boost converter breadboard, cold-start verification |
| **W4 (5–11 Oct)** | Efficiency + regulation tuning; electrolyzer assembly |
| **W5 (12–18 Oct)** | End-to-end integration, 4 h run, demo dry-run |
| **W6 (19–25 Oct)** | Documentation freeze, patent paper, defense prep |

---

## 7. Definition of Done (DoD)

The project is **Done** when:

1. Every PRD functional requirement passes its verification method (Section 5) with logged evidence.
2. Demo runs unattended for 4 hours: 15 mA load, rail at 5.0 V ± 2 %, H₂ bubbling steady.
3. All documentation (`wiki.md`, `docs/*`, `data/*`, `tools/*`) is complete and internally consistent.
4. Patent strategy doc is finalized with claims ready for a professional attorney.
5. The EEE syllabus map (Energy Storage / Power Electronics / Electrochemical Engg) is signed off by the advisor.

---

*Maintain this file as the single source of truth for schedule and gates. Update statuses with checkboxes as phases complete; keep `data/` logs timestamped at every verification.*