
% test image
I = imread('gantrycrane.png');
%I =imread('pout.tif');
%I = imread('peppers.png');

% force into single channel, greyscale 0..1
if (size(I,3)==3)
  I=rgb2gray(I);
end
I = im2double(I);

% add noise
Inoisy = imnoise(I,'gaussian',0,0.002);

N=5;

% start plotting
figure(99);
subplot(2,2,1);
imagesc(I); cax=caxis;
title('Noise Free image');
subplot(2,2,2);
imagesc(Inoisy); caxis(cax);
title('Noisy Image');
B = conv2(I,ones(N,N)/(N*N),'same');
subplot(2,2,3);
imagesc(B); caxis(cax);
title('Blurred Image');

% run smart blur
Ismart = smart_blur(Inoisy,N,0.02);

% finish plotting
figure(99);
subplot(2,2,4);
imagesc(Ismart); caxis(cax);

title('Smart Blur (N=5,t=0.02)');

colormap(gray(256));
drawnow
%---------------------------------------------------------
% Test input 2
I2 = imread('A1_code\lift_toodark.tif');
if (size(I2,3)==3)
  I2=rgb2gray(I2);
end
I2 = im2double(I2);
N = 5;
% add noise
I2noisy = imnoise(I2,'gaussian',0,0.02);

% start plotting
figure(100);
subplot(2,2,1);
imagesc(I2); cax=caxis;
title('Noise Free image');
subplot(2,2,2);
imagesc(I2noisy); caxis(cax);
title('Noisy Image');
B = conv2(I2,ones(N,N)/(N*N),'same');
subplot(2,2,3);
imagesc(B); caxis(cax);
title('Blurred Image');

% run smart blur
I2smart = smart_blur(I2noisy,N,0.002);

% finish plotting
figure(100);
subplot(2,2,4);
imagesc(I2smart); caxis(cax);

title('Smart Blur (N=5,t=0.02)');

colormap(gray(256));
drawnow



