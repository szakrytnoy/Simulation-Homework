clc, clear all, close all;
nr = 10000; %number of samples
cdf = @(x) x.^2; %CDF from PDF (analytically)

x = [0 : 0.02 : 1];
cdf_i = cdf(x);

r = invcdf(x, cdf_i, nr, 1)'; %Generate sample

figure; hold on; %The plotting
histogram(r, 'Normalization', 'pdf');
plot(x, 2*x, 'b', 'LineWidth', 2);
legend('Simulated distribution', 'Theoretical PDF', 'location', 'northwest');