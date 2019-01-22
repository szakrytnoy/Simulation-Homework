clc, clear all, close all;
n = 1e5;

a = 0; b = 2*pi;
p_dens = @(x) 0.2*sin(x.^2) + sin(x/10); %Define function
x_sample = linspace(a, b, 100 ); %For plotting and limits
y_sample = p_dens(x_sample);
M = max(y_sample); %Find the upper bound for u

x_i = a + (b - a) .* rand(n, 1); %Generate random x
u_i = M * rand(n, 1); %Generate random u
sample = x_i(u_i < p_dens(x_i)); %Choose which we accept

frac_sample = length(sample) / n; %Fraction of accepted
fprintf('Proportion accepted %5.3f\n', frac_sample);

%Visualize
nbins = 100;
figure; hold on;
histogram(sample, 'Normalization', 'pdf');
plot(x_sample, y_sample, 'b-', 'LineWidth', 2)
legend('Test', 'Expected', 'Location', 'northeast');