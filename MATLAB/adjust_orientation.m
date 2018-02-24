function [delta] = adjust_orientation(slices, path)
nb_slices = size(path, 1);
delta = zeros(nb_slices,3);
for i=1:nb_slices-1
    delta(i,1) = path(i+1,1)-path(i,1);
    delta(i,2) = path(i+1,2)-path(i,2);
    delta(i,3) = path(i+1,3)-path(i,3);
end
delta(nb_slices,:) = delta(nb_slices-1,:);
%adjusted_slices = slices+delta;
end

