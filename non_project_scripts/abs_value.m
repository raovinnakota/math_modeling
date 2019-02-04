function [ abs ] = abs_value( n )
%A function that returns the absolute value of a given real
%number
if n < 0
    abs = -1 * n;
else
    abs = n;
end
end