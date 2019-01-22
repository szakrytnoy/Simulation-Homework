clc, clear all, close all;

x0 = -1; sigma = 2; %sigma = 2 <-- sigma^2 = 4

n = 100; nbins = 10;
rai = x0 + sigma .* randn(n, 1);

figure; hold on; %The plotting
histogram(rai, nbins, 'Normalization', 'pdf');
xrange = linspace(x0 - 3*sigma, x0 + 3*sigma, 1000);
plot(xrange, normpdf(xrange, x0, sigma), 'b', 'LineWidth', 2);
legend('Simulated distribution', 'Theoretical PDF');

%Repeat the same steps for n = 10000
n = 10000; nbins = 20;
raii = x0 + sigma .* randn(n, 1);

figure; hold on; %The plotting
histogram(raii, nbins, 'Normalization', 'pdf');
xrange = linspace(x0 - 3*sigma, x0 + 3*sigma, 1000);
plot(xrange, normpdf(xrange, x0, sigma), 'b', 'LineWidth', 2);
legend('Simulated distribution', 'Theoretical PDF');

%Estimate value a
alpha = 0.05;
lowerLimit = quantile(raii, alpha/2);
upperLimit = quantile(raii, 1 - alpha/2);
a = mean([abs(x0 - upperLimit), abs(x0 - lowerLimit)]);
asigma = a / sigma;

%asigma is quite close to 1.96. The way it is supposed to be :)