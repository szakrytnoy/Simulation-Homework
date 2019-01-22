clc, clear all, close all;

n = 1e4;
probGood = 0.6;
probDemand = [0.1 0.15 0.25 0.3 0.2;
              0.2 0.57 0.13 0.08 0.02];
demands = [80 100 120 140 160];

cost = 0.4;
price = 1;
refund = 0.06;

profit_mean_a = []; % For mean profits
profit_mean_b = [];
for storage = 80:160
    demand = simulate_demand(n, probGood, probDemand, demands);
    
    sold = zeros(n, 1);
    sold = min(demand, storage); % Sell either demand volumes or the whole storage
    recycle = max(storage - sold, 0); % Recycle the rest if positive
    
    profit_a = zeros(n, 1);
    profit_a = - storage*cost + sold*price + recycle*refund;
    profit_mean_a = [profit_mean_a, mean(profit_a)];

    profit_b = zeros(n, 1);
    profit_b = - storage*cost + sold*price + recycle*refund - max(demand - storage, 0)*price;
    profit_mean_b = [profit_mean_b, mean(profit_b)];
end

[max_profit_mean_a, opt_M_a] = max(profit_mean_a);
[max_profit_mean_b, opt_M_b] = max(profit_mean_b);
sample = 80:160;
opt_M_a = sample(opt_M_a);
opt_M_b = sample(opt_M_b);

figure; hold on;
plot(80:160, profit_mean_a, 'r');
plot(80:160, profit_mean_b, 'b');
plot(opt_M_a, max_profit_mean_a, 'r.', 'MarkerSize', 20);
plot(opt_M_b, max_profit_mean_b, 'b.', 'MarkerSize', 20);
xlabel('Storage size'); ylabel('Mean profit');
legend('No penalty', 'Penalty for unrealized profit');

function demand = simulate_demand(n, probGood, probDemand, demands)
temp = rand(n, 1);
day = zeros(n, 1);
day(temp <= probGood) = 1; % 1 meaning good
day(temp > probGood) = 2; % 2 meaning bad


for j = 1:(length(probDemand) - 1) % Convert into CDF
    probDemand(:, j + 1) = probDemand(:, j) + probDemand(:, j + 1);
end


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
end