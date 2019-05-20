function [out] = main(AB, SO, H, HR)
hit_vec = pHit(AB, SO, H, HR);
[rows col] = size(hit_vec);
out = zeros(rows, col);
for i=1:rows
    out(i,1) = streak(hit_vec(i,1));
end