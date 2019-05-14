function [ bool ] = hit(simulation)
count=0;
for i=2:4
    if (simulation(i,1) == 2)
        count = count + 1;
    end
end
if count > 0
    bool = 1;
else
    bool = 0;
end
end