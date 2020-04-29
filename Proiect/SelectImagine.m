im=imread('PozaGrup.jpg');
imshow(im); title('sursa');

% PASUL 0: cu functia imcrop selectam persoanele din poza de grup si salvam
% fiecare poza dupa numele fiecaruia

im1=imcrop(im,[100,200]);
imshow(im1); figure
imwrite(im1,'AlesutanCodrutaMaria.jpg');
im2=imcrop(im,[100,200]);
imshow(im2); figure
imwrite(im2,'FilipAndrei.jpg');
im3=imcrop(im,[100,200]);
imshow(im3); figure
imwrite(im3,'CuciorvaCosminDumitru.jpg');
im4=imcrop(im,[100,200]);
imshow(im4); figure
imwrite(im4,'DarieDragosMihai.jpg');
im5=imcrop(im,[100,200]);
imshow(im5);
imwrite(im5,'UjicaAlexandru.jpg');



