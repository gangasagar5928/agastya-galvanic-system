%% polarization_curve.m — Fit & plot polarization curve, extract R_int
%  Agastya Galvanic System · Phase 1 R_int characterization
clear; clc; close all;

% --- Load data (edit path / column names to match your CSV) ---
% Expected columns: I_mA, V_V  (swept current 0->50 mA)
polar = readtable('../data/polarization/curve_YYYY-MM-DD_HHMM.csv');

I = polar.I_mA; V = polar.V_V;

% --- Extract R_int from linear (ohmic) region: V = E - I*R_int ---
% Choose points in the middle of the curve (e.g. between 10% and 70% of max I)
sel = (I >= 0.1*max(I)) & (I <= 0.7*max(I));
p = polyfit(I(sel), V(sel), 1);       % V = p(1)*I + p(2)
R_int = -p(1) * 1000;                  % convert V/mA -> Ohm  (1 V per mA = 1000 Ohm)
E_intercept = p(2);                    % extrapolated E (V)

fprintf('R_int (ohmic region) = %.2f Ohm\n', R_int);
fprintf('Extrapolated E_cell   = %.3f V\n', E_intercept);

% --- Plot ---
figure('Color','w'); hold on;
plot(I, V, 'o-', 'LineWidth', 1.5);
plot(I(sel), polyval(p, I(sel)), 'r--', 'LineWidth', 1.5, ...
    'DisplayName', sprintf('Fit  R_{int}=%.1f \\Omega', R_int));
xline(0.02*1000,'k:','I_{sc}=20mA'); yline(2.1,'g:','V_{oc}=2.10V');
xlabel('Current (mA)'); ylabel('Stack voltage (V)'); grid on;
title('Polarization curve & R_{int} (2-cell stack)'); legend('Location','southwest');

% PRD check: at I = 20 mA, V should be >= ~2.1 - 0.02*R_int
V_at_20 = interp1(I, V, 20, 'linear', 'extrap');
fprintf('V at I=20 mA = %.2f V -> %s\n', V_at_20, ternary(V_at_20>=2.10,'OK','check'));