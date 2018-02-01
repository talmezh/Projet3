clear all;
close all;
clc;

OCT_path= "C:\Users\talmezh\Desktop\Annee3\H18\Projet 3\Code\OCT_data\";
lum1 = dicomread(OCT_path +"Lumen1.dcm");
info = dicominfo(OCT_path +"Lumen1.dcm");
load (OCT_path + "image5_1.mat");
for i=1:size(lum1,4)
    lum1(i) = layers2image(lum1(:,:,:,i));
end

% figure;
% imshow(lum1 == 255);


figure;
imshow(image5(:,:,2),[]);
% for n=1:85
%     imshow(image5(:,:,n));
%     pause(0.5);
% end
%%

% [X,Y] = deal(1:40); % Create grid reference 
% Z = peaks(40); % Create grid height 
% surf(X,Y,Z);
% stlwrite('test.stl',X,Y,Z,'mode','ascii')



