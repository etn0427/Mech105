function [L,U,P] = luFactor(A)
%function [L,U,P] = luFactor(A)
% 
% This function determins the L, U, and P matrices found from LU
% factorization. It piviots the A matrix and performs Gauss elimination, in
% order to correctly set up the problem. The function also records the
% coeffeicnts used in the Gauss elim, and keeps track of how the U matrix
% was pivoted. Ultimately, it ensures that A*P=L*U.
%
% INPUTS
%   A = coefficient matrix
%       make sure to define A in the command window prior to recalling it
%       in the luFactor function
%
% OUTPUTS
%   L = lower triangular matrix
%   U = upper triangular matrix
%   P = the pivot matrix


[row,column]=size(A); %defines the size of the A matrix interms of row and column

L=eye(row,column); %creates the initial L matrix
U=A; %sets the inital U matrix equal to A
P=eye(row,column); %creates the initial P matrix

if nargin ~=1 %checks for number of inputs
    error('Input the A matrix')
end
if row~=column %makes sure that the A matrix is square
    error('Ensure that A is a square matrix')
end
    

for j=1:column %begins at the first column and goes until all the columns have been indexed
    [max_val,row_index]=max(abs(U(j:column,j)));
    %indicates what row the max value in column j is
    row_index=row_index+(j-1); %j-1 is needed because the max function restricts the index from j to column and it needs to reevaluate the postition of the maxvalue interms of the original matrix
    orig_row=U(j,:); %defines the original value of the "j" row and stores it
    U(j,:)=U(row_index,:); %redifies the "j" row with the row with the max value
    U(row_index,:)=orig_row; %redifines the row with the max value with the origial "j" row values
                               %lines 35-37 pivot the U matrix based on the max_val
    
    orig_rowP=P(j,:); %defines the original value of the "j" row and stores it
    P(j,:)=P(row_index,:); %redifies the "j" row with the row with the max value (from the U matrix)
    P(row_index,:)=orig_rowP; %redifines the row with the max value with the origial "j" row values
                            %lines 39-41 pivot the P matrix symetrically to the U matrix
        
    
    for i=1:row-1 %the gauss elim only has to occure row-1 times
       
        i=i+(j-1); % this is needed to update the i value so that the function looks at the values in the next smallest square matrix 
        
        if i<row % prevent the gauss elimination from occuring too many times
            highervalue=U(i,j); %checks the value in the spcified row and column in U to check for pivoting against
            Ci=i; %the index of the row that needs to be multiplied by C
            if U(Ci,j)==0 % this accounts for the second row and on being 0 so that the function does not recall a 0 value
                Ci=Ci-1; % moves up the column until it finds a non-zero value
                highervalue=U(Ci,j);%redefies the highervalue with a non-zero value
            end
            lowervalue=U((i+1),j); %defines the lowervalue for gauss elim
            if highervalue~=0 || lowervalue~=0 %prevents division by 0 and if the matrix value is already 0 this tells the function that it can move on because elimination is not nessecary  
                C=lowervalue/highervalue; %the constant multiplied by the lower row
                U(i+1,:)=(U(i+1,:))-((C.*U(Ci,:))); %i and Ci are used in case Ci was change, but if it wasn't then i=Ci
                %this for loop performs the gauss elimination by updating
                %the lower row (according to gauss elim) while keeping the upper row the same
            end 
            L(i+1,j)=C; %redfines the L matrix based on the coefficeint used in gauss elimination
            if i+1>=row && row_index>row %prevents the L matrix from pivoting if the function reaches the bottom of the L matrix
                orig_L=L(i+1,j);%defines the original value of the "j" row and stores it/ (i+1) is needed to make sure that the 1s on the main diagonal are uneffected
                L(i+1,j)=L(row_index,j);%redifies the "j" row with the row with the max value (from the U matrix)
                L(row_index,j)=orig_L; %redifines the row with the max value with the origial "j" row values
                                        %lines 60-64 piviot the L matrix according to the U matrix
            end
        end
    end
end

% redefines all the variables
A=A;
L=L;
U=U;
P=P;

% not suppressing the variables outputs them into the workspace 
A

L

U

P

end
