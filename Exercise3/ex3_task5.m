clc, clear all, close all;

M0 = 1e4;		% number of atoms to simulate
p = 0.0173;			% given probability of disintegration per year
n = 10^2;    % no of repetitions
T = 300;    % Maximum time

M = zeros(T+1,n); % Initialization of M
M(1,:) = M0;			% set the initial amount of matter for the amount at t=0

figure; hold on;
for k = 1:n
    for i = 1:T
        remain = ones(1, M(i, k)); % Create vector for remaining nuclei
        temp = rand(1, M(i, k));
        remain(temp <= p) = 0; % Disintegrate some of them
        M(i+1, k) = sum(remain);
    end
    plot([0:T], M(:, k));
end
title('All simulations');

figure; hold on;
t = [0:T];
M_theory = M0 .* exp(- p .* t);
plot(t, M_theory, 'r');
plot(t, mean(M, 2), 'k');
legend('Theoretical', 'Mean of simulations');
title('Theoretical and mean');  