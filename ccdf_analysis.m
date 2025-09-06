% CCDF ANALYSIS EXAMPLE
clear; clc; close all;

fprintf('=== CCDF Analysis for Wireless Systems ===\n\n');

% Generate test signals
ofdmParams.Nfft = 64;
ofdmParams.Nsymbols = 100;
ofdmParams.ModOrder = 16;
ofdmSignal = generateSignals('ofdm', ofdmParams);

qpskParams.NSamples = 6400;
qpskSignal = generateSignals('qpsk', qpskParams);

% Calculate PAPR
papr_ofdm = paprCalculator(ofdmSignal);
papr_qpsk = paprCalculator(qpskSignal);

fprintf('PAPR Results:\n');
fprintf('OFDM Signal: %.2f dB\n', papr_ofdm);
fprintf('QPSK Signal: %.2f dB\n', papr_qpsk);

% Calculate CCDF
[ccdf_x_ofdm, ccdf_y_ofdm] = ccdfAnalyzer(ofdmSignal);
[ccdf_x_qpsk, ccdf_y_qpsk] = ccdfAnalyzer(qpskSignal);

% Plot results
figure('Position', [100, 100, 800, 600]);
semilogy(ccdf_x_ofdm, ccdf_y_ofdm, 'b-', 'LineWidth', 2);
hold on;
semilogy(ccdf_x_qpsk, ccdf_y_qpsk, 'r--', 'LineWidth', 2);
grid on;
xlabel('Power Level (dB above average)');
ylabel('Probability (P > X)');
title('CCDF Comparison: OFDM vs QPSK');
legend('OFDM (16QAM, 64 subcarriers)', 'QPSK');
set(gca, 'FontSize', 12);
xlim([0 15]);
ylim([1e-4 1]);

% Mark PAPR points
hold on;
plot(papr_ofdm, 1e-2, 'bo', 'MarkerSize', 8, 'MarkerFaceColor', 'b');
plot(papr_qpsk, 1e-2, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');