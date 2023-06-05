%
% median filter test script
%

I = imread('cameraman.tif');
%I = imread('house_flat.tif')
I = imresize(I,0.5);
I = imnoise(I,'salt & pepper',0.02);

M1 = median_filter(I,3,3);
M2 = median_filter(I,6,6);
M3 = median_filter(I,1,10);

figure(66);
colormap(gray);
subplot(2,2,1);
imagesc(I); title('Input Image');
subplot(2,2,2);
imagesc(M1); title('Median [3 3]');
subplot(2,2,3);
imagesc(M2); title('Median [6 6]');
subplot(2,2,4);
imagesc(M3); title('Median [1 10]');

drawnow;
%-----------------------------------------------------
% Sample Input 2
I2 = imread('school.jpg');
I2 = im2gray(I2);
I2 = imresize(I2,0.5);
I2 = imnoise(I2,'salt & pepper',0.8);

M1 = median_filter(I2,3,3);
M2 = median_filter(I2,6,6);
M3 = median_filter(I2,1,10);

figure(67);
colormap(gray);
subplot(2,2,1);
imagesc(I2); title('Input Image');
subplot(2,2,2);
imagesc(M1); title('Median [3 3]');
subplot(2,2,3);
imagesc(M2); title('Median [6 6]');
subplot(2,2,4);
imagesc(M3); title('Median [1 10]');

drawnow;

%-----------------------------------------------------
% Sample Input 3
I3 = imread('me.jpg');
I3 = im2gray(I3);
I3 = imresize(I3,0.5);
I3 = imnoise(I3,'salt & pepper',0.02);

M1 = median_filter(I3,3,3);
M2 = median_filter(I3,1,1);
M3 = median_filter(I3,1,10);

figure(68);
colormap(gray);
subplot(2,2,1);
imagesc(I3); title('Input Image');
subplot(2,2,2);
imagesc(M1); title('Median [3 3]');
subplot(2,2,3);
imagesc(M2); title('Median [1 1]');
subplot(2,2,4);
imagesc(M3); title('Median [1 10]');

drawnow;

%-----------------------------------------------------
% Sample Input 4
I3 = imread('zyra.jpg');
%imshow(I3)
I3 = im2gray(I3);
I3 = imresize(I3,0.5);
I3 = imnoise(I3,"gaussian", 0.02);


M1 = median_filter(I3,3,3);
M2 = median_filter(I3,5,5);
M3 = median_filter(I3,10,10);

figure(69); %nice
colormap(gray);
subplot(2,2,1);
imagesc(I3); title('Input Image');
subplot(2,2,2);
imagesc(M1); title('Median [3 3]');
subplot(2,2,3);
imagesc(M2); title('Median [5 5]');
subplot(2,2,4);
imagesc(M3); title('Median [10 10]');

drawnow;
%-----------------------------------------------------
% Sample Input 5
I3 = imread('zyra.jpg');
%imshow(I3)
I3 = im2gray(I3);
I3 = imresize(I3,0.5);
I3 = imnoise(I3,"speckle");


M1 = median_filter(I3,3,3);
M2 = median_filter(I3,6,6);
M3 = median_filter(I3,1,10);

figure(70); %nice
colormap(gray);
subplot(2,2,1);
imagesc(I3); title('Input Image');
subplot(2,2,2);
imagesc(M1); title('Median [3 3]');
subplot(2,2,3);
imagesc(M2); title('Median [6 6]');
subplot(2,2,4);
imagesc(M3); title('Median [1 10]');

drawnow;