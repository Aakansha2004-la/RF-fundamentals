function signals = generateSignals(type, params)
    % SIGNAL GENERATOR - Create test signals for CCDF analysis
    
    switch lower(type)
        case 'ofdm'
            % Generate OFDM signal
            nfft = params.Nfft;
            nSymbols = params.Nsymbols;
            modOrder = params.ModOrder;
            
            data = randi([0 modOrder-1], nfft, nSymbols);
            modData = qammod(data, modOrder);
            ofdmSignal = ifft(modData, nfft);
            signals = ofdmSignal(:);
            
        case 'qpsk'
            % QPSK signal
            nSamples = params.NSamples;
            data = randi([0 3], nSamples, 1);
            signals = pskmod(data, 4);
            
        case 'noisy'
            % Noisy signal for testing
            nSamples = params.NSamples;
            snr = params.SNR;
            signals = awgn(complex(randn(nSamples,1), randn(nSamples,1)), snr);
    end
end