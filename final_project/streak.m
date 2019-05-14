function [prob] = streak(pHit)
%This piece of code returns the probability of getting a hit in the next
%game given the probability of getting a hit in the next at bat(pHit). It
%does that by using Markov Chains. 

%The probability of not getting a hit. Since getting a hit is a binary
%state, it is pHit's complement. 
npHit = 1 - pHit;
%The markov chain has two states - hit and not hit. The probability of
%getting a hit (pHit) is the same regardless if your last at bat was a hit
%or not. The same applies for npHit.
transition_matrix = [npHit pHit ; npHit pHit];
%Creates the markov chain mc
mc = dtmc(transition_matrix);
%Names the states - purely superficial
mc.StateNames = ["Not Hit", "Hit"];
hits = 0;
%This runs a 100 simulated games. The number of games where the player hat
%at least 1 hit are counted
for i = 1:1000
    test = simulate(mc,3);
    bool = hit(test);
    if bool == 1
        hits = hits + 1;
    end
end
%The final probability of getting a hit in this game is the ratio of
%simulated games where the player got a hit to total number of simulated
%games
prob = hits/1000;
end