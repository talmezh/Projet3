function [image] = layers2image(slice)
%Converts 3 layer OCT slice to single B/W image
dim = size(slice);
type = class(slice(1,1,1));
image = zeros(dim(1), dim(2), type);
for i=1:dim(3)
    image = image + slice(:, : ,i);
end
end

