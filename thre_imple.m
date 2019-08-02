function [out] = thre_imple(I)
%%%%%%This function uses the threshold value obtained from auto-
%thresholding and converts the image into binary image%%%%%%%%%%%
val_ther = auto_threshold(I);
I_org = imread(I);
[q,r ,dim_i] = size(I_org);
if dim_i ==3
    I_grey = rgb2gray(I_org);
else 
    I_grey = I_org;
end
I_bin = zeros(size(I_grey));
[row, col] = size(I_grey);
for x=1:row
    for y = 1:col
        if I_grey(x,y) > val_ther
            I_bin(x,y) = 1; 
        else
            I_bin(x,y) = 0;
        end
        
    end
end

out = I_bin;

end
