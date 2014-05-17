function [] = faceRecognition(orimg)

imgI = imread(orimg,'jpeg'); % read the original image
imgT = imread('T1.JPG','jpeg');
imgIGray = rgb2gray(imgI); % convert to gray
imgTGray = rgb2gray(imgT); % convert to gray
%figure,imshow(imGray),title('Gray');

sI = size(imgIGray);
m = sI(1);
n = sI(2);
sT = size(imgTGray);
p = sT(1);
q = sT(2);
%corr(1,1)=zeros;

for i=1:m-p % black & white
    for j=1:n-q
        corr(i,j) = correlate(imgTGray,imgIGray(i:i+p-1 , j:j+q-1));
        print(corr(i,j));
    end
end
