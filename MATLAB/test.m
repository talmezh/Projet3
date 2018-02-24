clear all
clc

z = 0:86;

%Parametric equation of path
u = zeros(length(z),1);
v = z;
path(:,1) = u';
path(:,2) = v';
path(:,3) = z';


OCT_path= "C:\Users\talmezh\Desktop\Annee3\H18\Projet3\Code\OCT_data\";
lum = dicomread(OCT_path +"Lumen3.dcm");
info = dicominfo(OCT_path +"Lumen3.dcm");
%load (OCT_path + "image5_1.mat");
% figure; imshow(image5(:,:,2))
% figure;imshow(lum1(:,:,1));
% figure;imshow(lum1(:,:,2));
dim = size(lum);
lumen1 = zeros(dim([1 2 4]));
nb_pts = zeros(dim(4),1);
for i=1:size(lum,4)
    
    lumen1(:,:,i) = layers2image(lum(:,:,:,i));
    [x,y] = find(lumen1(:,:,i) == 255);
    nb_pts(i) = length(x);

    pts(1:nb_pts(i),1:2,i) = [x y];
    pause(0.5);
end

for i=1:size(pts,3)
   center = [dim(1)/2, dim(1)/2, i];
   
    if i ~= 1
        ini = (i-1)*nb_pts(i-1)+1;
        fin = ini+nb_pts(i)-1;
    else
        ini = 1;
        fin = nb_pts(i);
    end
    range = ini:fin;
    
    xyz(range,1) = pts(1:nb_pts(i),1,i)-center(1);
    xyz(range,2) = pts(1:nb_pts(i),2,i)-center(2);
    xyz(range,3) = i;
    
    delta = adjust_orientation(xyz,path);
    xyz(range,4) = -xyz(range,1);
    xyz(range,5) = -xyz(range,2);
    xyz(range,6) = -xyz(range,3);
end


