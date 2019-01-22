clc, clear all, close all;
n = 1e4; %Number of simulations
numdays = 90;

prob_good = 0.2;
prob_fair = 0.3;
prob_bad = 0.5;
pdf = [prob_good, prob_fair, prob_bad];
cdf = cumsum(pdf);

total_demand = zeros(n, 1);
for i = 1:n
    
    for d = 1:numdays
        temp = rand;
        if temp <= cdf(1)
            mu = 168; sigma = sqrt(1296);
        elseif temp <= cdf(2)
            mu = 66; sigma = sqrt(892);
        elseif temp <= cdf(3)
            mu = 34; sigma = sqrt(46);
        end

        demand = max(0, mu+sigma*randn);
        total_demand(i) = total_demand(i) + demand;
    end
end

average_total_demand = mean(total_demand);

figure;
histogram(total_demand, 'Normalization', 'Probability');
title('Total demand');
xlabel('Demand'); ylabel('Prob');

PI_l = quantile(total_demand, 0.025);
PI_u = quantile(total_demand, 0.975);