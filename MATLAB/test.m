i = dicomread("Lumen1.dcm");
info = dicominfo("Lumen1.dcm");
load image5_1.mat;
figure;
imshow(i(:,:,:,2));
figure;
imshow(image5(:,:,2),[]);
% for n=1:85
%     imshow(image5(:,:,n));
%     pause(0.5);
% end
%%

[X,Y] = deal(1:40); % Create grid reference 
Z = peaks(40); % Create grid height 
surf(X,Y,Z);
stlwrite('test.stl',X,Y,Z,'mode','ascii')



