close all;clear;clc;

N = 29;
fc = 0.48;
Fs = 8919;
hc = fir1(N-1,fc,'high');%or high, depending on what we want

stem(hc);

freqz(hc,1,512);

NumFFT = 512;
Freqs = linspace(-pi,pi,NumFFT);


figure
plot(Freqs, abs(fftshift(fft(hc,NumFFT))));
title('Filter frequency response')
grid on

figure
plot(Freqs, 20*log10(abs(fftshift(fft(hc,NumFFT)))));
title('Filter frequency response [logaritmic fourier series] (dB)')
grid on

figure
plot(Freqs, angle(fft(hc,NumFFT)));
title('Filter frequency response [angle fourier series] (dB)')
grid on
sound (hc, Fs);
%%
h_low = firls(N-1,[0 .1 0.35 1] , [1 1 0 0]); %fir1...
h_high = firls(N-1,[0 .1  0.35 1] , [0 0 1 1]);

figure
plot(Freqs, 20*log(abs(fftshift(fft(h_low,NumFFT)))));
title('Filter frequency response low [do not care logarithmic](dB)')
grid on

figure
plot(Freqs, 20*log10(abs(fftshift(fft(h_high,NumFFT)))));
title('Filter frequency response high [do not care logarithmic] (dB)')
grid on
sound (h_low, Fs);
%%
s_low = firpm (N-1, [0 .1 0.35 1] , [1 1 0 0]);
s_high = firpm (N-1,[0 .1  0.35 1] , [0 0 1 1]);

figure
plot(Freqs, 20*log(abs(fftshift(fft(s_low,NumFFT)))));
title('Filter frequency response low [min max logarithmic](dB)')
grid on

figure
plot(Freqs, 20*log10(abs(fftshift(fft(s_high,NumFFT)))));
title('Filter frequency response high [min max logarithmic] (dB)')
grid on
sound (s_low, Fs);