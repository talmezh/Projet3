clear all
clc

OCT_path= "C:\Users\talmezh\Desktop\Annee3\H18\Projet3\Code\OCT_data\";
lum1 = dicomread(OCT_path +"Lumen3.dcm");
info = dicominfo(OCT_path +"Lumen3.dcm");
%load (OCT_path + "image5_1.mat");
% figure; imshow(image5(:,:,2))
% figure;imshow(lum1(:,:,1));
% figure;imshow(lum1(:,:,2));
dim = size(lum1);
lumen1 = zeros(dim([1 2 4]));
nb_pts = zeros(dim(4),1);
for i=1:size(lum1,4)
    
    lumen1(:,:,i) = layers2image(lum1(:,:,:,i));
%     figure;imshow(lumen1(:,:,i));
    [x,y] = find(lumen1(:,:,i) == 255);
    nb_pts(i) = length(x);
%     if i ~= 1
%         ini = (i-1)*nb_pts(i-1)+1;
%         fin = ini+nb_pts(i)-1;
%     else
%         ini = 1;
%         fin = nb_pts(i);
%     end
%     range = ini:fin;
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
%     rang_i = (n-1)*nb_pts(i)+1;
%     rang_f = rang_i-1 + nb_pts(i);
%     
%     range = rang_i : rang_f; % range for this layer
    %Write points
    xyz(range,1) = pts(1:nb_pts(i),1,i)-center(1);
    xyz(range,2) = pts(1:nb_pts(i),2,i)-center(2);
    xyz(range,3) = i;
    xyz(range,4) = -xyz(range,1);
    xyz(range,5) = -xyz(range,2);
    xyz(range,6) = -xyz(range,3);
end


