%% plot_vt.m — Plot V(t) discharge curves from data/discharge/*.csv
%  Agastya Galvanic System · Phase 1/4 verification
%  Usage: run in MATLAB (R2016b+), CSV in data/discharge/
clear; clc; close all;

D = dir('../data/discharge/discharge_*.csv');
if isempty(D)
    warning('No discharge logs found. Copy TEMPLATE.csv and fill with real data.');
    return;
end

figure('Name','Discharge V(t)','Color','w');
hold on;
for k = 1:numel(D)
    T = readtable(fullfile(D(k).folder, D(k).name));
    plot(T.timestamp_s/3600, T.stack_v_V, 'o-', 'DisplayName', strrep(D(k).name,'_','\_'));
end
yline(1.5, 'r--', 'Fail gate: 1.5 V');
xlabel('Time (h)'); ylabel('Stack voltage (V)');
title('Discharge: 15 mA constant-current load / 4 h criterion');
legend('Location','northeast'); grid on; ylim([1.0 3.0]);

% Report PRD verdict
T = readtable(fullfile(D(1).folder, D(1).name));
ok = min(T.stack_v_V) >= 1.5;
fprintf('Min stack V over run = %.3f V -> %s\n', min(T.stack_v_V), ...
    ternary(ok, 'PASS (>=1.5 V)', 'FAIL'));