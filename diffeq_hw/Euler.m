function [x,y]=Euler(x0,y0,xf,h)
%Approximates the solution to dy/dx=f(x,y), y(x0)=y0 on the interval using
%Euler's method. MyFunction is for eq1 and MyFunction2 is for eq2

x=x0:h:xf;            
y=zeros(size(x));      
y(1)=y0;
n=length(x);

for ii=1:(n-1)
  %y(ii+1)=y(ii)+h*MyFunction(x(ii),y(ii)); %f1
  y(ii+1)=y(ii)+h*MyFunction2(x(ii),y(ii)); %f2
end
plot(x,y);
end