clc, clear all, close all;

n = 1e5; %Number of simulations
k = 5; %How many sigmas 
mu = 0;
sigmaX = 3; sigmaY = 2;

x = -k*sigmaX + 2*k*sigmaX .* rand(n, 1);
y = -k*sigmaY + 2*k*sigmaY .* rand(n, 1);

accept = exp(-1/2 * (x.^2./sigmaX^2 + y.^2./sigmaY^2));
sample = [];
for i = 1:n
    temp = rand;
    if rand <= accept(i)
        sample = [sample; [x(i) y(i)]];
    end
end

figure;
plot(sample(:, 1), sample(:, 2), 'k.');
title('Generated sample');

frac_sample = length(sample)/n;
        