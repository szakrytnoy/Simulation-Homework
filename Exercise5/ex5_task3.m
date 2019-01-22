clc, clear all, close all;
n = 10000; %Number of simulations
nrounds = 5;
initial_capital = 100; %Initial capital

%Probabilities of success for each strategy
prob_i = 1/38; %Numbers
pay_i = 36;

prob_ii = 18/38; %Colors;
pay_ii = 2;

prob_iii = 12/38; %Dozens
pay_iii = 3;

%Part A-i. Bet everything you have on number
rounds_ai = play_roulette(n, nrounds, initial_capital, prob_i, pay_i, 'a');
pai = sum(rounds_ai(:, 5) >= 100)/n;
prob_round_ai = sum(rounds_ai >= 100)/n;
figure;
bar(prob_round_ai);
xlabel('Round');
ylabel('Prob');
title('Probability to have more than 100');

%Part A-ii. Bet everything you have on color
rounds_aii = play_roulette(n, nrounds, initial_capital, prob_ii, pay_ii, 'a');
paii = sum(rounds_aii(:, 5) >= 100)/n;
prob_round_aii = sum(rounds_aii >= 100)/n;
figure;
bar(prob_round_aii);
xlabel('Round');
ylabel('Prob');
title('Probability to have more than 100');

%Part A-iii. Bet everything you have on dozens
rounds_aiii = play_roulette(n, nrounds, initial_capital, prob_iii, pay_iii, 'a');
paiii = sum(rounds_aiii(:, 5) >= 100)/n;
prob_round_aiii = sum(rounds_aiii >= 100)/n;
figure;
bar(prob_round_aiii);
xlabel('Round');
ylabel('Prob');
title('Probability to have more than 100');

%Part B-i. Bet 100 euros on number
rounds_bi = play_roulette(n, nrounds, initial_capital, prob_i, pay_i, 'b');
pbi = sum(rounds_bi(:, 5) >= 100)/n;
prob_round_bi = sum(rounds_bi >= 100)/n;
figure;
bar(prob_round_bi);
xlabel('Round');
ylabel('Prob');
title('Probability to have more than 100');

%Part B-ii. Bet 100 euros on color
rounds_bii = play_roulette(n, nrounds, initial_capital, prob_ii, pay_ii, 'b');
pbii = sum(rounds_bii(:, 5) >= 100)/n;
prob_round_bii = sum(rounds_bii >= 100)/n;
figure;
bar(prob_round_bii);
xlabel('Round');
ylabel('Prob');
title('Probability to have more than 100');

%Part B-iii. Bet 100 euros on dozen
rounds_biii = play_roulette(n, nrounds, initial_capital, prob_iii, pay_iii, 'b');
pbiii = sum(rounds_biii(:, 5) >= 100)/n;
prob_round_biii = sum(rounds_biii >= 100)/n;
figure;
bar(prob_round_biii);
xlabel('Round');
ylabel('Prob');
title('Probability to have more than 100');

function rounds = play_roulette(n, nrounds, initial_capital, prob, pay, mode)
rounds = zeros(n, nrounds); %Predefine array of cash after rounds

for i = 1:n
    cash = initial_capital; %Start simulation with initial capital
    
    for k = 1:nrounds
        if mode == 'a'
            bet = cash; %Bet with everything
        elseif mode == 'b' 
            bet = 100; %Bet with 100e
        end
        
        cash = cash - bet; %Place bet = give money
        temp = rand;
        
        if temp <= prob
            win = bet * pay; %Win
        else
            win = 0; %Lose
        end
        
        cash = cash + win; %Update cash
        rounds(i, k) = cash; %Store in rounds
        if cash == 0
            break %Stop playing
        end
    end
end
end

        