
%PASUL 1 Incarcarea imaginii sursa si a imaginii sablon
 im=imread('PozaGrup.jpg');
 template=imread('Codri.jpg');
 
  figure
  imshow(im); title('sursa');
  figure
  imshow(template);
  title('template');
  
  
  if (size(im,3) == 3)
       im=rgb2gray(im);
  end
  if (size(template,3)==3)
      template=rgb2gray(template);
  end
  

  % PASUL 2 Calcularea corelatiei normalizata si cautarea coordonatelor
  % punctului maxim: se calculeaza corelatia normalizata si se afiseaza ca
  % o suprafata, iar punctul maxim al matricii de corelatie apare in locul
  % in care iamginile sunt cel mai bine corelate
  
  c=normxcorr2(template, im);
  figure
  surf(c);
  shading flat;
 
  
  % PASUL 3 Calcularea deplasarii intre imagini: deplasarea dintre iamgini
  % depinde de locatia punctului de valoare maxima in matricea de corelatie
  % si de dimensiunea si pozitia imaginilor
  
  [max_c,imax]=max(c(:));
  [ypeak,xpeak]=ind2sub(size(c), imax(1));
  corr_offset=[(xpeak-size(template,2))
              (ypeak-size(template,1))];
  xoffset=corr_offset(1);
  yoffset=corr_offset(2);
  
  % PASUL 4 Verificare: daca imaginea sablon se regaseste intr-o regiune a imaginii sursa 
  
  xbegin=round(xoffset+1);
  xend=round(xoffset + size(template,2));
  ybegin=round(yoffset+1);
 yend=round(yoffset + size(template,1));
  
  % PASUL 5 Construirea imaginii sablon de dimensiunea iamginii sursa
  %se inlocuiesc pixelii in care imaginea sablon s-a regasit in imaginea
  %sursa cu pixelii imaginii salbon
  
  recovered_template=uint8(zeros(size(im)));
 recovered_template(ybegin:yend,xbegin:xend)=template;
 figure
  imshow(recovered_template);
  
 % PASUL 6 Suprapunerea transparenta a imaginii sablon peste imaginea sursa
  
  [m,n]=size(im);
  mask=ones(m,n);
  
  i=find(recovered_template == 0);
  mask(i)= .5;
  
  figure
  imshow(im);title('imaginea sablon este suprapusa');
  hold on
  h=imshow(recovered_template);
  set(h, 'AlphaData',mask);
 