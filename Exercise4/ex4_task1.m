clc, clear all, close all;

n = 1e4;
probGood = 0.6;

temp = rand(n, 1);
day = zeros(n, 1);
day(temp <= probGood) = 1; % 1 meaning good
day(temp > probGood) = 2; % 2 meaning bad

probDemand = [0.1 0.15 0.25 0.3 0.2;
              0.2 0.57 0.13 0.08 0.02];
for j = 1:(length(probDemand) - 1) % Convert into CDF
    probDemand(:, j + 1) = probDemand(:, j) + probDemand(:, j + 1);
end
demands = [80 100 120 140 160];

temp = rand(n, 1);
demand = zeros(n, 1);
for i = 1 : n
    goodOrBad = day(i);
    
    if temp(i) <= probDemand(goodOrBad, 1)
        demand(i) = demands(1);
    end
    for k = 2 : length(demands)
        if (temp(i) > probDemand(goodOrBad, k-1) && temp(i) <= probDemand(goodOrBad, k))
            demand(i) = demands(k);
        end    
    end
end

mean_sold = mean(demand);
figure; %Activate figure
histogram(demand, 'Normalization', 'probability');
title('Distribution of sales');
xlabel('Sales'); ylabel('Probability');
        
    