% HISTEQ_CONTRAST - histogram equalisation for contrast enhancement
%
% Usage:
%         eq_img = histeq_contrast(img)
%
%  input image data is assumed to be in range 0..1

function eq_img = histeq_contrast(img)

img =im2double(img);
if (size(img,3)==3)
  img=rgb2gray(img);
end
% ----- INSERT YOUR CODE BELOW -----

% OPTIONAL HINT to make it easier to index you can multiply the img 
%   values by 255 and use a 256 element histogram.

bins = 255;
img = max(min(img, 1), 0);
img = uint8(bins*img);
eq_img = zeros(size(img));

% Make a 256 element histogram
m = histcounts(img, 0:bins);

% Get CDF            
cdf = cumsum(m) / sum(m);

% Compute new intensity values
eq_intensity = round(bins * cdf);


% Apply changes
for i = 1:size(img, 1)
    for j = 1:size(img, 2)
        eq_img(i,j) = eq_intensity(img(i,j)+1);
    end
end

eq_img = double(eq_img) / bins;

% REPLACE THIS LINE OF CODE


% ----- INSERT YOUR CODE ABOVE -----

return
end