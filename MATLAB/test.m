close all
clear all
clc




OCT_dir= "C:\Users\talmezh\Desktop\Annee3\H18\Projet3\Code\OCT_data\";
lum = dicomread(OCT_dir +"Lumen1.dcm");
dim = size(lum);
lumen1 = zeros(dim([1 2 4]));
nb_pts = zeros(dim(4),1);

%Parametric equation of path
% z = 0:4:4*(dim(4)-1);
% u = 50*sin(pi*(1/(2*length(z)))*z);
% v = 50*sin(pi*(1/(2*length(z)))*z);
z = 0:dim(4);
u = 100*sin(pi*(1/(2*length(z)))*z);
v = 10*sqrt(z);

path(:,1) = u;
path(:,2) = v';
path(:,3) = z';
theta = adjust_orientation(path);

%Extract points from dicom
for i=1:size(lum,4)
    
    lumen1(:,:,i) = layers2image(lum(:,:,:,i));
    [x,y] = find(lumen1(:,:,i) == 255);
    nb_pts(i) = length(x);

    pts(1:nb_pts(i),1:2,i) = [x y];
end

% Generate Matrix for ply

xyz = zeros(sum(nb_pts),6);
for i=1:size(pts,3)
   center = path(i,1:3);
   transform = make_transform3d(center(1), center(2), center(3), theta(i,1), theta(i,2), theta(i,3));
   
    if i ~= 1
        ini = sum(nb_pts(1:i-1))+1;
        fin = ini+nb_pts(i)-1;
    else
        ini = 1;
        fin = nb_pts(i);
    end
    range = ini:fin;
    
    xyz(range,1) = pts(1:nb_pts(i),1,i)-dim(1)/2;
    xyz(range,2) = pts(1:nb_pts(i),2,i)-dim(2)/2;
    xyz(range,3) = 0;
    
    for j=range
        xyz(j,1:3) = transformPointsForward(transform,xyz(j,1:3));
    end
    
    xyz(range,4) = center(1)-xyz(range,1);
    xyz(range,5) = center(2)-xyz(range,2);
    xyz(range,6) = center(3)-xyz(range,3);
end


