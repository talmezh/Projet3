function [transform] = make_transform3d(dx, dy, dz, rx, ry, rz)
% make sure rx ry rz are in rads
if isnan(rx)
    rx=0;
end
if isnan(ry)
    ry=0;
end
if isnan(rz)
    rz=0;
end
Mx = [1 0 0 0; 0 cos(rx) -sin(rx) 0; 0 sin(rx) cos(rx) 0; 0 0 0 1];
My = [cos(ry) 0 -sin(ry) 0; 0 1 0 0; sin(ry) 0 cos(ry) 0; 0 0 0 1];
Mz = [cos(rz) -sin(rz) 0 0; sin(rz) cos(rz) 0 0; 0 0 1 0; 0 0 0 1];
M = Mx*My*Mz;
M(4,1:3) = [dx dy dz];
transform = affine3d(M);
end

