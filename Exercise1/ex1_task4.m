clc, clear all, close all;

n = 1e6; % use this as the sample size
% given parameters
V = 1200; % m/s
g = 10;

%Define an anonymous function
fire = @(V, alpha, g) V^2 * sind(2*alpha) / g;

%Case a
mu = 35; sigma = 0.2;
alpha = mu + sigma .* randn(n, 1); %Generate n test alphas
L_a = fire(V, alpha, g);

figure; nbins = 50; hold on; %Initialize visualization
histogram(L_a, nbins, 'Normalization', 'Probability');
plot([fire(V, mu, g), fire(V, mu, g)], [0, 0.09], 'r');
legend('Test distribution', 'Expected');
title('Case a: mu = 35, sigma = 0.2');

%Case b
mu = 45; sigma = 0.9;
alpha = mu + sigma .* randn(n, 1); %Generate n test alphas
L_b = fire(V, alpha, g);

figure; nbins = 50; hold on; %Initialize visualization
histogram(L_b, nbins, 'Normalization', 'Probability');
plot([fire(V, mu, g), fire(V, mu, g)], [0, 0.6], 'r');
legend('Test distribution', 'Expected');
title('Case b: mu = 45, sigma = 0.9');

%Case c
mu = 55; sigma = 0.7;
alpha = mu + sigma .* randn(n, 1); %Generate n test alphas
L_c = fire(V, alpha, g);

figure; nbins = 50; hold on; %Initialize visualization
histogram(L_c, nbins, 'Normalization', 'Probability');
plot([fire(V, mu, g), fire(V, mu, g)], [0, 0.08], 'r');
legend('Test distribution', 'Expected');
title('Case c: mu = 55, sigma = 0.7');

fprintf('The distance is proportional to sin(2*alpha).\nIn cases a and c, deviation of alpha to greater or lesser values produce variation of distance to both sides (lesser and greater than the mean)\nIn case b, sin(2*alpha) = 1, and deviations of alpha to both sides produce the same-direction variation of distance (less than the mean)');