%% efficiency_sweep.m — Contour/heatmap of eta vs (Vin, Iload)
%  Agastya Galvanic System · Phase 2 PRD FR-4 (eta >= 82 %)
clear; clc; close all;

% --- Load data ---
eff = readtable('../data/efficiency/efficiency_YYYY-MM-DD_HHMM.csv');
vin  = eff.vin_V; iload = eff.iload_mA; eta = eff.eta_pct;

% --- Scatter plot: eta vs load, coloured by Vin ---
figure('Name','Efficiency','Color','w'); hold on;
scatter(iload, eta, 120, vin, 'filled');
xline(15,'k:', 'PRD load 15 mA'); yline(82,'r--','PRD eta 82 %');
cb = colorbar; cb.Label.String = 'V_{in} (V)';
xlabel('Load current (mA)'); ylabel('End-to-end efficiency (%)');
title('Boost efficiency map'); grid on; colormap(parula);

% --- PRD verdict at the operating point ---
row = eff(eff.iload_mA==15, :);
if ~isempty(row)
    [eta_op, idx] = max(row.eta_pct);
    fprintf('Max eta at 15 mA = %.1f %% (at Vin=%.2f V) -> %s\n', ...
        eta_op, row.vin_V(idx), ternary(eta_op>=82,'PASS','FAIL'));
else
    fprintf('No 15 mA row logged yet.\n');
end