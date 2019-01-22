clc, clear all, close all;
n = 1e4;

p_no_switch_a = MontyHall(n, 3, 0);
p_switch_a = MontyHall(n, 3, 1);
figure; 
bar([p_no_switch_a, p_switch_a]);
title('NDoors = 3');
ylabel('Probability of winning');
xlabel('Strategy 1 : No switch, 2 : Switch')

p_no_switch_b = MontyHall(n, 4, 0);
p_switch_b = MontyHall(n, 4, 1);
figure; 
bar([p_no_switch_b, p_switch_b]);
title('NDoors = 4');
ylabel('Probability of winning');
xlabel('Strategy 1 : No switch, 2 : Switch')

p_no_switch_c = MontyHall(n, 10, 0);
p_switch_c = MontyHall(n, 10, 1);
figure; 
bar([p_no_switch_c, p_switch_c]);
title('NDoors = 10');
ylabel('Probability of winning');
xlabel('Strategy 1 : No switch, 2 : Switch')

function prob = MontyHall(n, ndoors, switch_door)
game = zeros(n, 1);
for i = 1:n
    temp = rand;
    if temp <= 1/ndoors 
        guess = 1; % Found the right door from the first guess
    else % No matter what happens next, the prob of success is fixed
        guess = 0;
    end

    if switch_door == 1 % If he decides to switch (strategy)    

        if guess == 1
            guess = 0 % If the initial guess was right, now he will be wrong
        else % If the initial guess was wrong
            temp = rand;
            if temp <= 1/(ndoors - 2) % Probability that he switches to the right one
                guess = 1;
            end
        end
    end
    
    game(i) = guess; %Won or lost
end

prob = sum(game == 1)/n;
end

    
    