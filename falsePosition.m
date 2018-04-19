function [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxiter)
%function [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxiter)
%   This falsePosition function is used to approximate the root of a
%   function. The criteria for a "close-enough" root is determined by the
%   approximate error (ea) or the number of iterations (maxiter)
%
%Inputs:
%   func - the function being evaluated (the function should be manipulated
%       by user to have the roots be the answer to the function)
%       Input your function in the format "@(x) (function)"
%          ex) if your function is x^2 + 1, input it as "@(x) (x^2 + 1)"
%   xl - the lower guess
%   xu - the upper guess
%   es - the desired relative error (should default to 0.0001%)
%   maxiter - the max number of iterations desired (should default to 200)
%Outputs:
%   root - the estimated root location
%   fx - the function evaluated at the root location
%   ea - the approximate relative error (%)
%   iter - how many iterations were performed

%% Number of Input Check: This section ensures that the user's inputs
%   satisfies the requirements of the code
if nargin<3 || nargin>5
    error('Input 3-5 input variables') %makes sure that the user inputs
    % the correct number of variables (3-5)
elseif nargin==3 %accounts for the user only inputting 3 variables
    es=0.0001; maxiter=200;
elseif nargin==4 %accounts for the user only inputting 4 variables
    maxiter=200;
end

%% Check the validity of the initial bounds
fl=feval(func,xl); %evaluates the function at the lower bound
fu=feval(func,xu); %evaluates the function at the upper bound
if (fl*fu)>0 %ensures that the inital bounds chosen accutally enclose the
    % root
    error('Choose bounds that bound the root')
end

%% Performs the Fasle Position root approximation
iter=0; %sets the inital iteration to 0
xr=xl; %sets xr to xl for the first iteration of the while loop
ea=100;%sets the approximate error to 100% initally
while ea>=es && iter<maxiter %runs through the while loop as long as the
    %iterations is less than the max number of iterations indicated, and
    %the approximate error value is greater than or equal to the indicated
    %error value
    % A and statement is used so that if one of the requirements is false
    % the while loop ends
        xrold=xr; %saves the xr as the xrold value to perform the error 
        %approximation
        fl=feval(func,xl); %evaluates the function at the lower bound
        fu=feval(func,xu); %evaluates the function at the upper bound
        xr=xu-(fu*(xl-xu))/(fl-fu); %evaluates the approx root
        iter=iter+1; %counts the number of iterations
        ea=abs((xr-xrold)/xr)*100; %evaluates the approximate error %
        fr=feval(func,xr); %evaluates the function at the new approx root 
        % it is important that this happens after the xr is redefined
        % because this evaluation is used to determine if the new bounds
        % should go the left or right of the approx root
        if (fl*fr)<0 %if there is a sign change between the values of the
            % lower and approx root then the approx root becomes the upper
            % bound for the next iteration and the lower bound remains the
            % same
            xu=xr;
        elseif (fl*fr)>0 %if there is no sign change between the values of 
            % the lower and approx root then the approx root becomes the 
            % lower bound for the next iteration and the upper bound
            % remains the same
            xl=xr;
        end
end
%% Defines and displays the outputs
root=xr;
fx=feval(func,xr);
ea=ea;
iter=iter;
fprintf('The root of the function within the bounds is %8.4e \n', root)
fprintf('The value of the function at the root value is %8.4e \n', fx)
fprintf('The approximate error percentage is %10.10f percent \n', ea)
fprintf('The number of iterations performed is %8.4f \n', iter)
end