function [ path ] = randwalk1dim( steps, step_size )
path = zeros(1,steps);
for i = 1:steps-1
    if rand < 0.5
        path(1,i+1) = path(1,i) + step_size;
    else
        path(1,i+1) = path(1,i) - step_size;
end
end