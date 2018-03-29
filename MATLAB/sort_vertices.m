function [vert_x, vert_y] = sort_vertices(vert_x, vert_y)
angles = cart2pol(vert_x, vert_y);
[angles, idx] = sort(angles);
vert_x = vert_x(idx);
vert_y = vert_y(idx);
end

