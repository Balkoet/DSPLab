clear
close all
clc

n=0:1000;
phi = rand(1)*2*pi;
s = sin(0.25*n+phi);

w = randn(1,length(n));
v = filter(1,[1,-0.6],w); 
x = s + w;

%find the autocorrelation
v1 = v(1:end-4);
v2 = v(2:end-3);
v3 = v(3:end-2);
v4= v(4:end-1);
v5 = v(5:end);

V = [v5;v4;v3;v2;v1];
Rvv = V*V'/length(v1);

%find the crosscorrelation
rwv = zeros(5,1);
rwv(1) = sum(v(5:end) .* w(5:end));
rwv(2) = sum(v(4:end-1) .* w(5:end));
rwv(3) = sum(v(3:end-2) .* w(5:end));
rwv(4) = sum(v(2:end-3) .* w(5:end));
rwv(5) = sum(v(1:end-4) .* w(5:end));

% Normalize rsx
rwv = rwv / (length(v) - 1);

% Wiener filter coefficients
hW = Rvv\rwv;
% hW = [    ]

%apply to colored noise to make it white again 
w_hat = filter(hW,1,v);

w_norm = norm(w-w_hat); %to minimize

x_hat = x-w_hat;

subplot(131);plot(s);title('original');
subplot(132);plot(x);title('Noisy');
subplot(133);plot(x_hat);title('Filtered');

disp('w norm');
disp(w_norm);
disp('rms');
rms = mean((s - x_hat)).^2;

disp(rms);