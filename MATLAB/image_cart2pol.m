function [pol_image] = image_cart2pol(cart_image)
dim = size(cart_image);
center = [dim(1)/2 dim(2)/2];
pol_image = zeros(dim(1),360);
for i=1:dim(1)
    for j=1:dim(2)
        if j~=50 && i~=50
            [theta, rho] = cart2pol(j-center, i-center);
            if theta < 0
                theta = 2*pi + theta;
            end
            if rho == 0
               rho=rho+1; 
            end
            theta = round(theta/(2*pi/size(pol_image,2)))+1;
            rho = round(rho)+1;
            pol_image(rho, theta) = cart_image(i,j);
        end
    end    
end
end

