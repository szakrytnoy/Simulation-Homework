clc, clear all, close all;

n = 1e4;

maxNum = 6; %From 1 to ...
diceMeanS = zeros(1, n); %Predefine the history vector

for m = 1:n
    dices = randi(maxNum, 1, m); %Generate all at once in a vector
    dice_mean = mean(dices); %Obtain the mean
    diceMeanS(m) = dice_mean; %Store the result
end
theoretical = mean(1:maxNum);

figure; hold on;
plot(1:n, diceMeanS, 'k');
plot(1:n, theoretical*ones(1, n), 'g');
xlabel('ID = Number of simulations');
ylabel('Average number');
legend('Simulation', 'Theoretical');    