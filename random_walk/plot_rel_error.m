function [ path ] = plot_rel_error(max_runs, steps, step_size)
path = zeros(1, max_runs);
i = 10;
while i < max_runs
    path(1,i) = relative_error(i, steps, step_size);
    i = i * 2   ;
end
plot(path);
end