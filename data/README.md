# data/ — Measurement Logs

This directory stores **raw experimental data** for the Agastya Galvanic System.
Every measurement referenced in `ROADMAP.md`, `PRD.md` and the wiki traces to a
timestamped file here.

## Structure

```
data/
├── voc_isc_logs/       Voc & Isc measurements (Phase 1)
│   └── TEMPLATE.csv    ← copy & rename per session: voc_isc_YYYY-MM-DD_HHMM.csv
├── discharge/          4 h @ 15 mA V(t) logs (Phase 1/4)
│   └── TEMPLATE.csv    ← discharge_YYYY-MM-DD_HHMM.csv
├── efficiency/         η vs (Vin, Iload) (Phase 2)
│   └── TEMPLATE.csv    ← efficiency_YYYY-MM-DD_HHMM.csv
└── electrolyzer/       H₂ gas logs (Phase 3)
    └── TEMPLATE.csv    ← h2_YYYY-MM-DD_HHMM.csv
```

## Logging Conventions

- **Filename:** `<metric>_YYYY-MM-DD_HHMM.csv` (24 h time, 15 min pads).
- **Header row:** comma-separated, first column always `timestamp_s`.
- **Units:** seconds, volts (V), milliamps (mA), millilitres (mL), degrees C (°C).
- **Noise floor:** report to the DMM resolution actually used (e.g. 0.001 V at 4½ digits).
- **Conditions column:** ambient temp + RH recorded on the log's first line (as a comment `# temp=25.2 RH=55`).

## Empty-State Notice

No measurements exist yet — this directory ships with templates only.
First real log expected: Phase 1 Voc/Isc (target Week 1, Sept 2026).