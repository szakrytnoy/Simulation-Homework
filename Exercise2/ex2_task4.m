clc, clear all, close all;

data1 = load('dataset1.txt');
data2 = load('dataset2.txt');
n = 1e4; % sample size

%Part A. Using provided functions
[cdf1, ev_points1] = empcdf(data1); 
[cdf2, ev_points2] = empcdf(data2);
r1 = invcdf(ev_points1, cdf1, n)'; 
r2 = invcdf(ev_points2, cdf2, n)';

%Histograms for dataset 1
figure; subplot(1, 2, 1);
histogram(data1, 4, 'Normalization', 'Probability');
title('Data 1');
subplot(1, 2, 2);
histogram(r1, 4, 'Normalization', 'Probability');
title('Generated sample 1');

%Histograms for dataset 2
figure; subplot(1, 2, 1);
histogram(data2, 20, 'Normalization', 'Probability');
title('Data 2');
subplot(1, 2, 2);
histogram(r2, 20, 'Normalization', 'Probability');
title('Generated sample 2');

figure; subplot(1, 2, 1); %Empirical CDF of the sample
stairs(cdf1, ev_points1);
title('Dataset 1');
subplot(1, 2, 2);
stairs(cdf2, ev_points2);
title('Dataset 2');

%Part B. Using MATLAB functions
[cdf1_m, ev_points1_m, flo1, fup1] = ecdf(data1, 'bounds', 'on');
figure; subplot(1, 2, 1); hold on;
stairs(ev_points1_m, cdf1_m);
stairs(ev_points1_m, flo1, 'r:'); stairs(ev_points1_m, fup1, 'r:');
plot(3, 0.46, 'r.', 'MarkerSize', 10);
title('Dataset 1');
in1 = 1; %Inside

[cdf2_m, ev_points2_m, flo2, fup2] = ecdf(data2, 'bounds', 'on');
subplot(1, 2, 2); hold on;
stairs(ev_points2_m, cdf2_m);
stairs(ev_points2_m, flo2, 'r:'); stairs(ev_points2_m, fup2, 'r:');
plot(3, 0.46, 'r.', 'MarkerSize', 10);
title('Dataset 2');
in2 = 0; %Outside