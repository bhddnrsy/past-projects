% This m-file calculates the derivative of the function, the limitation of
% this function is, it can calculate only the derivatives of power(x,n)....
% INPUTS:
% coeff_function is the given A.
% OUTPUTS:
% coeff_derivative is the array with A's coefficients which is derivated.
%
% Numerical Methods MATH259 - Assignment #2
%
% Bahaddin ARISOY   - 150110813
% Ahmet KAZAN       - 150110855
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function coeff_derivative=derivate(coeff_function)
der_order=size((coeff_function),2)-1;
coeff_derivative=0;
% function calculates the derivative of the function here.
for index=1:size((coeff_function),2)-1
    coeff_derivative(index)=der_order*coeff_function(index);
    der_order=der_order-1;
end