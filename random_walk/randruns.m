function [ endpts ] = randruns(runs, steps, step_size)
endpts = zeros(1, runs);
for i=1:runs
    path = randwalk1dim(steps, step_size);
    endpts(1,i) = path(1, steps);
end
end