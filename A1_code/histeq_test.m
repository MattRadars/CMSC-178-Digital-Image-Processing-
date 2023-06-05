%
% EXAMPLE CODE FOR TESTING YOUR SOLUTIONS
%

% TRY DIFFERENT IMAGES AND CONTRAST CHNAGES FOR YOUR OWN TESTING
I1 = imread('vintage_postcard.tif');
%I1 = imread('pout.tif');
%I1 = imread('office_5.jpg'); I1=I1(:,:,2);
%I1 = imread('office_1.jpg'); I1=I1(:,:,2);
%I1 = imread('low_light.tif');
I1=im2double(I1);

% damage contrast
I1=0.8*I1;

I1eq = histeq_contrast(I1);

figure
subplot(1,2,1);
imagesc(I1); caxis([0 1]); title('Test Image 1'); axis equal tight
subplot(1,2,2);
imagesc(I1eq); caxis([0 1]); title('Histeq Result');  axis equal tight
colormap(gray);

figure
subplot(2,2,1);
histogram(I1);
subplot(2,2,2);
histogram(I1eq);

fprintf(1,'Min/max of input image  1: %3.3f %3.3f\n', min(I1(:)),max(I1(:)) );
fprintf(1,'Min/max of output image 1: %3.3f %3.3f\n', min(I1eq(:)),max(I1eq(:)) );

% damage contrast
% I2 = I1*0.25 %+ 0.25;
% 
% I2eq = histeq_contrast(I2);
% figure
% subplot(1,2,1);
% imagesc(I2); caxis([0 1]); title('Test Image 2');  axis equal tight
% subplot(1,2,2);
% imagesc(I2eq); caxis([0 1]); title('Histeq Result');  axis equal tight
% colormap(gray);
% 
% fprintf(1,'Min/max of input image  2: %3.3f %3.3f\n', min(I2(:)),max(I2(:)) );
% fprintf(1,'Min/max of output image 2: %3.3f %3.3f\n', min(I2eq(:)),max(I2eq(:)) );

% figure(2)
% subplot(2,2,1);
% histogram(I2);
% subplot(2,2,2);
% histogram(I2eq);

% Test image 2
I2 = imread('balloons.jpg');
I2 = im2gray(I2);
I2 = im2double(I2);
% damage contrast
I2=0.5*I2;

I2eq = histeq_contrast(I2);

figure
subplot(1,2,1);
imagesc(I2); caxis([0 1]); title('Test Image 2'); axis equal tight
subplot(1,2,2);
imagesc(I2eq); caxis([0 1]); title('Histeq Result');  axis equal tight
colormap(gray);

figure
subplot(2,2,1);
histogram(I2);
subplot(2,2,2);
histogram(I2eq);

fprintf(1,'Min/max of input image  2: %3.3f %3.3f\n', min(I2(:)),max(I2(:)) );
fprintf(1,'Min/max of output image 2: %3.3f %3.3f\n', min(I2eq(:)),max(I2eq(:)) );


% Test image 3
I3 = imread('btw_sunflower.jpg');
I3 = im2gray(I3);
I3 = im2double(I3);
% damage contrast
I3=2.5*I3;

I3eq = histeq_contrast(I3);

figure
subplot(1,2,1);
imagesc(I3); caxis([0 1]); title('Test Image 3'); axis equal tight
subplot(1,2,2);
imagesc(I3eq); caxis([0 1]); title('Histeq Result');  axis equal tight
colormap(gray);

figure
subplot(3,2,1);
histogram(I3);
subplot(3,2,2);
histogram(I3eq);

fprintf(1,'Min/max of input image  3: %3.3f %3.3f\n', min(I3(:)),max(I3(:)) );
fprintf(1,'Min/max of output image 3: %3.3f %3.3f\n', min(I3eq(:)),max(I3eq(:)) );

