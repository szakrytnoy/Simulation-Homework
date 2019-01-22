clc, clear all, close all;
n = 1e4;

mu = [0 0];
b1 = [2 2];	% first semi-axis
b2 = [1 3];	% second semi-axis

sample = mu + randn(n, 2) * [b1; b2];
corr_sample = corrcoef(sample(:, 1), sample(:, 2));
corr_sample = corr_sample(1, 2);

figure;
plot(sample(:, 1), sample(:, 2), '.');
title('Generated sample');
xlabel('x'); ylabel('y');