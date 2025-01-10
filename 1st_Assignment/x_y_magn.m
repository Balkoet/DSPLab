% Generate a test signal
Fs = 1000; % Sampling frequency (Hz)
t = 0:1/Fs:1-1/Fs; % Time vector (seconds)
f1 = 10; % Frequency of signal 1 (Hz)
f2 = 100; % Frequency of signal 2 (Hz)
x = sin(2*pi*f1*t) + sin(2*pi*f2*t); % Signal with two frequencies

% Generate another test signal
y = 0.5*sin(2*pi*200*t); % Another test signal

% Compute the FFT of the signals
X = fft(x); % Compute FFT of signal x
Y = fft(y); % Compute FFT of signal y

% Shift the FFTs
X_shifted = fftshift(X); % Shift zero frequency to center for signal x
Y_shifted = fftshift(Y); % Shift zero frequency to center for signal y

% Frequency vector
N = length(x); % Number of samples
f = Fs*(-N/2:N/2-1)/N; % Frequency vector (Hz)

% Plot the magnitude spectrum of signal x
figure;
plot(f, abs(X_shifted)/N);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Magnitude Spectrum of Signal x (shifted)');

% Plot the magnitude spectrum of signal y
figure;
plot(f, abs(Y_shifted)/N);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Magnitude Spectrum of Signal y (shifted)');
