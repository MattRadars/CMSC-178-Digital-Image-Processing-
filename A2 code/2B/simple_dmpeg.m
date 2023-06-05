tile_num=0;
% ANALYSE (AND COMPRESS?) EACH 8x8 BLOCK IN THE IMAGE IN TURN
% FOR LOOPS
[rows, cols] = size(new_image);
for ii = 1:8:rows
    for jj = 1:8:cols
      tile_num = tile_num+1;

      % 1. retrieve coefficients for this block
      ac_iijj = ac_coeffs(:,tile_num);
      % 2. retrieve coefficients for this block
      dc_iijj = dc_coeffs(((ii+7)/8), ((jj+7)/8)); 
      
      % 3. determine if block needs updating / decoding
      % when ac and dc terms set to zero, the block does not require
      % updating
      if (dc_iijj ~= 0 || nnz(ac_iijj))
        % 4. extract out the decompressed tile (if required)
        index_ii = ii+(0:7);
        index_jj = jj+(0:7);
       
        new_image(index_ii, index_jj) = djpeg_8x8(dc_iijj, ac_iijj, Q);
      end
    end
end
