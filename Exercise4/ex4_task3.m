clc, clear all, close all;
n = 1e7;
disease = 0.01;
accuracy = 0.87;

temp = rand(n, 1);
HIV_real = zeros(n, 1);
HIV_real(temp <= disease) = 1;

test = zeros(n, 1);
for i = 1:n
    temp = rand;
    
    if temp <= accuracy
        test(i) = HIV_real(i);
    else
        test(i) = abs(HIV_real(i) - 1);
    end
end
confus(1, 1) = sum(HIV_real == 1 & test == 1);
confus(1, 2) = sum(HIV_real == 1 & test == 0);
confus(2, 1) = sum(HIV_real == 0 & test == 1);
confus(2, 2) = sum(HIV_real == 0 & test == 0);

psimul = confus(1, 1) / confus(2, 1);

disp('P(test = 1 | HIV = 1) = 0.87');
disp('P(HIV = 1) = 0.01');
fprintf('P(test = 1) = %3.2f\n\n',0.87*0.01 + 0.13*0.99);
disp('P(HIV = 1 | test = 1) = P(test = 1 | HIV = 1) * P(HIV = 1) / P(test = 1)');
fprintf('P(HIV = 1 | test = 1) = %4.3f\n',0.87*0.01/(0.87*0.01 + 0.13*0.99));        