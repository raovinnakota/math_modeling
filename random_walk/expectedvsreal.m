function [] = expectedvsreal (runs, steps, step_size)
endpts = randruns(runs, steps, step_size);
prob = expected_runs(steps, step_size);
expected = prob .* runs;
x = -steps/2:step_size:steps/2;
plot(x,expected);
hold on
histogram(endpts, 'FaceColor', 'none');
hold off
end