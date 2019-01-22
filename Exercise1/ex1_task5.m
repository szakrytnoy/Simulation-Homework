clc, clear all, close all;

nn = [100, 1000];

%Case a
probHot = 0.29;
temp = rand(nn(1), 1);
rai(temp <= probHot) = 1;
rai(temp > probHot & temp <= 1) = 2;

figure; hold on; %Initialize visualization
histogram(rai, 'Normalization', 'Probability');
plot([1, 2], [probHot, 1 - probHot], 'r.', 'MarkerSize', 10)
legend('Test', 'Expected', 'Location', 'northwest');
title('Case A, 100 samples');

temp = rand(nn(2), 1);
raii(temp <= probHot) = 1;
raii(temp > probHot & temp <= 1) = 2;

figure; hold on; %Initialize visualization
histogram(raii, 'Normalization', 'Probability');
plot([1, 2], [probHot, 1 - probHot], 'r.', 'MarkerSize', 10)
legend('Test', 'Expected', 'Location', 'northwest');
title('Case A, 1000 samples');

%Case b
probHot = 0.29; probWarm = 0.4;
temp = rand(nn(1), 1);
rbi(temp <= probHot) = 1;
rbi(temp > probHot & temp <= probHot + probWarm) = 2;
rbi(temp > probHot + probWarm & temp <= 1) = 3;

figure; hold on; %Initialize visualization
histogram(rbi, 'Normalization', 'Probability');
plot([1, 2, 3], [probHot, probWarm, 1-probHot-probWarm], 'r.', 'MarkerSize', 10)
legend('Test', 'Expected', 'Location', 'northwest');
title('Case B, 100 samples');

probHot = 0.29; probWarm = 0.4;
temp = rand(nn(2), 1);
rbii(temp <= probHot) = 1;
rbii(temp > probHot & temp <= probHot + probWarm) = 2;
rbii(temp > probHot + probWarm & temp <= 1) = 3;

figure; hold on; %Initialize visualization
histogram(rbii, 'Normalization', 'Probability');
plot([1, 2, 3], [probHot, probWarm, 1-probHot-probWarm], 'r.', 'MarkerSize', 10)
legend('Test', 'Expected', 'Location', 'northwest');
title('Case B, 1000 samples');