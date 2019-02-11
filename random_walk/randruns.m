function [ endpts ] = randruns(runs, steps, step_size)
% Returns a vector of all the endpoints after running 
% the 1 dimension random walk simulation *runs* times
endpts = zeros(1, runs);
% the return array initialized to the dimension of number of runs
for i=1:runs
    % iterate through, running the randomwalk simulation
    path = randwalk1dim(steps, step_size);
    % add the final endpoint to the endpoints vector
    endpts(1,i) = path(1, steps);
end
end