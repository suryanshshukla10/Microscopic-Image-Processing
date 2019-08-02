function [thre] = auto_threshold(I)
%auto thresholding for convering to gray image
clc 
close all

%%%%%%%%%%%%%%%%%This code is a little manuplation of original work while algorithm is same%%%%%%%
%  Reference: [1]. T. W. Ridler, S. Calvard, Picture thresholding using an iterative selection method, 
%            IEEE Trans. System, Man and Cybernetics, SMC-8, pp. 630-632, 1978.
%            [2]. Dhanesh Ramachandram, Automatic Thresholding. Available online at: http://www.mathworks.com/matlabcentral/fileexchange/loadFile.do?objectId=3195&objectType=file
%This program was originally written by jing Tian during Mar 2006, during
%his postgraduate studies in singapore. 
% I am very thankful for him for providing this as open source. His work
% saved a lot of time. Once again thankyou to Jing Tianaduate studying in Singapore.
%%%%Contact: suryansh shukla%%%%%%%%%%%%%%%%%%%%%%%




I = imread(I);
[a,b,dim_img] = size(I);
if dim_img ==3
    I = rgb2gray(I);
else 
    I = I;
end


I = double(I(:));
% STEP 1: Compute mean intensity of image from histogram, set T(1) = mean(I)
[counts, N] = hist(I, 256);
i = 1;
mu1 = cumsum(counts);
T(i) = (sum(N.*counts)) / mu1(end);
% disp('Result of T(i) is ');
% disp(T(i));
% STEP 2: compute the sample mean of the data classified by the above threshold
mu2 = cumsum(counts(N<=T(i)));
MBT = sum(N(N<=T(i)).*counts(N<=T(i)))/mu2(end);
mu3 = cumsum(counts(N>T(i)));
MAT = sum(N(N>T(i)).*counts(N>T(i)))/mu3(end);
i=i+1;
% new T = (MAT+MBT)/2
T(i) = (MAT+MBT)/2;
% STEP 3 repeat step 2 while T(i)~=T(i-1)
thre = T(i);
while abs(T(i)-T(i-1))>=1
    mu2 = cumsum(counts(N<=T(i)));
    MBT = sum(N(N<=T(i)).*counts(N<=T(i)))/mu2(end);
    
    mu3 = cumsum(counts(N>T(i)));
    MAT = sum(N(N>T(i)).*counts(N>T(i)))/mu3(end);
    
    i=i+1;
    T(i) = (MAT+MBT)/2; 
    thre = T(i);
end
end

