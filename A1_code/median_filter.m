% MEDIAN_FILTER
%
% Usage:
%         med_img = median_filter(img,M,N)
%
% M,N size of MxN median filter to employ. 

function med_img = median_filter(img,M,N)

% ensure img is 0..1 and greyscale
img = im2double(img);
if (size(img,3)==3)
  img=rgb2gray(img);
end

% ----- INSERT YOUR OWN CODE BELOW -----
[row, col] = size(img);
med_img = zeros(row, col);

% Add Padding
Mpad = floor(M/2);
Npad = floor(N/2);
padd_symmetric = padarray(img, [Mpad, Npad], 'symmetric', 'both');

% Iterate through each pixel in the image
for i = 1:row
    for j = 1:col
        % Find the neighbors around current pixels
        neighbors = padd_symmetric(i:i+M-1, j:j+N-1);
        
        % Sort the values in that neighborhood
        temp_array = sort(neighbors(:));
        
        len = length(temp_array);
     
        % Calculate the median value
        if rem(len, 2) == 1
            % Neighborhood size is odd
            med_val = temp_array(floor(M*N/2)+1);
        else
            % Neighborhood size is even
            mid = M*N/2;
            med_val = (temp_array(mid) + temp_array(mid+1))/2;
        end
        % Replace current pixel with the median
        med_img(i, j) = med_val;
    end
end

% Hint: the simplest solution is to use for loops and the sort() function
% to solve this. Consider also how you plan to deal with values near the
% boundary.


% ----- INSERT YOUR OWN CODE ABOVE -----

return
end




