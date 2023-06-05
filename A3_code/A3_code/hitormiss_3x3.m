function Imatch = hitormiss_3x3(I,M)

if (ndims(I)==3)
  I=I(:,:,2);
end
if (isa(I,'uint8'))
  I=double(I)/255;
end

% --------------- INSERT YOUR CODE BELOW -----------------

% note use the erode_3x3 function call as part of your solution
% Imatch = rand(size(I)) > 0.9;

% I = input image
% M = 3x3 structuring element for hit-or-miss transform

% HIT SET
% Set all non-1 values to zero
hitSet = M;
hitSet(hitSet ~= 1) = 0;

% MISS SET
% Set all non-negative values to zero and all -1 values to 1
missSet = M;
missSet(missSet ~= -1) = 0;
missSet(missSet == -1) = 1;

% Get the complement/inversion of I
IComplement = ones(size(I)) - I;

% Get eroded Image of the HIT SET and MISS SET
eroded_hit = erode_3x3(I, hitSet);
eroded_miss = erode_3x3(IComplement, missSet);

% Get the intersection of eroded I and I'
Imatch = (eroded_hit & eroded_miss);

% --------------- INSERT YOUR CODE ABOVE -----------------

return


% erode_3x3(I,S) - apply erosion using the 3x3 structure element S

function E = erode_3x3(I,S)
% I = Image
% S = 3x3 structuring element
% --------------- INSERT YOUR CODE BELOW -----------------
% E = I | (rand(size(I)) > 0.9);

% Pad the input image with zeros
Ipad = padarray(I, [1 1], 0);


% Initialize output image with zeroes
E = zeros(size(I));

% Perform erosion operation
for row = 1: size(I,1)
    for col = 1: size(I,2)
        % Get the neighborhood of the current cell
        neighborhood = Ipad(row:row+2, col:col+2);

        % Check if the current cell is a match with the 3x3 structuring
        % element
        if all(neighborhood(S == 1)) && ~any(neighborhood(S == -1))
            E(row, col) = 1;
        end
    end
end

% --------------- INSERT YOUR CODE ABOVE -----------------
return




