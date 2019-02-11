function [ prob_vector ] = expected_runs(steps, step_size)
% Given a potential simulation, it returns the probability of finishing the
% simulation at a given position m
n_1 = 0:step_size:steps;
prob_vector = (factorial(steps) ./ (factorial(n_1) .* factorial(steps - n_1))) .* (0.5 ^ steps);
end