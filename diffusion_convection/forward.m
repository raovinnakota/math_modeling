
function[x]=forward(L,b)
%This function solve a lower triangular system using forkward substitution
%method. The standard call is: "x=backward(U,b) in wich L and b represent
%respectively the lower triangular matrix and  the known term.
%******************
%Riccardo Dess?
%e-mail:ri.dessi1@studenti.unica.it
%******************
S=size(L);
m=S(1);
if S(1)~=S(2)
    error('matrix mast be square')
end
x=zeros(1,m);
x(1,1)=b(1)./L(1,1);
%bacward substitution
for k=2:m   
        x1=1/L(k,k).*(b(k)-sum(L(k,k-1:-1:1).*x(k-1:-1:1)));
        x(1,k)=x1;
end
x=x';
end