clc, clear all, close all;
% I endeavour to solve this problem without ifs
% CHALLENGE ACCEPTED
n = 10000;
numNodes = 5;

PDFs = [0.1 0.9   % For nodes 2 and 4
        0.4 0.6]; % For nodes 1 and 3
CDFs = cumsum(PDFs, 2); % Generate CDFs by rows

numLoops = zeros(n, 1);
for i = 1 : n
    currentNode = randi(numNodes - 1); % Starting point
    fprintf('Starting point %1.0f\n', currentNode)
    numSteps = 0;
    center = false; % Marker
    
    while center == false
        numSteps = numSteps + 1; % One more step is made
        r = rand; % Generate random number

        special = (mod(currentNode, 2) == 1); % 1 if nodes 1 or 3, 0 otherwise
        k = special + 1; % Which row of CDFs we are going to use

        center = (r <= CDFs(k, 1)); % Going to center?
        makeStep = (center == 0); % Make step only if not in center 
        currentNode = currentNode + makeStep; % Add step to the counter
        currentNode(currentNode > 4) = 1; % Start new cycle
        if center == 1
            fprintf('This has been the last iteration\n')
            fprintf('Number of steps %1.0f\n', numSteps)
            fprintf('Number of loops %1.0f\n\n', fix(numSteps/4))
        end
    end

    numLoops(i) = fix((numSteps - 1) / 4); % Number of loops
    %I use numSteps - 1, because the last step is towards the center
end

psimul = sum(numLoops > 0)/n; % Probability of making at least one loop
avFullCircles = mean(numLoops); % Expected number of loops
histogram(numLoops, 1:1:max(numLoops), 'Normalization', 'Probability');
title('Number of loops made');