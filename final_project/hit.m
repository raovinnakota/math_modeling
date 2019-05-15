function [ bool ] = hit(simulation)
%Takes a simulated game(simulation) as input and counts whether or not the 
%player got a hit in the 3 at bats. Outputs 1 if they did, 0 if they didn't
count=0;
%The number of hits is count
%We iterate starting at the 2nd value because the first value in the
%simulation is the starting state. It actually doesn't count as a "hit" or
%"not hit".
for i=2:4
    %State 2 from the Markov Chain is getting a "hit"
    if (simulation(i,1) == 2)
        count = count + 1;
    end
end
%If we have more than one hit, return 1 or True. Else return 0 or False
if count > 0
    bool = 1;
else
    bool = 0;
end
end