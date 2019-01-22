clc, clear all, close all;
n = 1e5;

dist = zeros(n, 2); %Predefine for speed
initial_lives = 10;
for k = 1:2 %For each case
    if k == 1
        max_jump = 3;
    elseif k == 2
        max_jump = 5;
    end
    
    for i = 1:n %Num of simulations
        block = 1; %Initialize blocks and lives
        lives = initial_lives;

        while lives > 0 %While alive
            jump = randi(max_jump); %Random jump
            block = block + jump; %Update location

            if mod(block-1, 4) ~= 0 %If dead
                lives = lives - 1; %Take one live
                block = block - jump; %Take back the jump
            end
        end
        dist(i, k) = block; %Keep record
    end
end

dist_a = dist(:, 1);
dist_b = dist(:, 2);

figure;
histogram(dist(:, 1), 'Normalization', 'Probability');
title('Case 1, Jump 1-3'); 
figure;
histogram(dist(:, 2), 'Normalization', 'Probability');
title('Case 2, Jump 1-5'); 