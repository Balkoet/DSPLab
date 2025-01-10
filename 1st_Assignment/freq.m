% Define the system coefficients
b = [1/2, 1, -1/2];
a = 1;

% Calculate the frequency response using freqz
[Hz, w] = freqz(b, a, 'whole');

% Plot the magnitude response
figure;
subplot(2, 1, 1);
plot(w, abs(Hz));
xlabel('Frequency (\omega)');
ylabel('|H(e^{j\omega})|');
title('Magnitude Response');

% Plot the phase response
subplot(2, 1, 2);
plot(w, angle(Hz));
xlabel('Frequency (\omega)');
ylabel('Phase (radians)');
title('Phase Response');