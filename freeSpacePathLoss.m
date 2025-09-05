function loss_dB = freeSpacePathLoss(distance, frequency)
    % FREE SPACE PATH LOSS CALCULATION
    % Calculate free space path loss in dB
    %
    % Inputs:
    %   distance  - Distance in meters (scalar, vector, or matrix)
    %   frequency - Frequency in Hz (scalar, vector, or matrix)
    %
    % Output:
    %   loss_dB   - Path loss in dB
    %
    % Formula: FSPL(dB) = 20*log10(d) + 20*log10(f) + 20*log10(4*pi/c)
    % where c = 3e8 m/s (speed of light)

    % Constants
    c = 3e8; % Speed of light in m/s
    
    % Input validation
    if nargin ~= 2
        error('Function requires exactly two inputs: distance and frequency');
    end
    
    if ~isnumeric(distance) || ~isnumeric(frequency)
        error('Both inputs must be numeric');
    end
    
    if any(distance <= 0) || any(frequency <= 0)
        error('Distance and frequency must be positive values');
    end
    
    % Calculate path loss using direct formula
    loss_dB = 20*log10(distance) + 20*log10(frequency) + 20*log10(4*pi/c);
end