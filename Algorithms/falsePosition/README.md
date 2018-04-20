# Function Definition
This falsePosition function is used to approximate the root of a
function. The criteria for a "close-enough" root is determined by the
approximate error (ea) or the number of iterations (maxiter)

## Inputs:
*   func - the function being evaluated (the function should be manipulated
       by user to have the roots be the answer to the function)
       Input your function in the format "@(x) (function)"
          ex) if your function is x^2 + 1, input it as "@(x) (x^2 + 1)"
*   xl - the lower guess
*   xu - the upper guess
*   es - the desired relative error (should default to 0.0001%)
*   maxiter - the max number of iterations desired (should default to 200)
## Outputs:
*   root - the estimated root location
*   fx - the function evaluated at the root location
*   ea - the approximate relative error (%)
*   iter - how many iterations were performed
