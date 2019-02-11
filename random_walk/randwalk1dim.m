function [ path ] = randwalk1dim( steps, step_size )
% Models the path of a random walk in 1 dimension (line)
path = zeros(1,steps);
% Create a final path vector the length of # of steps
for i = 1:steps-1
    %iterate through the number of steps and choose a direction
    if rand < 0.5
        % update the next position based on the current position and
        % step size
        path(1,i+1) = path(1,i) + step_size;
    else
        path(1,i+1) = path(1,i) - step_size;
end
end