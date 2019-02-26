function [ path ] = randwalk2dim( steps )
%A random walk in two dimensions using the same principles as the walk in 1
%dimension
path = zeros(steps, 2);
%Create the vector that holds x location in col 1 and y location in col 2
for i=1:steps-1
    %iterate through the # of steps and choose one direction to move in
    if rand < 0.25
        path(i+1,1) = path(i,1) + 1;
        path(i+1,2) = path(i,2);
        %once the decision is made, continue so you don't move in 2
        %directions in any given turn.
        continue
    elseif 0.25 < rand < 0.5
        path(i+1,1) = path(i,1) - 1;
        path(i+1,2) = path(i,2);
        continue
    elseif 0.5 < rand < 0.75
        path(i+1,1) = path(i,1);
        path(i+1,2) = path(i,2) + 1;
        continue
    else
        path(i+1,1) = path(i,1);
        path(i+1,2) = path(i,2) - 1;
        continue
end
end