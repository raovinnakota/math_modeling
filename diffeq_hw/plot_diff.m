function [ diff ] = plot_diff(h)
%Plots the difference between the approximated solution and the real
%solution of the equation 1
[x,y] = Euler(-3/2, -3/2, 3, h);
%Use Euler's method to get an approximate solution
eqy = -1./((x+(5/2)).^3);
%Use the same x range to calculate the real solution
diff = y - eqy;
%Find the difference
plot(diff)
%Plot the difference
end