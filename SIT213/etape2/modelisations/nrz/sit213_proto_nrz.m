nSamplesPerBit = 30; % number of samples per bit 
numericSignalLength = 2; % length of the numerical signal 

amplMin = -1; % min ampl of the NRZ signal 
amplMax = 1.2; % max ampl of the NRZ signal 

numericalSignal = floor(mod((randn(1,numericSignalLength)), 2)); % Generate a random numerical signal

NRZSignal = nrz(numericalSignal, nSamplesPerBit, numericSignalLength, amplMin, amplMax);

plot(NRZSignal)


