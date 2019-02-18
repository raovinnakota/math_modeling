function [rel_error] = relative_error(runs, steps, step_size)
endpts = randruns(runs, steps, step_size);
left = 0:steps;
right = -steps:0;
bins = left + right;
prob = expected_runs(steps, step_size);
freqs = histcounts(endpts, bins);
act_prob = freqs ./ runs;
act_prob(1,steps+1) = 0;
rel_error = ((sum((act_prob-prob).^2))^.5);
plot(act_prob);
hold on
plot(prob)
hold off
end