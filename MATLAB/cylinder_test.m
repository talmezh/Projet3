%%
% Generate a PLY file containing a point cloud that shape a cylinder

%Parametric equation
r = 1; %radius
theta = linspace(0, 2*pi, 100); %angles
x = r*cos(theta);
y = r*sin(theta);
z = linspace(0,1,20);

xyz = zeros(length(x)*length(z), 3); % points matrix
norm = zeros(size(xyz)); % normal vector matrix
for n = 1: length(z)
    center = [0 0 z(n)]; % point of alignment
    
    rang_i = (n-1)*length(x)+1;
    rang_f = rang_i-1 + length(x);
    
    range = rang_i : rang_f; % range for this layer
    %Write points
    xyz(range,1) = x;
    xyz(range,2) = y;
    xyz(range,3) = z(n);
    % Write normal vector components
    norm(range,1) = center(1)-x;
    norm(range,2) = center(2)-y;
    norm(range,3) = center(3)-z(n);
end
%Generate PLY model
cylinder = pointCloud(xyz,'Normal',norm);
pcshow(cylinder);
pcwrite(cylinder, 'nuage_cylindre.ply', 'Encoding', 'ascii');

