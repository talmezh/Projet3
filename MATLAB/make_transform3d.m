function [transform] = make_transform3d(rx, ry, rz)
% make sure rx ry rz are in rads
Mx = [1 0 0 0; 0 cos(rx) -sin(rx) 0; 0 sin(rx) cos(rx) 0; 0 0 0 1];
My = [cos(ry) 0 sin(ry) 0; 0 1 0 0; -sin(ry) 0 cos(ry) 0; 0 0 0 1];
Mz = [cos(rz) -sin(rz) 0 0; sin(rz) cos(rz) 0 0; 0 0 1 0; 0 0 0 1];
M = Mx*My*Mz;
transform = affine3d(M);
end

