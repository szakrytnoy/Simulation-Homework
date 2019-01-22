clc, clear all, close all;

%Case a
a = 0; b = 1;

n = 10; nbins = 5; %Number of samples, number of bins in a hist
rai = a + (b - a).*rand(n, 1); %Generate samples
figure; hold on; %Activate figure
histogram(rai, nbins, 'Normalization', 'probability');
%Draw a red line; Probability of each bin = 1/nbins
plot(linspace(a, b, nbins), ones(nbins, 1)./nbins, 'r');

n = 1000; nbins = 10;
raii = a + (b - a).*rand(n, 1);
figure; hold on;
histogram(raii, nbins, 'Normalization', 'probability');
plot(linspace(a, b, nbins), ones(nbins, 1)./nbins, 'r');

%Case b
a = -5; b = 10;

n = 10; nbins = 5;
rbi = a + (b - a).*rand(n, 1);
figure; hold on;
histogram(rbi, nbins, 'Normalization', 'probability');
plot(linspace(a, b, nbins), ones(nbins, 1)./nbins, 'r');

n = 1000; nbins = 10;
rbii = a + (b - a).*rand(n, 1);
figure; hold on;
histogram(rbii, nbins, 'Normalization', 'probability');
plot(linspace(a, b, nbins), ones(nbins, 1)./nbins, 'r');
