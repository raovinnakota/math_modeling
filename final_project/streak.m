function [prob] = streak(pHit)
npHit = 1 - pHit;
transition_matrix = [npHit pHit ; npHit pHit];
mc = dtmc(transition_matrix);
mc.StateNames = ["Not Hit", "Hit"];
hits = 0;
for i = 1:100
    test = simulate(mc,3);
    bool = hit(test);
    if bool == 1
        hits = hits + 1;
    end
end
prob = hits/100;
end