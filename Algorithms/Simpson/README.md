# **Function Definition**


# Contents of the Code
function [I] = Simpson(x,y)
%function [I] = Simpson(x,y)
% This functions used the simspons 1/3 rule to approximate the integral (I)
%of a given set of x and y coordinates. It is able to use the 1/3 rule for
%all but the last section of the coordinates by replacing it with a
%trapazodial method if the number of spacings is odd
% Inputs:
%   x = values of evenly spaced x coordinates in increaseing order
%   y = y values of the related x values
% Outputs:
%   I = approximate integral of the x and y coordinates

n=length(x); %defines the number of pints
spaces=n-1; %defines the number of spaces

if length(x)~=length(y) %checks the lengths of the x and y matrix
    error('Ensure that the x and y matrix are the same size')
end

interval_spaceing=diff(x); %spaceing between the x intervals
space_check=diff(interval_spaceing); %spacing between the spaceing of the x intervals
for s=1:1:length(space_check) %this checks that every value bettween the spaceing of the x values is the same by going through each value individually
    if abs(space_check(s)) > 1e-10 %this has to be a small number not 0 because computers can have roundoff errors which might cause this section to be evaluated incorrectly
        error('Ensure that the x values are evenly spaced')
    end
end

Iodd=0;
for i=3:2:(spaces-1) %starts at 3 because 1 is taken care of by the function
    Iodd=Iodd+2*y(i); %the simpsons equation
end

Ieven=0;
for j=2:2:(spaces) %starts at 2 because this only looks at the even spaces
    Ieven=Ieven+4*y(j); %the simpsons equation
end

traparea=0; %defines the traparea as 0 incase its not used
if mod(spaces,2)==1 %use trapazoid on the last segment bc odd spaces
    warning('The trapazodial method will be used on the last segment')
    traparea=(x(n)-x(n-1))*((y(n)+y(n-1))/2) %calculates the trap area
    I=(x(n)-x(1))*((y(1)+Iodd+Ieven+y(n-1))/(3*spaces))+traparea; %uses y(n-1) because the last point is included by the trap area
else
    I=(x(n)-x(1))*((y(1)+Iodd+Ieven+y(n))/(3*spaces))+traparea; %uses y(n) because the last point has to be included by the Simpson rul
end

end
