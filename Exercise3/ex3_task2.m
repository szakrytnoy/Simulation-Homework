clc, clear all, close all;

nsim = 1e3;		% number of simulations
nn = [100 1e3 1e4];  % sample sizes n

rmean = zeros(nsim, 3);
for k = 1:3
    for i = 1:nsim
        sample = rand(1, nn(k));
        sample_mean = mean(sample);
        rmean(i, k) = sample_mean;
    end
end
stds = std(rmean);

subplot(2, 2, 1);
histogram(rmean(:, 1), 'Normalization', 'Probability');
title('Case 1, 100 samples'); 
subplot(2, 2, 2);
histogram(rmean(:, 2), 'Normalization', 'Probability');
title('Case 2, 1000 samples'); 
subplot(2, 2, 3);
histogram(rmean(:, 3), 'Normalization', 'Probability');
title('Case 3, 10000 samples'); 
subplot(2, 2, 4);
plot([1:3], stds, 'k');
title('Standard deviations'); 