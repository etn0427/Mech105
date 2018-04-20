# Funtion Definition
This function determins the L, U, and P matrices found from LU
factorization. It piviots the A matrix and performs Gauss elimination, in
order to correctly set up the problem. The function also records the
coeffeicnts used in the Gauss elim, and keeps track of how the U matrix
was pivoted. Ultimately, it ensures that A*P=L*U.

## INPUTS
    A = coefficient matrix
    make sure to define A in the command window prior to recalling it
    in the luFactor function

## OUTPUTS
    L = lower triangular matrix
    U = upper triangular matrix
    P = the pivot matrix
    
## Instructions
type luFactor(A) into the command window
