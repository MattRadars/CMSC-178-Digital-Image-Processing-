% SMART_BLUR - blur image to remove noise, but attempt to preserve
%  edge details where possible
%
% USAGE:
%   image_out = smart_blur( image_in , N , tolderance )
%
%    N         - size of NxN blur to apply to data (def. 5).
%    tolerance - estimate of gradient based on noise alone. Used to
%                contol weighting between oriignal and smoothed data
%                returned by function (def. 0.015)
%
% NOTE: all image data is converted to greyscale, with values in range 
%      0.0..1.0 before filtering is applied.

function B = smart_blur(I,N,tolerance)

% convert to greyscale 0.0..1.0
I =im2double(I);
if (size(I,3)==3)
  I=rgb2gray(I);
end

% handle missing input parameters
if (nargin<2)
  N = 5;
  if (nargin<3)
    tolerance = 0.015; % about 4 greylevels for 8bit data
  end
  if (nargin<1)
    error('This function requires an image as input');
  end
end

% ------ INSERT YOUR CODE BELOW ------

    %B = rand(size(I,2),size(I,2)); % dummy result, remove this line
    
    % Create a blurred image B using a simple NxN averaging filter
    B = conv2(I,ones(N,N)/(N*N),'same');
    
    % Calculate the x and y image gradients using the following 5x5 sobel
    % filter.
    sobel_filterx = [...
                -4, -5, 0, 5, 4;
                -8, -10, 0, 10, 8
                -10, -20, 0, 20, 10
                -8, -10, 0, 10, 8
                -4, -5, 0, 5, 4];

sobel_filtery = [...
                4, 8, 10, 8, 4;
                5, 10, 20, 10, 5
                0, 0, 0, 0, 0
                -5, -10, -20, -10, -5
                -4, -8, -10, -8, -4];

% Add padding to allow all pixels to have a complete neighborhood
padd_replicate = padarray(B,[2,2],'replicate','both');
B2 = padd_replicate;
[row,col] = size(B2);

% Iterate over each pixel in the image
for i = 3: row -  2
    for j = 3: col - 2
        % Select all neighboring pixels of the current pixel
        neighbors = B2(i-2:i+2, j-2:j+2);
        x_gradientfilter = zeros(size(neighbors));
        y_gradientfilter = zeros(size(neighbors));
        % Apply sobel gradient filter
        for i = 1: size(neighbors,1)
            for j = 1:size(neighbors,2)
                x_gradientfilter(i,j) = (neighbors(i,j)*sobel_filterx(i,j));
                y_gradientfilter(i,j) = (neighbors(i,j)*sobel_filtery(i,j));
            end
        end
        
        % Multiply gradient filters with 1/240
        k = 1/240;
        x_gradientfilter(i,j) = (x_gradientfilter(i,j)*k);
        y_gradientfilter(i,j) = (y_gradientfilter(i,j)*k);

        % Compute gradient image G
        G = sqrt(sum(x_gradientfilter(:)).^2 + sum(y_gradientfilter(:).^2));

        % Compute the weighing functions W
        W = min(tolerance/G, 1);

        % For each pixel, construc the output image as a weighted
        % combination of the blurred and original images using the
        % computed weight values
        B(i-2, j-2) = (W*B(i-2,j-2)+(1-W))*I(i-2,j-2); 
    end
end

% ------ INSERT YOUR CODE ABOVE ------

return
end

