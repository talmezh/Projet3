clear all;
close all;
clc;

OCT_path= "C:\Users\talmezh\Desktop\Annee3\H18\Projet 3\Code\OCT_data\";
lum1 = dicomread(OCT_path +"Lumen1.dcm");
info = dicominfo(OCT_path +"Lumen1.dcm");
load (OCT_path + "image5_1.mat");
figure; imshow(image5(:,:,2))
figure;imshow(lum1(:,:,1));
figure;imshow(lum1(:,:,2));
lume1(:,:,1) = layers2image(lum1(:,:,:,1));

[x,y] = find(lume1(:,:,1) == 255);
[Gmag, Gdir] = imgradient(image5(:,:,2));
image.coordx = x';
image.coordy = y';
for n=1:size(x)
    z(n,:)=[x(n), y(n), image5(x(n),y(n),2),Gmag(x(n),y(n)), Gdir(x(n),y(n))];
    image.val(n) = image5(x(n),y(n),2);
    image.gMag(n) = Gmag(x(n),y(n));
    image.gDir(n) = Gdir(x(n),y(n));
end




%%

% filename = "C:\Users\talmezh\Desktop\Annee3\H18\Projet 3\Code\Poisson_module\Poisson_module\test.ply";
% ptCloud = pcread(filename);
ptCloud1 = pointCloud(rand(100, 3, 'single'));



