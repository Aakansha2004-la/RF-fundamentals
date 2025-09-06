function [radius, clearance] = fresnelZoneCalculator(distance, frequency, zone_number)
    
    % Inputs:
    %   distance - Total path distance (m)
    %   frequency - Frequency (Hz)
    %   zone_number - Which Fresnel zone (default: 1)
    %
    % Outputs:
    %   radius - Fresnel zone radius at midpoint (m)
    %   clearance - Required clearance including earth bulge (m)

    if nargin < 3
        zone_number = 1; % First Fresnel zone by default
    end
    
    c = 3e8; 
    lambda = c / frequency;
    
    % Fresnel zone radius formula
    radius = sqrt(zone_number * lambda * distance / 4);
    
    % Calculate earth bulge for clearance
    earth_radius = 6371000; % Earth radius in meters
    bulge = distance^2 / (8 * earth_radius);
    
    % Required clearance (60% rule + earth bulge)
    clearance = 0.6 * radius + bulge;
end