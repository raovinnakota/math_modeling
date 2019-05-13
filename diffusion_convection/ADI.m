function [ f ] = ADI(deltax, deltay, deltat, xfinal, yfinal, tfinal, k, u, v)
%Diffusion/Convection in multiple dimensions
%Worked with Elliott Goldstein and Kyle Zigner on writing code
[x,y,t]=meshgrid(0:deltax:xfinal, 0:deltay:yfinal, 0:deltat:tfinal);

cx=(u*deltat)/deltax;
cy=(v*deltat)/deltay;

alphax=(k*deltat)/(deltax).^2;
alphay=(k*deltat)/(deltay).^2;

m=length(x(:,1,1));
n=length(y(1,:,1));
p=length(t(1,1,:));
fn=(zeros(m,n,p));

ax=diag((1+alphax)*ones(m,1))+diag((-cx/4+(alphax/2))*(ones(m-1,1)),-1)+diag((cx/4-(alphax/2))*ones(m-1,1),1);
ay=diag((1+alphay)*ones(m,1))+diag((-cy/4+(alphay/2))*(ones(m-1,1)),-1)+diag((cy/4-(alphay/2))*ones(m-1,1),1);
bx=diag((1-alphax)*ones(n,1))+diag((alphax/2+cx/4)*(ones(n-1,1)),-1)+diag((alphay/2-cx/4)*ones(n-1,1),1)
by=diag((1-alphay)*ones(n,1))+diag((alphay/2+cy/4)*(ones(n-1,1)),-1)+diag((alphay/2-cy/4)*ones(n-1,1),1)

if1=ceil(1/3*length(fn(1,:)));
if2=ceil(2/3*length(fn(1,:)));
if3=ceil(1/3*length(fn(:,1)));
if4=ceil(2/3*length(fn(:,1)));

fn(if1:if2,if3:if4)=4;
[px,lx,ux,signx]=splu(ax);
[py,ly,uy,signy]=splu(ay');
[pc,lc,uc,signc]=splu(bx);
[pd,ld,ud,signd]=splu(by');

[j k l] = size(fn);

for i=1:p
    test(:,:) = fn(i,:,:);
    if mod(i,2)==0
        c=test*bx;
        for x=1:l
            q=forward(lx,px*c(:,x));
            r=BackSub(ux,q);
            f(:,x,:)=r;
        end
    else
        c=test*by;
        for x=1:l
            q=forward(ly,py*c(:,x));
            r=BackSub(uy,q);
            f(:,x,:)=r;
        end
    end
    %It's clear that I have to perform step 2 inside the timesteps. Still
    %working that out. 
end

%f=zeros(m,n,p);
%[k l]=size(fn);
%t2=1:p;
%    for j=1:l
%      q=forward(L,P*c(:,j));
%       r=BackSub(U,q);
%       f(:,j,:)=r;
%    end
%    pcolor(f(:,:,1))
    %%pcolor(f(:,:,1)
    %%shading 'interp
    %%pcolor([0 1], [1 2]