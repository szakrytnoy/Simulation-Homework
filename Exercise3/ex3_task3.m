clc, clear all, close all;
n = 1e5;

dist = zeros(n, 3); %Predefine for speed
for k = 1:3 %For each case
    if k == 1
        initial_lives = 1;
    elseif k == 2
        initial_lives = 3;
    elseif k == 3
        initial_lives = 10;
    end
    
    for i = 1:n %Num of simulations
        block = 1; %Initialize blocks and lives
        lives = initial_lives;

        while lives > 0 %While alive
            jump = randi(3); %Random jump
            block = block + jump; %Update location

            if mod(block, 2) == 0 %If dead
                lives = lives - 1; %Take one live
                block = block - jump; %Take back the jump
            end
        end
        dist(i, k) = block - 1; %Keep record
    end
end

dist_a = dist(:, 1);
dist_b = dist(:, 2);
dist_c = dist(:, 3); 

figure;
histogram(dist(:, 1), 'Normalization', 'Probability');
title('Case 1, 1 live'); 
figure;
histogram(dist(:, 2), 'Normalization', 'Probability');
title('Case 2, 3 lives'); 
figure;
histogram(dist(:, 3), 'Normalization', 'Probability');
title('Case 3, 10 lives'); 