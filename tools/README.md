# tools/ — Analysis Scripts

MATLAB scripts (R2016b+, no toolboxes required) for Phases 1–3 verification.

| Script | Phase | Purpose |
|---|---|---|
| `plot_vt.m` | 1/4 | Discharge V(t) curves; checks 15 mA / 4 h / ≥ 1.5 V gate |
| `polarization_curve.m` | 1 | Fits polarization curve, extracts **R_int** from ohmic slope |
| `efficiency_sweep.m` | 2 | Efficiency map η(Vin, Iload); checks **η ≥ 82 %** at 15 mA |
| `gas_collection.m` | 3 | H₂ volume vs Faraday prediction; computes **Faradaic efficiency** |

## Data Expectations

Each script reads a CSV from `../data/<stage>/` following the `TEMPLATE.csv` schemas
in that folder. **Edit the hardcoded filenames** in each script to match your real
log (the `YYYY-MM-DD_HHMM` placeholders are intentional).

> MATLAB convenience wrapper `ternary(cond,a,b)` used above is a tiny local helper
> (define it or inline `if/else` if not present). Example:
> ```matlab
> function out = ternary(c,a,b), if c, out=a; else, out=b; end, end
> ```

## Python alternative (optional)

The same math ports directly to NumPy/matplotlib if MATLAB is unavailable
(≈20 lines per script). Ask in the project log if a `.py` variant is wanted.