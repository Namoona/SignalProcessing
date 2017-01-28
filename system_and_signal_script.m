% this I has each pixcel value from 0 to 256. this is an array
I = imread('digital-images-week2_quizzes-lena.gif');
imshow(I);
imwrite(I,'new.png')

%read or crope specific part of an array
Iread = I(:,:);
Icrop = I(80:250,70:100);

% to scale the data within (0 to 1)
idouble = im2double(I);

%create filter of size 3 by 3 which 
%takes avarage of selected window

h3 = fspecial('average', [3,3]);
h5 = fspecial('average', [5,5]);

% apply above defined filter for image array in double
new3 = imfilter(idouble, h3, 'replicate');
new5 = imfilter(idouble, h5, 'replicate');



squarederror = (idouble - new3).^2;
mse3 = sum(sum(squarederror))/(256*256);
psnr3 = 10*log10(1/mse3);


squarederror = (idouble - new5).^2;
mse5 = sum(sum(squarederror))/(256*256);
psnr5 = 10*log10(1/mse5);
