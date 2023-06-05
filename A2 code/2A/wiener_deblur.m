function I_deblur = wiener_deblur(I,B,k)
 
if ( isa(I,'uint8') || isa(B,'uint8') )
  error('deblur: Image and blur data should be of type double.');
end

I = edgetaper(I,B);
Fi = fft2(I);
% modify the code below ------------------------------------------------

% Here you will need to:
% 1. zero pad B and compute its FFT
paddedB = padarray(B, floor((size(I)-size(B))/2), 0, 'both');
Fb = fft2(paddedB, size(I,1), size(I,2));

% 2. compute and apply the inverse filter
Finv = zeros(size(I));

for i=1:size(I,1)
    for j=1:size(I,2)
        temp = Fb(i,j);
        if temp == 0
             temp = 1;
         end
        Finv(i,j) = Fi(i,j)/temp;
        Finv(i,j) = Finv(i,j)*((abs(Fb(i,j))^2)/((abs(temp)^2) + k));
    end
end

% 3. convert back to a real image

I_deblur = real(ifft2(Finv));

% 4. handle any spatial delay caused by zero padding of B
% you may need to deal with values near zero in the FFT of B etc
% to avoid division by zero's etc.

I_deblur = ifftshift(I_deblur);

% modify the code above ------------------------------------------------

return