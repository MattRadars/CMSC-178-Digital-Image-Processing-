%
% Compute the quantised coefficients for a given 8x8 jpeg region
%
% tile - 8x8 greyscale region (0..255)
% Q - quality factor 1..100 (eg. 80).
%
% dc_coeff  - quantised dc coefficient  of DCT
% ac_coeff - quantised ac coefficients (63) of DCT in zig-zag order
%
function tile = djpeg_8x8(dc_coeff,ac_coeff,Q)

% quantisation table used to quantise DCT coefs
Qtable = [ 16  11  10  16  24  40  51  61 ; ...
	    12  12  14  19  26  58  60  55 ; ...
	    14  13  16  24  40  57  69  56 ; ...
	    14  17  22  29  51  87  80  62 ; ...
	    18  22  37  56  68 109 103  77 ; ...
	    24  35  55  64  81 104 113  92 ; ...
	    49  64  78  87 103 121 120 101 ; ...
	    72  92  95  98 112 100 103  99 ];
    
% init quantised 8x8 coef array
Zq=zeros(8,8);


%-----------change code from here --------------------------------

% 1. copy DC back in
Zq(1,1) = dc_coeff;

% 2. order zig-zag access and copy AC back
zigzag = [1, 2, 9, 17, 10, 3, 4, 11, ...
          18, 25, 33, 26, 19, 12, 5, 6, ...
          13, 20, 27, 34, 41, 49, 42, 35, ...
          28, 21, 14, 7, 8, 15, 22, 29, ...
          36, 43, 50, 57, 58, 51, 44, 37, ...
          30, 23, 16, 24, 31, 38, 45, 52, ...
          59, 60, 53, 46, 39, 32, 40, 47, ...
          54, 61, 62, 55, 48, 56, 63];

ac_count = 1;
for i = 2:63
    idx = zigzag(i);
    row = floor((idx - 1) / 8) + 1;
    col = mod(idx - 1, 8) + 1;
    if ac_coeff(ac_count) ~= 0
        Zq(row, col) = ac_coeff(ac_count);
    end
    ac_count = ac_count + 1;
end


% 3. Q scale factor used in quantisation step
if (Q <= 50)
    qt_scale = 50/Q;
else
    qt_scale = 2 - Q/50;
end

% 4. estimate original Z coefficients using Zq etc
Z = Zq .* (Qtable * qt_scale);

% 5. inverse dct (assign to variable 'tile')
tile = idct(Z);

%tile = round(255*rand(8,8))-128; % GENERATE SOME RANDOM RESULTS (REMOVE THIS LINE)

%-----------change code above here --------------------------------

% centre image data about greylevel 128
tile=uint8(tile+128);

% ----------------------------------------------------------------------









