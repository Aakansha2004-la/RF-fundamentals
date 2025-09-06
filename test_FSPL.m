function [ccdf_x, ccdf_y] = ccdfAnalyzer(signal, varargin)
    % CCDF ANALYZER - Calculate Complementary Cumulative Distribution Function
    %
    % Inputs:
    %   signal - Input signal (voltage, power, or amplitude
    %
    % Outputs:
    %   ccdf_x - Threshold values (dB)
    %   ccdf_y - Probability that signal exceeds threshold
    %
    % Example:
    %   [x, y] = ccdfAnalyzer(ofdm_signal);
    %   semilogy(x, y); grid on;

    p = inputParser;
    addParameter(p, 'Units', 'dB', @ischar);
    addParameter(p, 'Normalize', true, @islogical);
    parse(p, varargin{:});
    
    % Convert to power if needed
    if isreal(signal)
        power_signal = abs(signal).^2;
    else
        power_signal = abs(signal).^2;
    end
    
    % Normalize to peak power
    if p.Results.Normalize
        power_signal = power_signal / max(power_signal);
    end
    
    % Convert to dB
    power_dB = 10*log10(power_signal);
    
    % Calculate CCDF
    [f, x] = ecdf(power_dB);
    ccdf_x = x;
    ccdf_y = 1 - f;
    
    % Remove duplicates and sort
    [ccdf_x, idx] = unique(ccdf_x);
    ccdf_y = ccdf_y(idx);
end