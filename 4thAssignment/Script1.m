clear;clc;close all
K = 10000;
n = [-50:250]';
A = randn(1,K);
x = A .* ((n > 0) - (n - 100 > 0));

Acor = x*x'/K;
Sd = 20*log10(fftshift(abs(fft2(Acor))));
%%
plot(n,mean(x,2))
figure; imagesc(n,n,Acor)
figure; imagesc(Sd)


