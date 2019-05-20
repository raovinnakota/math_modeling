function [out] = main(AB, SO, H, HR)
%Main runs every single function. It takes the same input as pHit. 
%First, creates hit_vec, the probability of getting a hit in the next at
%bat
hit_vec = pHit(AB, SO, H, HR);
%Get the size of hit_vec so that we can create output of game with hit
%probabilities
[rows col] = size(hit_vec);
%out = the vector of probabilities of getting a hit in the next game (after
%simulations)
out = zeros(rows, col);
%Iterate through the hit_vec, using streak.m to find game probability and
%then place that probability in out. 
for i=1:rows
    out(i,1) = streak(hit_vec(i,1));
end