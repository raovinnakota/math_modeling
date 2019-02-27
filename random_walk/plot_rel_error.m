function [ path ] = plot_rel_error(max_runs, steps, step_size)
%plotting the relative error
path = zeros(1, max_runs);
i = 10;
while i < max_runs
    %Calculate the relative error and then plot it
    path(1,i) = relative_error(i, steps, step_size);
    i = i * 2   ;
end
plot(path);
end