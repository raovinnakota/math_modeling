function [ path ] = finite_diff(tfinal, deltax, k, xfinal, tdelta)
%1D FTCS diffusion/convection code
[x,t] = meshgrid(0:deltax:xfinal, 0:tdelta:tfinal);
alpha=(k*tdelta)/(deltax).^2;
f=zeros(size(x));
if1 = ceil(1/3*length(x(1,:)));
if2 = ceil(2/3*length(x(1,:)));
f(1,if1:if2)=4;
for j=2:length(t(:,1))
    for i=2:length(x(1,:))-1
        f(j,i) = alpha*f(j-1,i-1)+((1-2*alpha)*f(j-1,i))+alpha*f(j-1,i+1);
    end
    path=f;
    pcolor(x,t,path)
    n=length(x(1,:));
    y=zeros(2,17);
    y(2,:)=.5;
    pcolor(x(1:2,:),y,[path(1,:);path(1,:)]);
    shading interp
end 