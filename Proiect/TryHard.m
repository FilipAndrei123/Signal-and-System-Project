% PASUL 0: cu functia imcrop selectam persoanele din poza de grup si salvam
% fiecare poza dupa numele fiecaruia
im=imread('PozaGrup.jpg');
imshow(im); title('Poza Grup');

im1=imcrop(im,[]);
%figure
%imshow(im1); 
imwrite(im1,'FilipAndrei.jpg');

im2=imcrop(im,[]);
%figure
%imshow(im2); 
imwrite(im2,'CuciorvaCosmin.jpg');

im3=imcrop(im,[]);
%figure
%imshow(im3); 
imwrite(im3,'CodrutaAlesutan.jpg');

im4=imcrop(im,[]);
%figure
%imshow(im4); 
imwrite(im4,'DarieDragos.jpg');

im5=imcrop(im,[]);
%figure
%imshow(im5); 
imwrite(im5,'UjicaAlexandru.jpg');


%PASUL 1 Incarcarea imaginii sursa si a imaginii sablon
 im=imread('PozaGrup.jpg');
 template1=imread('FilipAndrei.jpg');
 template2=imread('CuciorvaCosmin.jpg');
 template3=imread('CodrutaAlesutan.jpg');
 template4=imread('DarieDragos.jpg');
 template5=imread('UjicaAlexandru.jpg');

 
if (size(im,3)==3)
    im=rgb2gray(im);
end
if (size(template1,3)==3) 
    template1=rgb2gray(template1);
end
if (size(template2,3)==3) 
    template2=rgb2gray(template2);
end
if (size(template3,3)==3) 
    template3=rgb2gray(template3);
end
if (size(template4,3)==3) 
    template4=rgb2gray(template4);
end
if (size(template5,3)==3) 
    template5=rgb2gray(template5);
end

pause(1)
figure; imshow(template1); title('Filip Andrei');
pause(1)
figure; imshow(template2); title('Cuciorva Cosmin');
pause(1)
figure; imshow(template3); title('Codruta Alesutan');
pause(1)
figure; imshow(template4); title('Darie Dragos');
pause(1)
figure; imshow(template5); title('Ujica Alexandru');
pause(1)
figure; imshow(im); title('Poza Grup');
pause(1)

 % PASUL 2 Calcularea corelatiei normalizata si cautarea coordonatelor
  % punctului maxim: se calculeaza corelatia normalizata si se afiseaza ca
  % o suprafata, iar punctul maxim al matricii de corelatie apare in locul
  % in care iamginile sunt cel mai bine corelate
  
  c1=normxcorr2(template1, im);
  %figure
  %surf(c1);
  shading flat;
  pause(0.2)
  c2=normxcorr2(template2, im);
  %figure
  %surf(c2);
  shading flat;
   pause(0.2)
  c3=normxcorr2(template3, im);
  %figure
  %surf(c3);
  shading flat;
   pause(0.2)
  c4=normxcorr2(template4, im);
  %figure
  %surf(c4);
  shading flat;
   pause(0.2)
 c5=normxcorr2(template5, im);
  %figure
  %surf(c5);
  shading flat;
  
    pause(2)

  
% PASUL 3 Calcularea deplasarii intre imagini: deplasarea dintre iamgini
  % depinde de locatia punctului de valoare maxima in matricea de corelatie
  % si de dimensiunea si pozitia imaginilor
 
  
[max_c1,imax1]=max(c1(:));
[ypeak1,xpeak1]=ind2sub(size(c1),imax1(1));
corr_offset1=[(xpeak1-size(template1,2))
(ypeak1-size (template1,1))];
xoffset1=corr_offset1(1);
yoffset1=corr_offset1(2);

 pause(2)
 
[max_c2,imax2]=max(c2(:));
[ypeak2,xpeak2]=ind2sub(size(c2),imax2(1));
corr_offset2=[(xpeak2-size(template2,2))
(ypeak2-size (template2,1))];
xoffset2=corr_offset2(1);
yoffset2=corr_offset2(2);

 pause(2)
 
[max_c3,imax3]=max(c3(:));
[ypeak3,xpeak3]=ind2sub(size(c3),imax1(1));
corr_offset3=[(xpeak1-size(template1,2))
(ypeak1-size (template1,1))];
xoffset3=corr_offset3(1);
yoffset3=corr_offset3(2);

 pause(2)
 
[max_c4,imax4]=max(c4(:));
[ypeak4,xpeak4]=ind2sub(size(c4),imax4(1));
corr_offset4=[(xpeak4-size(template4,2))
(ypeak4-size (template4,1))];
xoffset4=corr_offset4(1);
yoffset4=corr_offset4(2);

 pause(2)
 
[max_c5,imax5]=max(c5(:));
[ypeak5,xpeak5]=ind2sub(size(c5),imax2(1));
corr_offset5=[(xpeak5-size(template5,2))
(ypeak5-size (template5,1))];
xoffset5=corr_offset5(1);
yoffset5=corr_offset5(2);

   pause(2)
  
 
  % PASUL 4 Verificare: daca imaginea sablon se regaseste intr-o regiune a imaginii sursa 
  
xbegin1 =round(xoffset1+1);
xend1=round(xoffset1+size(template1,2));
ybegin1=round(yoffset1+1);
yend1= round(yoffset1+size(template1,1));

  pause(2)
  
xbegin2 =round(xoffset2+1);
xend2=round(xoffset2+size(template2,2));
ybegin2=round(yoffset2+1);
yend2= round(yoffset2+size(template2,1));

pause(2)
  
xbegin3 =round(xoffset3+1);
xend3=round(xoffset3+size(template3,2));
ybegin3=round(yoffset3+1);
yend3= round(yoffset3+size(template3,1));

  pause(2)
  
xbegin4 =round(xoffset4+1);
xend4=round(xoffset4+size(template4,2));
ybegin4=round(yoffset4+1);
yend4= round(yoffset4+size(template4,1));

 pause(2)
 
xbegin5 =round(xoffset5+1);
xend5=round(xoffset5+size(template5,2));
ybegin5=round(yoffset5+1);
yend5= round(yoffset5+size(template5,1));

  pause(2)


 % PASUL 5 Construirea imaginii sablon de dimensiunea iamginii sursa
  %se inlocuiesc pixelii in care imaginea sablon s-a regasit in imaginea
  %sursa cu pixelii imaginii salbon
  
recovered_template1=uint8(zeros(size(im)));
recovered_template1(ybegin1:yend1, xbegin1:xend1)=template1;
figure
imshow(recovered_template1);

pause(2)

recovered_template2=uint8(zeros(size(im)));
recovered_template2(ybegin2:yend2, xbegin2:xend2)=template2;
figure
imshow(recovered_template2);

 pause(2)
 
recovered_template3=uint8(zeros(size(im)));
recovered_template3(ybegin3:yend3, xbegin3:xend3)=template3;
figure
imshow(recovered_template3);

pause(2)

recovered_template4=uint8(zeros(size(im)));
recovered_template4(ybegin4:yend4, xbegin4:xend4)=template4;
figure
imshow(recovered_template4);

 pause(2)
 
 recovered_template5=uint8(zeros(size(im)));
recovered_template5(ybegin5:yend5, xbegin5:xend5)=template5;
figure
imshow(recovered_template5);

pause(2)




 % PASUL 6 Suprapunerea transparenta a imaginii sablon peste imaginea sursa
[m,n]=size(im);
mask=ones (m,n);

q1=find(recovered_template1 ==0);
mask(q1)=0.5; pause(0.5)
q2=find(recovered_template2 ==0);
mask(q2)=0.5;  pause(0.5)
q3=find(recovered_template3 ==0);
mask(q3)=0.5; pause(0.5)
%q4=find(recovered_template4 ==0);
%mask(q4)=0.5;  pause(0.2)
%q5=find(recovered_template5 ==0);
%mask(q5)=0.5;  pause(0.2)

pause(2)

figure
imshow (im)
title('imag sablon suprapusa peste imag sursa')
hold on;  pause(3)
 
h1=imshow(recovered_template1);
set(h1,'AlphaData',mask);
hold on; pause(3)
h2=imshow(recovered_template2);
set(h2,'AlphaData',mask);
hold on; pause(3)
h3=imshow(recovered_template3);
set(h3,'AlphaData',mask);
hold on; pause(3)
%h4=imshow(recovered_template4);
%set(h4,'AlphaData',mask);
%hold on; pause(1)
%h5=imshow(recovered_template5);
%set(h5,'AlphaData',mask);
%hold on; pause(1)
