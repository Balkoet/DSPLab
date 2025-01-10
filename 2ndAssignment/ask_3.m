load Noisy.mat;
Fs = 44100;
y=yw;
NumFFT = 4096;
F = linspace(-Fs/2,Fs/2,NumFFT);
ywo = filter(Hd, yw);
noise = yw - ywo;
figure
plot(yw(1:250))
title('Signal with noise')
figure
plot(ywo(1:250))
title('Filtered Signal')
grid on
figure;
plot(F, abs(fftshift(fft(yw,NumFFT))))
title('Fourier Transformation absolute noisy')
grid on;
figure;
plot(F, abs(fftshift(fft(ywo,NumFFT))))
title('Fourier Transformation absolute ')
grid on;
sound(ywo, Fs)
figure;
plot(noise)
title('Noise Signal')
xlabel('Time (samples)')
ylabel('Amplitude')
grid on;