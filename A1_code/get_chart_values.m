% GET_CHART_VALUES(chart_image) - extract the 6x4 color values from the
% supplied colour chart image.
%
% Usage:
%         RGB_list = get_chart_values(chart_image)
%
% chart_image - NxMx3 array of uint8
% RGB_list - 24x3 element list of rgb values


function RGB_list = get_chart_values(chart_image)

% chart_image is assumed to be an RGB (0..255) image of the color test
% chart. The chart should consist of 4 rows of 6 color patches equally
% spaced. Here you simply need to obtain an RGB value for each patch and
% store it in an Nx3 table

% loop 1 - loop through row loop 2 - loop through column ---- INSERT YOUR CODE BELOW -----

% DELETE THIS LINE OF CODE
%RGB_list = round(255*rand(24,3)); % <--- for now this returns a dummy result
RGB_list=zeros(24,3);
m = 4; %rows
n = 6; %columns

% Define patch size, borders, center pixel, and gap size
offset_lft_brdr = 55;
offset_top_brdr = 64;
patch_width = 238;
patch_height = 232;
gap_btwn_patch = 14;

patch_center = patch_width/2;
patch_mid = patch_height/2;

color_counter = 1;
% Iterate over each patch and extract its center pixel
%RED CHANNEL
for row=0:m-1
    for col=0:n-1
        %RED CHANNEL
        RGB_list(color_counter,1) = chart_image(offset_top_brdr+...
            (patch_height * row) + (gap_btwn_patch * row)+patch_mid,...
            offset_lft_brdr+(patch_width * col) + (gap_btwn_patch*col)...
            + patch_center,1);

        %GREEN CHANNEL
        RGB_list(color_counter,2) = chart_image(offset_top_brdr+...
            (patch_height*row)+(gap_btwn_patch * row)+patch_mid,...
            offset_lft_brdr+(patch_width * col) + (gap_btwn_patch*col)...
            + patch_center,2);

        %BLUE CHANNEL
        RGB_list(color_counter,3) = chart_image(offset_top_brdr+...
            (patch_height*row)+(gap_btwn_patch * row)+patch_mid,...
            offset_lft_brdr+(patch_width * col) + (gap_btwn_patch*col)...
            + patch_center,3);
        color_counter = color_counter + 1;
        
    end
end

% ---- INSERT YOUR CODE ABOVE -----

return
end






