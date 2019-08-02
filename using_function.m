%%%%%%%%%%%%%%showing the image%%%%%%%%%%%%%%%%%%% 

clc
close all
clear all


%Give the 1st input for the image
I = input('Enter first image\n', 's');
y = thre_imple(I);

%give the 2nd input for image
I2 = input('Enter the second image\n', 's');
y2 = thre_imple(I2);


%plotting the images
figure
subplot(2,2,1), imshow(y)
subplot(2,2,2), imshow(y2)