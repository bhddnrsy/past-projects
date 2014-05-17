function [singular,x] = mygauss(A, b)
% Scaled column pivoting with Gaussian elimination.
% syntax: [singular,x] = mygauss(A,b)
% A is the n by n matrix 
% b is the right hand side vector 
% x is the solution (column vector)
% singular is whether the matrix A is non-singular(0) or singular(1)

% to perform x=A\b , use 'mldivide(A,b)'

singular=0;
[m,n] = size(A);
if m ~= n
    singular=1;
   %error('Matrix is not square');
end

% First compute scale factors scale[1] to scale[n]
% for each row

scale = zeros(1,n);
for i = 1 : n
   smax = 0;
   for j = 1 : n
      w = abs(A(i,j));
      if w > smax
         smax = w;
      end
   end
   if smax == 0
       singular=1;
      %error('matrix is singular');
   end
   scale(i) = smax;
end

% forward elimination

% loop over pivot positions (diagonal elements)
for k = 1 : n-1
   
   % Find maximal element A(p,k) in absolute value
   % among the entries A(k,k) to A(n,k) at or below
   % it in column k
   
   p = k;
   amax = 0;
   for i = k : n
      w = abs(A(i,k)/scale(i));
      if w > amax;
         amax = w;
         p = i;
      end
   end
   
   % if we didn't find a non-zero pivot then
   % the matrix is singular
   
   if amax == 0
       singular=1;
      %error('Matrix is singular');
   end
   
   % if we found a non-zero pivot in row p then exchange
   % pivot row k with row p
   
   if p > k
      for j = 1 : n
         temp = A(k,j);
         A(k,j) = A(p,j);
         A(p,j) = temp;
      end
      
      % exchange the scale factors
      
      temp = scale(k);
      scale(k) = scale(p);
      scale(p) = temp;
      
      % exchange elements in rhs vector
      
      temp = b(k);
      b(k) = b(p);
      b(p) = temp;
   end
   
   
   % loop down pivot column k beginning below pivot
   for i = k+1 : n
      
      % calculate multiplier for row i
      % and subtract multiple of row k from row i
      mult = A(i,k) / A(k,k);
      for j = 1 : n
         A(i,j) = A(i,j) - mult*A(k,j);
      end
      
      % do the same for the right hand side vector
      b(i) = b(i) - mult*b(k);
   end
end

% Back substitution beginning with last unknown x(n)
% and proceding backward until x(1) is found

x = zeros(n,1);
x(n) = b(n) / A(n,n);
for i = n-1 : -1 : 1;
   % compute unknown x(i) in terms of x(i+1) to x(n)
   s = b(i);
   for j = i+1 : n
      s = s - A(i,j)*x(j);
   end
   x(i) = s / A(i,i);
end

end % of mygauss


