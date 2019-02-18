function [rel_error] = relative_error(runs, steps, step_size)
% Calculates the relative error using the error squared function on the
% probabilities of the actual and the expected values
endpts = randruns(runs, steps, step_size);
% Get the end points for the function
left = 0:steps;
right = -steps:0;
bins = left + right;
% Create bins for the endpoints
prob = expected_runs(steps, step_size);
freqs = histcounts(endpts, bins);
% Get the theoretical probabilities and the actual frequency using the
% histcounts function
act_prob = freqs ./ runs;
% calculate probabilities by dividing frequencies by # of runs
act_prob(1,steps+1) = 0;
% Calculate the error
rel_error = ((sum((act_prob-prob).^2))^.5);
% Plot both
plot(act_prob);
hold on
plot(prob)
hold off
end