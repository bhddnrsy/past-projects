% This functions takes an image as argument 
% and applies contrast enhancement with
% using the formula given in course.
%
function T_filt_img = contrast_enhance(image)

% find the min and max values in image
minVal = min(min(image)); 
maxVal = max(max(image));

sizeVal = size(image);

% apply contrast with given formula in the course
for i=1:sizeVal(1)
    for j=1:sizeVal(2)
        temp = ((255/(maxVal-minVal))*image(i,j))-((255*minVal)/(maxVal-minVal));
        T_filt_img(i,j) = sum(temp(:));
    end
end


