function [ image ] = my2Dconv( img,matrix )
  [rows,cols] = size(img); %taking rows and cols from the image

  %Creating a padded matrix
  new_img = zeros(rows+2,cols+2);
  new_img = cast(new_img, class(img));

  %Placing the original image in padded result, so all the boundaries have
  %zero values
  new_img(2:end-1,2:end-1) = img;

  %Also create new output image the same size as the padded result
  image = zeros(size(new_img));
  image = cast(image, class(img));

  for i=2:1:rows+1 
    for j=2:1:cols+1 
        value=0;
      for g=-1:1:1
        for l=-1:1:1
          value=value+new_img(i+g,j+l)*matrix(g+2,l+2); % updating the
          % value after each delay
        end
      end
     image(i,j)=value;
    end
  end
%Crop the image and remove the extra border pixels
image = image(2:end-1,2:end-1);
end


% We first created the code but it wasn't displaying the image for some reason 
% So after that we referred to Stack Overflow and found a solution
% which was similar to our code
