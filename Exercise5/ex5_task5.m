clc, clear all, close all;
n = 1e4; %Number of simulations
numdays = 90;
wage = 60; %Daily pay to the seller
mex py.cpp -IC:/Python36/include C:/Work/Anaconda/libs/python36.lib

prob_good = 0.2;
prob_fair = 0.3;
prob_bad = 0.5;
pdf = [prob_good, prob_fair, prob_bad];
cdf = cumsum(pdf);

[profit_a, PI_la, PI_ua] = simulate_icecream(n, numdays, cdf, wage, 'a');
[profit_b, PI_lb, PI_ub] = simulate_icecream(n, numdays, cdf, wage, 'b');
[profit_c, PI_lc, PI_uc] = simulate_icecream(n, numdays, cdf, wage, 'c');

case_id = 2; %Due to maximal mean value of profit

function [total_profit, PI_l, PI_u] = simulate_icecream(n, numdays, cdf, wage, mode)
total_profit = zeros(n, 1);
for i = 1:n
    
    for d = 1:numdays
        temp = rand;
        if temp <= cdf(1)
            mu = 168; sigma = sqrt(1296);
    
        elseif temp <= cdf(2)
            mu = 66; sigma = sqrt(892);
            if mode == 'c'
                continue %Go to next iteration
            end
                
        elseif temp <= cdf(3)
            mu = 34; sigma = sqrt(46);
            if mode ~= 'a'
                continue
            end
        end
                
        demand = max(0, mu+sigma*randn); %Generate demand
        
        profit = demand - wage; %Pay the wage
        total_profit(i) = total_profit(i) + profit; %Accumulate profit
    end
end

figure;
histogram(total_profit, 'Normalization', 'Probability');
title('Total demand');
xlabel('Demand'); ylabel('Prob');

PI_l = quantile(total_profit, 0.025);
PI_u = quantile(total_profit, 0.975);
end