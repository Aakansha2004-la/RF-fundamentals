function bulge = earthBulgeCalculator(distance)
    % EARTH BULGE CALCULATOR
    % Calculate earth curvature effect for radio paths
    %
    % Input: distance - Path length (m)
    % Output: bulge - Earth bulge at midpoint (m)
    
    earth_radius = 6371000; % Mean Earth radius in meters
    bulge = distance^2 / (8 * earth_radius);
end