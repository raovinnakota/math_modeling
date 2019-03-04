function [m]=MyFunction(x,y)
%Evaluates the function F(x,y)=3*y^(4/3) at inputed point (x,y)
    m=3*(y.^4).^(1/3);
end