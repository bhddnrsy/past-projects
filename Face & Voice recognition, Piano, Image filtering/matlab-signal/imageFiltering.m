function [] = imageFiltering(orimg)

A = imread(orimg,'jpeg'); % read the original image

imGray = rgb2gray(A); % convert to gray
%figure,imshow(imGray),title('Gray');

s = size(imGray);

for i=1:s(1) % black & white
    for j=1:s(2)
        if imGray(i,j) > 100
            imBnV(i,j) = 0;
        else
            imBnV(i,j) = 255;
        end
    end
end

figure,imshow(imBnV),title('Black & White');

%---------------------

FB = [1,2,1;0,0,0;-1,-2,-1];  % filter for B
filteredB = filterbb(imBnV, FB);

FC = [-1,0,1;-2,0,2;-1,0,1];  % filter for C
filteredC = filterbb(imBnV, FC);

%figure, imshow(filteredB),title('B');
%figure, imshow(filteredB),title('C');

filteredB_c = contrast_enhance(filteredB); % apply contrast enhancement
figure, imshow(filteredB_c),title('contrast enhanced - B');

filteredC_c = contrast_enhance(filteredC); % apply contrast enhancement
figure, imshow(filteredC_c),title('contrast enhanced - C');

%---------------------

D = (filteredB ./ filteredC); % arctan(B/C)
arcD = atan(double(D));
arcD_c = contrast_enhance(arcD); % apply contrast enhancement
figure, imshow(arcD_c),title('arctan(B/C)');

%---------------------

E = sqrt(filteredB.^2+filteredC.^2); % sqrt(B^2 + C^2)
E_c = contrast_enhance(E); % apply contrast enhancement
figure, imshow(E_c),title('sqrt(B^2+C^2)');

%---------------------

% alpha filters
a(1)=0.1;
a(2)=0.3;
a(3)=0.9;

for i=1:3
    temp = [a(i),a(i),a(i) ; a(i),(1-8.*a(i)),a(i) ; a(i),a(i),a(i)];
    tempfilter = (1./(1-9.*a(i))).*temp;
    tempfiltered = filterbb(imBnV, tempfilter);
    figure, imshow(tempfiltered),title(['Last Filter, alpha=',num2str(a(i)),'']);
end


end