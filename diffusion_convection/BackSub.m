function [ x ] = BackSub( U,b )
[n,m]=size(U);
x=zeros(n,1);
for i=1:n
    k=n-i+1;
s=U(k,(k+1):n)*x((k+1):n);
    x(k)=(b(k)-s)/U(k,k);   
end
end