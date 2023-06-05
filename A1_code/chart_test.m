%
% A simple TEST for colorchart code
%

truecard = imread('color_testchart.jpg');
RGB_truechart = get_chart_values(truecard);
%RGB_truechart
trueimage = imread('color_toys.jpg');   %<-- you can change this if you like

% -------------------------------------------------------------------------
% test example 1 - reduce all red tones by 50% (cyan colored)
badimage = trueimage;
badimage(:,:,1) = 0.5*badimage(:,:,1);
badtestcard = truecard;
badtestcard(:,:,1) = 0.5*badtestcard(:,:,1);

RGB_badchart = get_chart_values(badtestcard);
%RGB_badchart
RGB_map = chart_correction(RGB_truechart,RGB_badchart);
%RGB_map
fixedcard = apply_rgb_map(badtestcard,RGB_map);
%fixedcard
fixedimage = apply_rgb_map(badimage,RGB_map);
%fixedimage

figure
subplot(2,3,1); image(truecard);title('Reference Card');
subplot(2,3,2); image(badtestcard);title('Bad Card');
subplot(2,3,3); image(fixedcard);title('Fixed Card');
subplot(2,3,4); image(trueimage);title('Reference Image');
subplot(2,3,5); image(badimage);title('Bad Image');
subplot(2,3,6); image(fixedimage);title('Fixed Image');

% -------------------------------------------------------------------------
 %test example 2 - reduce min max range and skew colors too (coffee
 %colored)
 badimage = trueimage;
 badimage(:,:,1) = 0.5*badimage(:,:,1);
 badimage(:,:,3) = 0.7*badimage(:,:,3);
 badimage = 0.5*badimage + 32;
 badtestcard = truecard;
 badtestcard(:,:,1) = 0.5*badtestcard(:,:,1);
 badtestcard(:,:,3) = 0.7*badtestcard(:,:,3);
 badtestcard = 0.5*badtestcard + 32;
 
 RGB_badchart = get_chart_values(badtestcard);
 RGB_map = chart_correction(RGB_truechart,RGB_badchart);
 fixedcard = apply_rgb_map(badtestcard,RGB_map);
 fixedimage = apply_rgb_map(badimage,RGB_map);
 
 figure
 subplot(2,3,1); image(truecard);title('Reference Card');
 subplot(2,3,2); image(badtestcard);title('Bad Card');
 subplot(2,3,3); image(fixedcard);title('Fixed Card');
 
 subplot(2,3,4); image(trueimage);title('Reference Image');
 subplot(2,3,5); image(badimage);title('Bad Image');
 subplot(2,3,6); image(fixedimage);title('Fixed Image');
%--------------------------------------------------------------------------
 %test example 3 - Invert the image

 trueimage = imread('rainbow.jpg');

 badimage = trueimage;
 badimage = 255 - badimage;
 badtestcard = truecard;
 badtestcard = 255 - badtestcard;
 
 RGB_badchart = get_chart_values(badtestcard);
 %RGB_badchart
 RGB_map = chart_correction(RGB_truechart,RGB_badchart);
 %RGB_map
 fixedcard = apply_rgb_map(badtestcard,RGB_map);
 fixedimage = apply_rgb_map(badimage,RGB_map);
 
 figure
 subplot(2,3,1); image(truecard);title('Reference Card');
 subplot(2,3,2); image(badtestcard);title('Bad Card');
 subplot(2,3,3); image(fixedcard);title('Fixed Card');
 
 subplot(2,3,4); image(trueimage);title('Reference Image');
 subplot(2,3,5); image(badimage);title('Bad Image');
 subplot(2,3,6); image(fixedimage);title('Fixed Image');
 %------------------------------------------------------------
 %test example 4 - Pure white image converted to mostly dark color

 trueimage = imread('white.jpg');

 badimage = trueimage;
 badimage(:,:,1) = 0.1*badimage(:,:,1);
 badimage(:,:,2) = 0.1*badimage(:,:,2);
 badimage(:,:,3) = 0.1*badimage(:,:,3);
 badtestcard = truecard;
 badtestcard(:,:,1) = 0.1*badtestcard(:,:,1);
 badtestcard(:,:,2) = 0.1*badtestcard(:,:,2);
 badtestcard(:,:,3) = 0.1*badtestcard(:,:,3);
 
 RGB_badchart = get_chart_values(badtestcard);
 %RGB_badchart
 RGB_map = chart_correction(RGB_truechart,RGB_badchart);
 %RGB_map
 fixedcard = apply_rgb_map(badtestcard,RGB_map);
 fixedimage = apply_rgb_map(badimage,RGB_map);
 
 figure
 subplot(2,3,1); image(truecard);title('Reference Card');
 subplot(2,3,2); image(badtestcard);title('Bad Card');
 subplot(2,3,3); image(fixedcard);title('Fixed Card');
 
 subplot(2,3,4); image(trueimage);title('Reference Image');
 subplot(2,3,5); image(badimage);title('Bad Image');
 subplot(2,3,6); image(fixedimage);title('Fixed Image');
 %------------------------------------------------------------------------
 %test example 5 - Use 0.0 when converting the true image into a bad image

 trueimage = imread('shapes.png');

 badimage = trueimage;
 badimage(:,:,1) = 0.1*badimage(:,:,1);
 badimage(:,:,2) = 0.1*badimage(:,:,2);
 badimage(:,:,3) = 0.1*badimage(:,:,3);
 badtestcard = truecard;
 badtestcard(:,:,1) = 0.1*badtestcard(:,:,1);
 badtestcard(:,:,2) = 0.1*badtestcard(:,:,2);
 badtestcard(:,:,3) = 0.1*badtestcard(:,:,3);
 
 RGB_badchart = get_chart_values(badtestcard);
 %RGB_badchart
 RGB_map = chart_correction(RGB_truechart,RGB_badchart);
 %RGB_map
 fixedcard = apply_rgb_map(badtestcard,RGB_map);
 fixedimage = apply_rgb_map(badimage,RGB_map);
 
 figure
 subplot(2,3,1); image(truecard);title('Reference Card');
 subplot(2,3,2); image(badtestcard);title('Bad Card');
 subplot(2,3,3); image(fixedcard);title('Fixed Card');
 
 subplot(2,3,4); image(trueimage);title('Reference Image');
 subplot(2,3,5); image(badimage);title('Bad Image');
 subplot(2,3,6); image(fixedimage);title('Fixed Image');

 %------------------------------------------------------------------------
 %test example 6 - Use 0.0 when converting the true image into a bad image

 trueimage = imread('me.jpg');

 badimage = trueimage;
 badimage(:,:,1) = 10*badimage(:,:,1);
 badimage(:,:,2) = 10*badimage(:,:,2);
 badimage(:,:,3) = 10*badimage(:,:,3);
 badtestcard = truecard;
 badtestcard(:,:,1) = 10*badtestcard(:,:,1);
 badtestcard(:,:,2) = 10*badtestcard(:,:,2);
 badtestcard(:,:,3) = 10*badtestcard(:,:,3);
 
 RGB_badchart = get_chart_values(badtestcard);
 %RGB_badchart
 RGB_map = chart_correction(RGB_truechart,RGB_badchart);
 %RGB_map
 fixedcard = apply_rgb_map(badtestcard,RGB_map);
 fixedimage = apply_rgb_map(badimage,RGB_map);
 
 figure
 subplot(2,3,1); image(truecard);title('Reference Card');
 subplot(2,3,2); image(badtestcard);title('Bad Card');
 subplot(2,3,3); image(fixedcard);title('Fixed Card');
 
 subplot(2,3,4); image(trueimage);title('Reference Image');
 subplot(2,3,5); image(badimage);title('Bad Image');
 subplot(2,3,6); image(fixedimage);title('Fixed Image');
