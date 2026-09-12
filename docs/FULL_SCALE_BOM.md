# Full-Scale Prototype Bill of Materials (BOM) & Engineering Improvements

**Project:** The Agastya Galvanic System (Topic 1)  
**Reference Design:** Two-Cell Earthen Galvanic Stack with Synchronous PMIC Boost & Water-Splitting Micro-Electrolyzer  
**Target Build:** Display-Grade, Fully Operational Physical Hardware Prototype  

---

## 1. System Bill of Materials

### A. Primary Galvanic Energy Cells (Stack Subsystem)

| # | Item | Engineering Specification | Qty | Indicative Source | Approx. Cost (INR) |
|---|------|---------------------------|-----|-------------------|-------------------|
| A1 | Terracotta vessels (*Kulhads*) | Unglazed porous red earthenware, height 90 mm, top Ø 75 mm, capacity ~180 mL, flat base | 2 | Local potter / nursery supplier | ₹80 |
| A2 | Solid Zinc Anode Rods (*Dasta*) | High-purity Zn (≥ 99.9%), solid cylindrical rod, Ø 12 mm × 100 mm with M3 drilled top tap or soldered tab | 2 | Metal trade supplier / Lab chemicals vendor | ₹240 |
| A3 | Electrolytic Copper Cathode Plates (*Tamra*) | C11000 grade pure copper sheet, 1.5 mm thickness, 40 mm × 85 mm curved profile, pre-drilled terminal tab | 2 | Industrial copper distributor / online metals | ₹180 |
| A4 | Copper Sulfate Pentahydrate (*Shikhigriva*) | Analytical Reagent (AR) Grade $\text{CuSO}_4\cdot 5\text{H}_2\text{O}$ crystals (≥ 99% purity) | 500 g | Lab chemical supplier (Loba/Merck) | ₹220 |
| A5 | Hardwood Sawdust Matrix (*Kashthapamsu*) | De-resinated, kiln-dried teak/sal wood sawdust, sieved through 30-mesh screen | 1 kg | Carpentry workshop / Timber mill | ₹30 |
| A6 | Hydrogel Binder (Anti-Evaporation) | Agar-agar or food-grade sodium carboxymethyl cellulose (CMC) | 50 g | Baking / Food ingredients store | ₹60 |
| A7 | Secondary Containment Tray | Clear laser-cut cast acrylic (PMMA), 5 mm wall, 220 mm × 120 mm × 40 mm, leak-tested | 1 | Local acrylic fabricator | ₹250 |
| A8 | Series Interconnect Harness | 16 AWG solid bare copper wire, twisted pair geometry, soldered ring terminals | 1 m | Electrical hardware store | ₹50 |

**Subsystem A Subtotal: ~₹1,110**

---

### B. Power Management & Step-Up Electronics (PMIC Subsystem)

| # | Item | Engineering Specification | Qty | Indicative Source | Approx. Cost (INR) |
|---|------|---------------------------|-----|-------------------|-------------------|
| B1 | Ultra-Low Input Synchronous Boost Converter | Custom/commercial breakout based on TI TPS61023 / TPS61099 or Analog Devices LTC3105, $V_{\text{in}} = 1.6\text{ V} - 2.4\text{ V}$, $V_{\text{out}} = 5.0\text{ V} \pm 2\%$, $I_{\text{out}} \ge 50\text{ mA}$, $\eta \ge 85\%$ | 1 | Robu.in / ElectronicsComp / Mouser | ₹280 |
| B2 | Power Inductor | 4.7 µH, low DCR (< 40 mΩ), saturation current $I_{\text{sat}} \ge 1.2\text{ A}$, shielded ferrite core | 1 | Electronics component distributor | ₹35 |
| B3 | Input/Output Filter Capacitors | Input: 47 µF 16V low-ESR tantalum; Output: 100 µF 10V electrolytic + 10 µF MLCC | 1 set | Electronics component distributor | ₹40 |
| B4 | Status & Telemetry Indicators | 0805 low-current green LED (2 mA) with 1.5 kΩ ballast resistor ("Power Good" rail indicator) | 1 | Local electronics market | ₹5 |
| B5 | Screw Terminal Blocks | 2-pin 5.08 mm pitch PCB terminal blocks (input from stack, output to electrolyzer) | 2 | Local electronics market | ₹20 |
| B6 | Probing Header Pins | Gold-plated 2.54 mm test points for non-invasive DMM / oscilloscope probe hooks | 4 | Local electronics market | ₹10 |

**Subsystem B Subtotal: ~₹390**

---

### C. Water-Splitting Micro-Electrolyzer Subsystem

| # | Item | Engineering Specification | Qty | Indicative Source | Approx. Cost (INR) |
|---|------|---------------------------|-----|-------------------|-------------------|
| C1 | Electrolyzer Chamber Body | Heavy-wall borosilicate glass cylinder / graduated boiling tube, 25 mm outer Ø, 150 mm height, with silicone top stopper | 1 | Scientific glassware supplier | ₹120 |
| C2 | Display Stand & Base Mount | Solid clear acrylic machined base (60 mm × 60 mm × 40 mm) with recessed vertical tube pocket | 1 | Acrylic fabricator | ₹150 |
| C3 | Non-Sacrificial Graphite Electrodes | High-density extruded graphite rods (Ø 4 mm × 100 mm) or solid 2B pencil cores, lead-free | 2 | Scientific supplier / Art graphite vendor | ₹60 |
| C4 | Electrode Wiring & Sealing | 20 AWG silicone-jacketed copper leads with heat-shrink insulated waterproof seals | 2 | Electronics market | ₹30 |
| C5 | Electrolyzer Solution | 0.1 M aqueous Sodium Sulfate ($\text{Na}_2\text{SO}_4$) or Sodium Bicarbonate ($\text{NaHCO}_3$) in distilled water | 250 mL | Chemistry lab supplier / Pharmacy | ₹40 |
| C6 | Distilled / Deionized Water | Battery-grade demineralized water (conductivity < 1.0 µS/cm) | 2 L | Automobile battery shop / Pharmacy | ₹40 |

**Subsystem C Subtotal: ~₹440**

---

### D. Instrumentation, Display & Bench Rig

| # | Item | Engineering Specification | Qty | Indicative Source | Approx. Cost (INR) |
|---|------|---------------------------|-----|-------------------|-------------------|
| D1 | Digital Multimeter (Monitoring) | 3.5-digit DMM with dedicated DC voltage range (0.01 V resolution) for permanent stack display | 1 | Lab inventory / Generic DMM | ₹350 |
| D2 | Wooden Presentation Baseboard | Teak-finish polished MDF/plywood baseboard (450 mm × 250 mm × 12 mm) with routing for cabling | 1 | Local carpenter | ₹200 |
| D3 | Brass / Engraved Nameplates | Laser-etched black acrylic / brass plate with Sanskrit-to-English chemical legend | 1 | Trophy / sign shop | ₹150 |
| D4 | Banana Test Probes & Shunts | Shrouded banana-to-alligator test probe cables (red/black) | 1 pair | Lab equipment | ₹80 |

**Subsystem D Subtotal: ~₹780**

---

### Total Prototype Budget Summary

| Subsystem | Scope | Budget (INR) |
|-----------|-------|--------------|
| **Subsystem A** | Primary Galvanic Earthen Cells | ₹1,110 |
| **Subsystem B** | Synchronous Boost PMIC Stage | ₹390 |
| **Subsystem C** | Micro-Electrolyzer & Gas Evolution | ₹440 |
| **Subsystem D** | Display Rig, Instrumentation & Labels | ₹780 |
| **Total Build Cost** | **Complete Full-Scale Demonstration System** | **₹2,720** |

*(Note: Budget without external multimeter/stand: ~₹1,940).*

---

## 2. Engineering Improvements Over Basic PoC Bench

The physical prototype in the reference design incorporates 5 key engineering upgrades over standard laboratory breadboards:

### Improvement 1: Solid Zinc Rods vs. Thin Zinc Foil
- **PoC Limitation:** Thin 0.2 mm zinc sheet buckles, corrodes non-uniformly, develops high interfacial resistance, and dissolves within 8–12 operating hours.
- **Full-Scale Upgrade:** Solid Ø 12 mm cast zinc rods provide robust structural rigidity, uniform circumferential galvanic erosion, lower bulk ohmic resistance ($R_{\text{bulk}} < 5\text{ m}\Omega$), and sustained operational lifetime exceeding 100 discharge hours.

### Improvement 2: Immobilized Hydrogel Sawdust Matrix vs. Loose Wet Slurry
- **PoC Limitation:** Wet sawdust slurry suffers from gravity settling, non-uniform salt concentration, rapid water evaporation (dry-out within 12 h), and exterior salt blooming on the porous terracotta.
- **Full-Scale Upgrade:** Blending 1.5 wt% agar-agar or sodium CMC into the $1.0\text{ M CuSO}_4$ sawdust matrix forms an immobilized semi-solid hydrogel. This stabilizes ionic transport paths, prevents moisture evaporation, stops leakage, and maintains cell open-circuit voltage ($V_{\text{oc}} \ge 1.07\text{ V}$/cell) over 72+ continuous hours.

### Improvement 3: Synchronous Boost Topology with Low Quiescent Current
- **PoC Limitation:** Standard diode-boost converter modules have diode conduction drop ($V_f \approx 0.3\text{ V}$), dropping conversion efficiency below 65% when input is 2.1 V.
- **Full-Scale Upgrade:** Synchronous rectification using dual N-channel/P-channel MOSFETs ($R_{\text{DS(on)}} < 50\text{ m}\Omega$) achieves end-to-end efficiency $\eta \ge 86\%$ at $I_{\text{load}} = 20\text{ mA}$. Onboard green LED provides instant optical proof of regulated 5.0 V power without loading the cell.

### Improvement 4: Inert Salt Electrolyzer vs. Tap Water / Acid Electrolytes
- **PoC Limitation:** Tap water produces inconsistent currents; chloride salts produce toxic chlorine gas ($Cl_2$); acidic electrolytes attack pencil leads.
- **Full-Scale Upgrade:** Use $0.1\text{ M }\text{Na}_2\text{SO}_4$ neutral electrolyte. The sulfate ion ($\text{SO}_4^{2-}$) is thermodynamically non-reactive at standard water-splitting potentials, ensuring 100% selective evolution of pure oxygen ($\text{O}_2$) at the anode and pure hydrogen ($\text{H}_2$) at the cathode with zero hazardous gas emission.

### Improvement 5: Secondary Clear Acrylic Containment & Modular Probing
- **PoC Limitation:** Spillage of blue copper sulfate solution stains the viva bench; loose multimeter wires introduce high contact error.
- **Full-Scale Upgrade:** Laser-cut acrylic dual-pot containment isolates the porous kulhads while allowing full 360° visibility. Dedicated gold-plated test headers allow permanent multimeter connection alongside oscilloscope probes without disturbing electrodes.
