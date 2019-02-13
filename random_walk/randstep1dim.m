function [ path ] = randstep1dim( steps )
% Models the path of a random walk in 1 dimension (line) with a variable step size 
path = zeros(1,steps);
% Create a final path vector the length of # of steps
for i = 1:steps-1
    num = -1 + (1 + 1)*rand;
    %use rand to choose a number between 1 and -1
    %select direction and step size at the same time
    path(1,i+1) = path(1,i) + num;
end
end