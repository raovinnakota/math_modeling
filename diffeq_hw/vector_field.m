%This is the code used to solve problem 1 (for both equations)
[x,y]=meshgrid(-2.5:.25:3.5,-1:.25:5);
%Create a meshgrid from -3 to 3
%dy=(3*(y.^4).^(1/3));
%Create dy for equation 1
dy=((y.^2).^(1/3));
%Create dy for equation 2
dx=ones(size(dy));
dw=sqrt(dy.^2 + dx.^2);
%vw=sqrt(vx.^2+vy.^2);
quiver(x,y,dx./dw,dy./dw,.5);
hold on
%solution for eq1
%fplot(@(x) -1/(x+(5/2)).^3, [-1.5,3.5])
%solution for eq2
fplot(@(x) ((1/3).*x - (1/2)).^3, [-1.5,3.5])
hold off