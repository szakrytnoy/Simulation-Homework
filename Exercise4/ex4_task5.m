clc, clear all, close all;
n = 1e4;
passport_time = 1.5;

time_options = [20 30 40 50 60 70 80];
time_pdf = [0.05 0.2 0.4 0.1 0.16 0.07 0.02];
time_cdf = cumsum(time_pdf);
time = invcdf(time_options, time_cdf, n, 1)'; % Generate time on the way

num_options = 1:10;
num_pdf = [0.15 0.31 0.13 0.11 0.08 0.07 0.05 0.03 0.04 0.03];
num_cdf = cumsum(num_pdf);
num = invcdf(num_options, num_cdf, n, 2)'; % Generate customers

num_others = randi(15, n, 1); % Generate other customers
num_total = num + num_others; % Our customers and other passengers

passport_time_total = zeros(n, 1);
for i = 1:n
    passport_control = exprnd(passport_time, num_total(i), 1);
    passport_time_total(i) = sum(passport_control);
end

tot_time = time + passport_time_total + 10; % Total time elapsed
tot_time_sorted = sort(tot_time);
tot_time_099 = tot_time_sorted(0.99*n); % 99% will be on time

control_time = passport_time_total;
control_time_sorted = sort(control_time);
conrtol_time_099 = control_time_sorted(0.99*n);

figure;
histogram(tot_time);
title('Total time');
xlabel('Time needed');

figure;
histogram(control_time);
title('Passport control');
xlabel('Time needed');

fprintf('60 minutes are enough for passport control\n');
