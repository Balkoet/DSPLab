% Initialize vectors to store execution times
execution_time_DFT = zeros(10, 2); % For DFT, two cases: signal length 2^x and 2^x - 1
execution_time_FFT = zeros(10, 2); % For FFT, two cases: signal length 2^x and 2^x - 1

% Loop through different sequence lengths
for x = 6:15
    N = 2^x;
    N_minus_one = 2^x - 1;
    
    % Perform experiment for signal of length 2^x
    for repetition = 1:10000
        % Generate random test signal for both lengths
        x_signal = rand(N, 1);
        x_signal_minus_one = rand(N_minus_one, 1);
        
        % Compute DFT and measure execution time for signal length 2^x
        tic;
        X_DFT = fft(x_signal);
        execution_time_DFT(x-5, 1) = execution_time_DFT(x-5, 1) + toc;
        
        % Compute FFT and measure execution time for signal length 2^x
        tic;
        X_FFT = fft(x_signal);
        execution_time_FFT(x-5, 1) = execution_time_FFT(x-5, 1) + toc;
        
        % Compute DFT and measure execution time for signal length 2^x - 1
        tic;
        X_DFT_minus_one = fft(x_signal_minus_one);
        execution_time_DFT(x-5, 2) = execution_time_DFT(x-5, 2) + toc;
        
        % Compute FFT and measure execution time for signal length 2^x - 1
        tic;
        X_FFT_minus_one = fft(x_signal_minus_one);
        execution_time_FFT(x-5, 2) = execution_time_FFT(x-5, 2) + toc;
    end
    
    % Normalize execution time by number of repetitions
    execution_time_DFT(x-5, :) = execution_time_DFT(x-5, :) / 10000;
    execution_time_FFT(x-5, :) = execution_time_FFT(x-5, :) / 10000;
end

% Plot the results
figure;
x_values = 2.^(6:15);
plot(x_values, execution_time_DFT(:, 1), 'b-o', 'LineWidth', 2);
hold on;
plot(x_values, execution_time_FFT(:, 1), 'r-o', 'LineWidth', 2);
plot(x_values, execution_time_DFT(:, 2), 'b--o', 'LineWidth', 2);
plot(x_values, execution_time_FFT(:, 2), 'r--o', 'LineWidth', 2);
xlabel('Sequence Length (N)');
ylabel('Execution Time (s)');
title('Computational Cost of DFT and FFT');
legend('DFT (2^x)', 'FFT (2^x)', 'DFT (2^x - 1)', 'FFT (2^x - 1)');
grid on;
