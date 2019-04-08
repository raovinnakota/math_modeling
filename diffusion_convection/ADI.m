function [ f ] = ADI(deltax, deltay, deltat, xfinal, yfinal, tfinal, k, u, v)
%Diffusion/Convection in multiple dimensions
%Worked with Elliott Goldstein on writing code
[x,y,t]=meshgrid(0:deltax:xfinal, 0:deltay:yfinal, 0:deltat:tfinal);

cx=(u*deltat)/deltax;
cy=(v*deltat)/deltay;

alphax=(k*deltat)/(deltax).^2;
alphay=(k*deltat)/(deltay).^2;


a=diag((1+alphax)*ones(m,1))+diag((-cx/4+(alphax/2))*(ones(m-1,1)),-1)+diag((cx/4-(alphax/2))*ones(m-1,1),1);
b=diag((1-alphay)*ones(n,1))+diag((alphay/2+cy/4)*(ones(n-1,1)),-1)+diag((alphay/2-cy/4)*ones(n-1,1),1);

m=length(x(1,:));
n=length(y(1,:));
p=length(t(1,:));
p=length(t(1,:));
fn=(zeros(m,n,p));

if1=ceil(1/3*length(fn(1,:)));
if2=ceil(2/3*length(fn(1,:)));
if3=ceil(1/3*length(fn(:,1)));
if4=ceil(2/3*length(fn(:,1)));

fn(if1:if2,if3:if4)=4;
size(fn)

c=fn.*b;
[P,L,U,sign]=splu(a);
f=zeros(m,n,p);
[k l]=size(fn);
t2=1:p;
    for j=1:l
       q=forward(L,P*c(:,j));
       r=BackSub(U,q);
       f(:,j,:)=r;
    end
    pcolor(f(:,:,1))
    %%pcolor(f(:,:,1)
    %%shading 'interp
    %%pcolor([0 1], [1 2]