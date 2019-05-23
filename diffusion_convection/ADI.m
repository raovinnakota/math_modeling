function [f]=ADI(deltax, deltay, deltat, xfinal, yfinal, tfinal,kappa,u,v)
%Diffusion/Convection in multiple dimensions
%Worked with Elliott Goldstein and Kyle Zigner on writing code
[x,y,t]=meshgrid(0:deltax:xfinal,0:deltay:yfinal,0:deltat:tfinal);

cx=(u*deltat)/deltax;
cy=(v*deltat)/deltay;

alphax=(kappa*deltat)/(deltax).^2;
alphay=(kappa*deltat)/(deltay).^2;

%Define the dimensions for the resulting 3d matrix
m=length(x(1,:))
n=length(y(1,:))
p=length(t(1,:))

%4 tridiagonal matrices, 2 in the x and 2 in the y direction. Their
%equations were from the source material on diffusion/convection
ax=diag((1+alphax)*ones(m,1))+diag((-cx/4-(alphax/2))*(ones(m-1,1)),-1)+diag((cx/4-(alphax/2))*ones(m-1,1),1);
ay=diag((1+alphay)*ones(n,1))+diag((cy/4-(alphay/2))*(ones(n-1,1)),1)+diag(((-alphay/2)-cy/4)*ones(n-1,1),-1);
bx=diag((1-alphax)*ones(n,1))+diag(((alphax/2)-cx/4)*(ones(n-1,1)),1)+diag((alphax/2+cx/4)*ones(n-1,1),-1);
by=diag((1-alphay)*ones(m,1))+diag((cy/4+(alphay/2))*(ones(m-1,1)),-1)-diag((-cy/4+(alphay/2))*ones(m-1,1),1);


%preallocate space for then f 3-d matrix
f=zeros(m,n,p)
l=length(f(:,1))

%These are the initial conditions for the output matrix aka the value at
%timeslice 1
cond1=ceil(1/3*length(f(1,:,:)));
cond2=ceil(2/3*length(f(1,:,:)));
f(cond1:cond2,cond1:cond2,1)=4;

%Use splu to derive the various permutational slices from tridiag matrices
%for left hand side. Ay splu is transposed so that it can be used for
%forward and backward substitutions
[Px,Lx,Ux]=splu(ax);
[PyT,LyT,UyT]=splu(ay');

%preallocate space for the fn+1/2 matrix
fhalf=zeros(m,n,p);

%The nested loops to find fn+1/2 and fn+1. Find fn+1/2 in one direction and
%fn+1/2 in the other direction. Transpose twice to get original order and
%then transpose back. 
%Outer loop is for fn+1/2 and inner loop for fn+1
for t=1:p
    if mod(t,2)==0
        b=(transpose(Px)*f(:,:,t)*by);
        L=Lx;
        U=Ux;
    else
        b=PyT'*transpose(bx*f(:,:,t));
        L=LyT;
        U=UyT;
    end
    for j=1:l
            c=forward(L,b(:,j));
            x=BackSub(U,c);
            fhalf(:,j,t)=x;
    end
    if mod(t,2)==1
        fhalf(:,:,t)=transpose(fhalf(:,:,t));
    end
        for t2=2:p
            if mod(t,2)==1
                b=(transpose(Px)*fhalf(:,:,t)*by);
                L=Lx;
                U=Ux;
            else
                b=PyT'*transpose(bx*fhalf(:,:,t));
                L=LyT;
                U=UyT;
            end
        for j=1:l
            c=forward(L,b(:,j));
            x=BackSub(U,c);
            f(:,j,t2)=x;
        end
        if mod(t2,2)==0
           f(:,:,t2)=transpose(f(:,:,t2));
        end   
    end
end
end