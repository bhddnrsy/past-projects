% This function applies the given filter (b) to given image (a)
% using convolution. All cells of the image multiplied with
% filter cells.
%
function c = filterbb (a,b)

% get array size of the image and filter
[ma, na] = size(a);
[mb, nb] = size(b);

% do the full convolution on given image and filter
c = zeros( ma+mb-1, na+nb-1 );
    for i = 1:mb
        for j = 1:nb
            r1 = i;
            r2 = r1 + ma - 1;
            c1 = j;
            c2 = c1 + na - 1;
            c(r1:r2,c1:c2) = c(r1:r2,c1:c2) + b(i,j) * a;
        end
    end

% Change the class of the output 
% (the filtering functions return double)
C = class(a);
c = cast(c, C);