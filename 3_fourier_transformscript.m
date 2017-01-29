



% step 1 :-----------------------------------------------------------
% The original image is an 8-bit gray-scale image of
% width 479 and height 359 pixels. Convert the original
% image from type 'uint8' (8-bit integer) to 'double' (real number)

I = imread('digital-images-week3_quizzes-original_quiz.jpg');
idouble = im2double(I);




% step 2: LPF ------------------------------------------------
% Create a 3×3 low-pass filter with all 
% coefficients equal to 1/9. Perform low-pass filtering
% with this filter using the MATLAB function "imfilter" 
% with 'replicate' as the third argument

h3 = [1/9,1/9,1/9;1/9,1/9,1/9;1/9,1/9,1/9];
resultLowPass = imfilter(idouble, h3, 'replicate');





% step 3: Downsampling--------------------------------
% Obtain the down-sampled image by removing every other row 
% and column from the filtered image, that is, removing the 2nd,
% 4th, all the way to the 358th row, and then removing the 2nd, 4th, 
% all the way to the 478th column. The resulting image should be of 
% width 240 and height 180 pixles. This completes the procedure 
% for image down-sampling. In the next steps, you will up-sample
% this low-resolution image to the original resolution
% via spatial domain processing.

downsampled = resultLowPass(1:2:end, 1:2:end);




% step 4: Upsampling-----------------------------
% Create an all-zero MATLAB array of width 479 and height 359.

padding(1:359,1:479) = 0.0;
% For every odd-valued i∈[1,359] and odd-valued j∈[1,479], 
% set the value of the newly created array at (i,j) equal 
% to the value of the low-resolution image at ((i+1)/2,(j+1)/2).
% After this step you have inserted zeros into the low-resolution image.

padding(1:2:end,1:2:end) = downsampled(1:end,1:end);



% step 5: Convolution -------------------------------------
% Convolve the result obtained from step (4) with a filter 
% with coefficients [0.25,0.5,0.25;0.5,1,0.5;0.25,0.5,0.25] 
% using the MATLAB function "imfilter". In this step you should
% only provide "imfilter" with two arguments instead of three,
% that was the case in step (1). The two arguments are the 
% result from step (4) and the filter specified in this step.
% This step essentially performs bilinear interpolation to 
% obtain the up-sampled image.

filter = [0.25,0.5,0.25;0.5,1,0.5;0.25,0.5,0.25];
upsampled = imfilter(padding, filter);




% step 6:-------------------------------------------------------
% Compute the PSNR between the upsampled image obtained from 
% step (5) and the original image. For more information about
% PSNR, refer to the programming problem in the homework of module 2
squarederror = (idouble - upsampled).^2;
mse = sum(sum(squarederror))/(359*479);
psnr = 10*log10(1/mse);



disp(mse);
disp(psnr);
% psnr = 28.1753

