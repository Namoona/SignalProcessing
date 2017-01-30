% step -1 ---------------------------------
% Load the noisy image into a MATLAB array and convert the
% type of the array from 8-bit integer 'uint8' to real number 
%'double'. Visualize the noisy image using the built-in  
% MATLAB function "imshow".The function "imshow" takes as 
% its argument either [0-255] for an 8-bit integer array  
% (i.e., of type 'uint8'), or [0-1] for a normalized real-valued 
% array  (i.e., of type 'double'). To provide "imshow"
% with the correct argument, you would need either 
% to "cast" your real-valued array into 'uint8', or 
% normalize it by 255.

im1 = imread('digital-images-week5_quizzes-noisy.jpg');
I1 = im2double(im1);



% step - 2
% Perform 3x3 median filtering using the built-in MATLAB 
% function "medfilt2". For this problem, the only argument 
% you need to provide "medfilt2" with is the array you
% have created in step (1). Visualize the filtered image
% using "imshow". Remember to either cast the result to 
% 'uint8' or normalize it before feeding it to "imshow".

imgfil1 = medfilt2(I1);
%imgshow(imgfil1);



% step - 3
% Perform a second-pass median filtering on the filtered 
% image that you have obtained from step (2). Visualize the
% two-pass filtered image. Compare it with the noisy input
% image and the 1-pass filtered image.

imgfil2 = medfilt2(imgfil1);
%imgshow(imgfil2);


im2 = imread('digital-images-week5_quizzes-original.jpg');
I2 = im2double(im2);
%imshow(I2)


[h,w] = size(I2);


% Compute the PSNR value between the noise-free image and the
% noisy input image in the box below (up to two decimal points).
% a
mse = sum(sum(power(I1-I2,2)))/(h*w);
a = 10*log10(1/mse);




% computePSNR value between the noise-free image and the 1-pass 
% filtering output in the box below (up to two decimal points).
% b
mse = sum(sum(power(imgfil1-I2,2)))/(h*w);
b = 10*log10(1/mse);




% Enter the PSNR value between the noise-free image and the 2-pass
% filtering output in the box below (up to two decimal points).
%c
mse = sum(sum(power(imgfil2-I2,2)))/(h*w);
c = 10*log10(1/mse);






