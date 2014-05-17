% this m-file calculates the root of the given polynomial using 
% newton raphson technique. this m-file calls the functions in the two 
% m-files named as syn_division and derivate.
% INPUTS:
% A is the 1xn matrix containing the coefficients of the polynomial.
% p0 is the initial guess for the method.
% tol is the error tolerance.
% N is the numer of maximum iterations.
% OUTPUTS:
% failure is the convergence of the series. ( 0 for converge, 1 for not converge )
% root is the calculated root for the given polynomial.
% numiter is the number of iterations made for finding the root.
%
% Numerical Methods MATH259 - Assignment #2
%
% Bahaddin ARISOY   - 150110813
% Ahmet KAZAN       - 150110855
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [failure,root,numiter] = polyroot(A,p0,tol,N)
failure=0;
numiter=0;
% calculate the order of function.
order_fun=size(A,2);
root=0;
functionvalue=0; 
fprintf('N\tf(p)\t\t\t\tp (old)\t\t\t\tp (new)\n')
    % implement the newton-raphson method and compute the root,failure, and
    % numiter here.
    for no_roots=1:order_fun-2
        fun_root_new=p0;
        flag=1;
        % find the derivative of f(x).
        coeff_der_function=derivate(A);
        order_der_fun=size(coeff_der_function,2);
        while flag==1
            %old root = new root
            fun_root_old=fun_root_new;
            fx=0;
            dfx=0;
            nonzero=1;
            while nonzero==1
               powers=order_fun-1;
               % calculate the f(x) with the root here.
               for index=1:order_fun
                  fx=fx+A(index)*fun_root_old^powers;
                  powers=powers-1;
               end
                powers=order_der_fun-1;
                % calculate the derivative of f(x) with the root here.
                for index=1:order_der_fun
                    dfx=dfx+coeff_der_function(index)*fun_root_old^powers;
                    powers=powers-1;
                end
                % if the derivative of f(x) is equal to zero, the series
                % not converges.
                if dfx==0
                    failure=1;
                    fun_root_old=fun_root_old+1;
                else
                    nonzero=0;                
                end                
            end
            numiter = numiter + 1;
            % s[x+1] = s[x] - f(x) / f'(x)
            fun_root_new = fun_root_old - fx/dfx;
            fprintf('%d)\t%.12f\t\t%.12f\t\t%.12f',numiter,fx,fun_root_old,fun_root_new);
            fprintf('\n')
            % for plotting the series.
            series(numiter) = fun_root_new;
            % if max iteration has passed :
            if numiter >= N 
                flag=0;
            % if the error is less than tolerance, take the root and
            % calculate the f(x).
            elseif  abs(fun_root_new-fun_root_old)<=tol 
                flag=0;
                root(no_roots)=fun_root_new;
                functionvalue(no_roots)=fx;
            end
        end
        % synthetic division:
        %A=syn_division(A,fun_root_new);
    end
    % plot the series.
    plot(series);
    title('Bahaddin Arýsoy 150110813 - Ahmet Kazan 150110855  ///  Newton Raphson Method');
end
 