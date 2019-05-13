function [f]=pHit(AB,SO,H,HR)
%N and K values are used to weight the stats towards the league average.
%K's values are derived reflect the spreads of the possibilitites
%of each outcome (hit, out, homerun, strikeout.)K has a small value for
%Homeruns, indicating a large spread of hr probabilities from player to
%player, but much larger for hits in play, indicating a much similar
%ability from player to player to get non homerun hits in play
KSO=40.60;
KHR=65.70;
KHIP=418.10;
nSO=.203;
nHR=.0369;
nHIP=.303;
pSO=(SO+KSO.*nSO)./(AB+KSO);
pHR=(HR+KHR.*nHR)./(AB-SO+KHR);
pHIP=(H-HR+KHIP.*nHIP)./(AB-SO-HR+KHIP);
%Much of the adjustment for weighted average is reliant on the BABIP
%component. BABIP is (H-HR/AB-SO-HR), and the pHIP component is the
%weighted version of this. A higher BABIP is considered unsustainable when
%it is much higher than league average and therefore a higher BABIP causes
%a greater decrease in weighted average, and vice versa
f=(1-pSO).*(pHR+(1-pHR).*pHIP)
