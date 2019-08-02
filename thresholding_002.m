clc
close all
I = imread('2.bmp');
I_gray = rgb2gray(I);
% figure
% imshow(I_gray);
% imhist(I_gray)

%if threshold with autothreshold value = 54.1751
[row col] = size(I_gray);
img_2 = zeros(size(I_gray));
for x = 1:row
    for y = 1:col
        if I_gray(x,y) >= 210
            img_2(x,y) = 1;
        else 
            img_2(x,y) = 0;
        end
           
    end

end
imshow(img_2)
