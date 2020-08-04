clear all;
rng('shuffle')
KnownPercentage = 50; %Í¼ÏñÒÑÖª±ÈÀý

Image = imread('good_brother.jpg');
%imshow(Image);
%title('Original Image');
snapnow;
Image = double(Image); 
imSize = size(Image);
known = randperm(prod(imSize)/imSize(3), ...
    floor(KnownPercentage/100*(prod(imSize)/imSize(3))));
X = zeros(imSize);
X = double(ReplaceInd(X,known,Image,imSize));

imshow(uint8(X));
title('Corrupted Image');

   
            

