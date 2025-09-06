% FRESNEL ZONE ANALYSIS EXAMPLE
clear; clc; close all;

fprintf('=== Fresnel Zone Analysis ===\n\n');

% Example: 10km microwave link at 6GHz
distance = 10000; % meters
frequency = 6e9;  % Hz

% Calculate Fresnel zone
[radius, clearance] = fresnelZoneCalculator(distance, frequency);
bulge = earthBulgeCalculator(distance);

fprintf('10km link at 6GHz:\n');
fprintf('1st Fresnel zone radius: %.2f meters\n', radius);
fprintf('Earth bulge at midpoint: %.2f meters\n', bulge);
fprintf('Required clearance: %.2f meters\n', clearance);
fprintf('Tower height needed: >%.2f meters\n', clearance + 15); % +15m for obstacles

% Visualize different frequencies
frequencies = [900e6, 2.4e9, 6e9, 28e9];
distances = 1000:1000:20000;

figure;
for i = 1:length(frequencies)
    radii = arrayfun(@(d) fresnelZoneCalculator(d, frequencies(i)), distances);
    plot(distances/1000, radii, 'LineWidth', 2, 'DisplayName', sprintf('%d GHz', frequencies(i)/1e9));
    hold on;
end

xlabel('Distance (km)');
ylabel('1st Fresnel Zone Radius (m)');
title('Fresnel Zone Radius vs Distance');
legend('show');
grid on;