function [theta] = adjust_orientation(path)
nb_slices = size(path, 1);
delta = zeros(nb_slices,3);
theta = zeros(size(delta));
for i=1:nb_slices-1
    delta(i,1) = path(i+1,1)-path(i,1);
    delta(i,2) = path(i+1,2)-path(i,2);
    delta(i,3) = path(i+1,3)-path(i,3);
    theta(i,1) = atan(delta(i,2)/delta(i,3));
    theta(i,2) = atan(delta(i,1)/delta(i,3));
    theta(i,3) = 0;
end
delta(nb_slices,:) = delta(nb_slices-1,:);
theta(nb_slices,:) = theta(nb_slices-1,:);
end

