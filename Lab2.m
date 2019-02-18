% Image analysis
% Lab 1

%/Users/binhnguyen/Documents/MATLAB/School/BME872/Lab 1
addpath ('/Users/binhnguyen/Desktop/School/BME 872/Labs/Lab 1/All medical images.html/All medical images/Image_Database/Image_Database_1/X-ray Mammography');
%Mammography images

addpath ('/Users/binhnguyen/Desktop/School/BME 872/Labs/Lab 1/All medical images.html/All medical images/Image_Database/Image_Database_2-3/Brain_Images/PT-1/T1W-1');
% ______

addpath ('/Users/binhnguyen/Desktop/School/BME 872/Labs/Lab 1/All medical images.html/All medical images/Image_Database/Image_Database_2-3/Brain_Images/PT-1/CT-1');
%Brain Images

addpath ('/Users/binhnguyen/Desktop/School/BME 872/Labs/Lab 1/All medical images.html/All medical images/Image_Database/Image_Database_4/CT_Full_Body/');
%CT Full body

addpath ('/Users/binhnguyen/Desktop/School/BME 872/Labs/Lab 1/All medical images.html/All medical images/Image_Database/Image_Database_4/PET_Full_Body/');
%PET Full body

%% Part 1
% picA = imread('PSWebImageBitMap0023.bmp');
picA = imread ('Mammo CC P1.tif');
picA = rgb2gray (picA);

% Median Filter
%median_filter = medfilt2 (picA);
median_filter = MedianMask(picA);


% Average Weight Filter
mask = (1/16)*[1 2 1;2 4 2; 1 2 1];
weighted_filter = WeightAvgMask (picA, mask);


%% Part 2
% Histogram Equalizer
% picB = imread ('0013.bmp');
picB = imread ('Mammo CC P1.tif');
picB = rgb2gray(picB);
% picB = picA;


figure;
subplot (2,1,1);
imhist (picB);
title ('Histogram of the image');
subplot (2,1,2);
imhist (histeq(picB));
title ('Histogram Equalizaer of the image');
saveas (gcf, 'histogram.png');


% Sobel Operator
[Gmag,Gdir] = imgradient(picB);
figure
subplot (2,1,1);
imshow(Gmag, []), title('Gradient magnitude')
subplot (2,1,2);
imshow(Gdir, []), title('Gradient direction')
saveas (gcf, 'sobel.png');


% Laplacien
alpha =0.2;
h = fspecial('laplacian', alpha);
f = imfilter(picB,h,'replicate'); 
imshow(f);
title('Laplcian Results')

saveas (gcf, 'laplacien.png');


% Local histogram equalizer 
loc = @(block_struct) histeq(block_struct.data);
loc_im = blockproc(picB, [20, 20], loc);

figure;
imshow(loc_im);
title('Local Histogram Equalizer with [20, 20]')
saveas (gcf, 'lochist.png');

%% Part 3 
lpf = fspecial('gaussian');
allfit = [0 0 0;0 1 0;0 0 0];
fil = allfit - lpf;
hpf = imfilter(picB,fil); 

figure;
imshow (hpf,[]);
saveas (gcf, 'hpf.png');