clear all;
im1 = imread('download.jpg');imshow(im1);  
[m,n,p]=size(im1);
n1=(rand(1)*10)+1; % range: 1 to 1

thet = ((2*pi)/n1);% claculating theta 
mm = m*sqrt(2); % max possible output row
nn = n*sqrt(2); % max possible output column

% Now rotating every pixel of the input image using for loop
% inverse rotation of an image -> transpose of rotation matrix 
for t=1:mm
   for s=1:nn
      i = uint16((t-mm/2)*cos(thet)+(s-nn/2)*sin(thet)+m/2); % y = x'cos + y'sin
      j = uint16(-(t-mm/2)*sin(thet)+(s-nn/2)*cos(thet)+n/2); % x = x'cos - y'sin
      if i>0 && j>0 && i<=m && j<=n           
         im2(t,s,:)=im1(i,j,:); %storing corresponding rotated co-ordinates for the final output image
         
      end
   end
end

% Displaying the rotated output image using nearest neighbour interpolation

figure;
imshow(im2);

% Reference Link : https://stackoverflow.com/questions/1811372/how-to-rotate-image-by-nearest-neighbor-interpolation-using-matlab