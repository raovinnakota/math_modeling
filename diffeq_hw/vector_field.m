[x,y]=meshgrid(.3:.25:3,-.3:.25:3);
vy=(y./4);
vx=(x./3);
vw=sqrt(vx.^2+vy.^2);
quiver(x,y,vx./vw,vy./vw)
%hold on
%fplot(@(x) -1/(x+(5/2)).^3, [0,3])
%hold off