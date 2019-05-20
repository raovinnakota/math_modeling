function [ path ] = graphics()
path = zeros(100);
phit = zeros(100);
for i=1:100
    phit(1,i) = i/100;
    prob = streak(phit);
    path(1,i) = prob;
end
plot(phit, path)