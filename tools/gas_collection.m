%% gas_collection.m — H2 volume vs Faraday prediction + Faradaic efficiency
%  Agastya Galvanic System · Phase 3 electrolyzer verification
clear; clc; close all;

F = 96485;            % C/mol
Vm = 22400;           % mL/mol at STP
n  = 2;               % electrons per H2 molecule

% --- Load data ---
g = readtable('../data/electrolyzer/h2_YYYY-MM-DD_HHMM.csv');
t_min = g.time_min; I_mA = g.current_mA;
V_meas = g.h2_collected_mL;         % observed
V_theo = (I_mA/1000 .* t_min*60)/(n*F) * Vm;   % Faraday prediction

% --- Plot ---
figure('Name','H2 collection','Color','w'); hold on;
plot(t_min, V_meas, 'o-', 'LineWidth', 1.5, 'DisplayName', 'Measured H_2');
plot(t_min, V_theo, '--', 'LineWidth', 1.5, 'DisplayName', 'Faraday prediction');
xlabel('Time (min)'); ylabel('H_2 gas (mL)'); grid on; legend('Location','northwest');
title('Micro-electrolyzer gas collection @ 15 mA');

% --- Faradaic efficiency over the run ---
eta_F = V_meas ./ V_theo * 100;
fprintf('Faradaic efficiency (mean): %.1f %% -> %s\n', mean(eta_F), ...
    ternary(mean(eta_F)>=70,'PASS (>=70 %)','CHECK'));
fprintf('First visible bubble at t = %.0f s  (PRD: <=10 s)\n', g.first_bubble_s(1));