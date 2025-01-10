load chirp
y0=y;
noise =0.5*randn(size(y));
Fs = 8919;

yw = y0 + noise;

figure
subplot(131);
%plot(y0(1:100))
plot(y0(end-99:end))
subplot(132);
%plot(yw(1:100))
plot(yw(end-99:end))

NumFFT = 4096;
F = linspace(-Fs/2,Fs/2,NumFFT);


b = fir1(34,0.48,'high',chebwin(35,30));
c = firls(34, [0 0.48 0.5 1] , [0 0 1 1]);
d = firpm(34, [0 0.48 0.5 1] , [0 0 1 1]);
yf = filtfilt(b,1,yw);

subplot(133);
%plot(yf(1:100))
plot(yf(end-99:end))

%freqz(d,1,512);


figure
subplot(131);
plot(F, abs(fftshift(fft(y0,NumFFT))))
subplot(132);
plot(F, abs(fftshift(fft(yw,NumFFT))))
subplot(133);
plot(F, abs(fftshift(fft(yf,NumFFT))))


mse_b = mean((y0 - filtfilt(b, 1, yw)).^2);  % MSE for filter b
mse_c = mean((y0 - filtfilt(c, 1, yw)).^2);  % MSE for filter c
mse_d = mean((y0 - filtfilt(d, 1, yw)).^2);  % MSE for filter d

disp(['MSE for filter b: ', num2str(mse_b)]);
disp(['MSE for filter c: ', num2str(mse_c)]);
disp(['MSE for filter d: ', num2str(mse_d)]);

%sound(y, Fs)
%sound(yw, Fs)
%sound(yf, Fs)
