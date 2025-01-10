% Generate a test signal
Fs = 1000; % Sampling frequency (Hz)
t = 0:1/Fs:1-1/Fs; % Time vector (seconds)
f1 = 10; % Frequency of signal 1 (Hz)
f2 = 100; % Frequency of signal 2 (Hz)
x = sin(2*pi*f1*t) + sin(2*pi*f2*t); % Signal with two frequencies

% Compute the FT of the signal
N = length(x); % Number of samples
X = fft(x); % Compute FFT
X_shifted = fftshift(X); % Shift zero frequency to center
f = Fs*(-N/2:N/2-1)/N; % Frequency vector (Hz)

% Plot the unshifted magnitude spectrum of the signal
figure;
plot(abs(X)/N);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Magnitude Spectrum of Test Signal (unshifted)');


% Plot the magnitude spectrum of the signal
figure;
plot(f, abs(X_shifted)/N);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Magnitude Spectrum of Test Signal (shifted)');

figure;
plot(f, angle(X));
xlabel('Frequency (Hz)');
ylabel('Phase');
title('Phase Spectrum of Test Signal');