% Define the input signal x[n]
n = 0:100;
x = cos(pi*n/4) - sin(pi*n/2) + (-1/2).^n;

% Define the system's impulse response
% For example, let's define a moving average filter of length 10
b = [1/2, 1, -1/2]; % impulse response

% Apply the filter using the filter function
y_filter = filter(b, 1, x);

% Apply the filter using the conv function
y_conv = conv(x, b, 'same');

% Plot the input and output signals using filter function
subplot(2,2,1);
plot(n, x);
title('Input Signal x[n] (Filter)');
xlabel('n');
ylabel('Amplitude');

subplot(2,2,2);
plot(n, y_filter);
title('Output Signal y[n] (Filter)');
xlabel('n');
ylabel('Amplitude');

% Plot the input and output signals using conv function
subplot(2,2,3);
plot(n, x);
title('Input Signal x[n] (Conv)');
xlabel('n');
ylabel('Amplitude');

subplot(2,2,4);
plot(n, y_conv);
title('Output Signal y[n] (Conv)');
xlabel('n');
ylabel('Amplitude');
