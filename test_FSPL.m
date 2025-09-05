
clear all

% Test 1: Simple case
result1 = freeSpacePathLoss(1000, 2.4e9);
fprintf('1km at 2.4GHz: %.2f dB\n', result1);

% Test 2: Check if function handles arrays
result2 = freeSpacePathLoss([100, 200, 300], 2.4e9);
fprintf('Multiple distances: %s dB\n', mat2str(result2, 2));

% Test 3: Check with different frequencies
result3 = freeSpacePathLoss(500, [900e6, 2.4e9, 5.8e9]);
fprintf('Multiple frequencies: %s dB\n', mat2str(result3, 2));

% Test 4: Verify with theoretical value
% FSPL(dB) = 32.44 + 20log10(d_km) + 20log10(f_MHz)
theoretical = 32.44 + 20*log10(1) + 20*log10(2400); % 1km, 2400MHz
calculated = freeSpacePathLoss(1000, 2.4e9);
fprintf('Theoretical: %.2f dB, Calculated: %.2f dB\n', theoretical, calculated);