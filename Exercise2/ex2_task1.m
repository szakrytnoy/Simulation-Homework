clc, clear all, close all;

na = 100;
nb = 1e4;

%Convert pdf to cdf
pdf = [0.2 0.32 0.28 0.12 0.08]; cdf = pdf;
for i = 2:length(cdf)
    cdf(i) = cdf(i) + cdf(i - 1);
end

%Case a
temp = rand(1, na); %Temporary array (numeric)
ra(temp <= cdf(1)) = 1;
for i = 2:length(cdf)
    ra(temp > cdf(i-1) & temp <= cdf(i)) = i;
end

figure; hold on; %Initialize visualization
histogram(ra, 'Normalization', 'Probability');
plot([1:length(pdf)], pdf, 'r.', 'MarkerSize', 10)
legend('Test', 'Expected', 'Location', 'northeast');
title('Case A, 100 samples');

%Case b
temp = rand(1, nb); %Temporary array (numeric)
rb(temp <= cdf(1)) = 1;
for i = 2:length(cdf)
    rb(temp > cdf(i-1) & temp <= cdf(i)) = i;
end

figure; hold on; %Initialize visualization
histogram(rb, 'Normalization', 'Probability');
plot([1:length(pdf)], pdf, 'r.', 'MarkerSize', 10)
legend('Test', 'Expected', 'Location', 'northeast');
title('Case B, 10000 samples');