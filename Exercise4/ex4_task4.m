clc, clear all, close all;
n = 1e4;

pa = prob2(3, n);
pb = prob2(4, n);
pc = prob2(10, n);

function prob = prob2(p, n);
ok = 1:p;

num_correct = zeros(n, 1);
for i = 1:n
    real = randperm(p);
    num_correct(i) = sum(real == ok); % How many were correct
end
prob = sum(num_correct == 2) / n;
end