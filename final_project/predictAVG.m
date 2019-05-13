function [f]=predictAvg(AVG,AB,SO,H,HR)
[m n]=size(AVG)
f=(zeros(m,2));
StatsMatrix=[AB,SO,H,HR];
%Albert (2016): Constructed the following model for predicting the
%likelihood of a hit: p(H)=(1-p(strikeout))*(p(HR)+1-p(HR)*p(HIP))
%k is the random effect parameters
cof=inv(StatsMatrix'*StatsMatrix)*StatsMatrix'*AVG;
rvalues=StatsMatrix*cof;
for i=1:420
    f(i,1)=pHit(AB(i,1),SO(i,1),H(i,1),HR(i,1));
    f(i,2)=(AVG(i,1)-pHit(AB(i,1),SO(i,1),H(i,1),HR(i,1))).^2/AVG(i,1);
    f(i,3)=(AVG(i,1)-rvalues(i,1)).^2/AVG(i,1)
    %f(i,3)=(AVG(i,1)-(StatsMatrix*cof)).^2/AVG(i,1);
end
avgerrorpHit=sum(f(i,2))/length(f(i,2))
avgerrorlinregress=sum(f(i,3))/length(f(i,3))
%avgerrorPhit=1.3054e-04
%avererrorlinregress=.0051
len=length(AVG)
x=1:len;
%relative error is the differnence of actual-predicted/(actual)
%relerror=((f-AVG).^2)/AVG
%relerror=relerror(:,1)
histogram(f(:,2),'FaceColor','Red');
hold on
histogram(f(:,3),'FaceColor','BLue');
hold off
