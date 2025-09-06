function [papr, papr_db] = paprCalculator(signal)
    % PAPR CALCULATOR - Peak-to-Average Power Ratio
    %
    % PAPR = Peak Power / Average Power
    % Important for OFDM, 5G, WiFi systems
    
    power_signal = abs(signal).^2;
    peak_power = max(power_signal);
    avg_power = mean(power_signal);
    
    papr = peak_power / avg_power;
    papr_db = 10*log10(papr);
end