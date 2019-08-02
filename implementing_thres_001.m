clc
close all
I = imread('peppers.png');
I2 = imread('moon.tif');
%original image of moon 
figure
subplot(1,4,1), imshow(I)
title('original image');

% After red segmentation
i = I(:,:,1);
BW = imbinarize(i,'adaptive');
subplot(1,4,2), imshow(BW)
title('after red plane segmentaiton'); 

%image after blue plan segmentation
i2 = I(:,:,2);
BW2 = imbinarize(i2, 'adaptive');
subplot(1,4,3), imshow(BW2);
title('After blue plane segmentation');

i3 = I(:,:,3);
BW3 = imbinarize(i3, 'adaptive');
subplot(1,4,4), imshow(BW3);
title('after green plane segmentation');

%if threshold with autothreshold value = 54.1751
BW4 = imbinarize(i3, 54.1751);
figure
imshow(BW4);
title('Auto threshold value = 54.1751 after removing green plane');