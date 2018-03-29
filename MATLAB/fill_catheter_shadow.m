function [image] = fill_catheter_shadow(image)
pol_image = image_cart2pol(image);
% figure;
% imagesc(pol_image); axis xy;
i = 1;
j = 1;

for x = 1:size(pol_image,2)
    if pol_image(:,x) ~= 255
        empty_columns(i) = x;
        i=i+1;
    else
        filled_x(j) = x;
        filled_y(j) = min(find(pol_image(:,x) == 255));
        j = j+1;
    end
end
if any(filled_x(:) == 0) ~= 1
    filled_x(j) = 0;
    filled_y(j) = filled_y(1);
    j = j+1;
    
    filled_x(j) = 360;
    filled_y(j) = filled_y(end);
    j = j+1;
end
missing_pts = interp1(filled_x,filled_y,empty_columns, 'spline');
for i=1:length(empty_columns)
    %pol_image(round(missing_pts(i)),empty_columns(i)) = 255;
    [x,y] = pol2cart(deg2rad(empty_columns(i)-1),missing_pts(i)-1);
    if round(y)+50 <= 100 && round(x)+50<=100
        image(round(y)+50,round(x)+50) = 255;
    end
end
% figure;
% imagesc(pol_image); axis xy;
end

