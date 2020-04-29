function CI = CorelatieImagine(template,n)
%PASUL 1 Incarcarea imaginii sursa si a imaginii sablon
 im=imread('PozaGrup.jpg');
 imshow(im); title('Poza Grup');
  
 pause(2);
 
 figure
  imshow(template);
  if n==1
  title('Student selectat: Alesutan Codruta Maria');
  end
   if n==2
  title('Student selectat: Filip Andrei');
   end
   if n==3
  title('Student selectat: Cuciorva Cosmin Dumitru');
   end
   if n==4
  title('Student selectat: Darie Dragos Mihai');
   end
   if n==5
  title('Student selectat: Ujica Alexandru');
  end
  
  
  if (size(im,3) == 3)
       im=rgb2gray(im);
  end
  if (size(template,3)==3)
      template=rgb2gray(template);
  end
  
pause(2);
  % PASUL 2 Calcularea corelatiei normalizata si cautarea coordonatelor
  % punctului maxim: se calculeaza corelatia normalizata si se afiseaza ca
  % o suprafata, iar punctul maxim al matricii de corelatie apare in locul
  % in care iamginile sunt cel mai bine corelate
  
  c=normxcorr2(template, im);
  figurex=figure;
  surf(c);
  title('Corelatia Normalizata ca o suprafata si punctul maxim al matricii de corelatie');
  shading flat;
  if n==1
  saveas(figurex,'Corelatia_Normalizata_AlesutanCodrutaMaria.jpg');
  end
   if n==2
  saveas(figurex,'Corelatia_Normalizata_FilipAndrei.jpg');
   end
   if n==3
  saveas(figurex,'Corelatia_Normalizata_CuciorvaCosminDumitru.jpg');
   end
   if n==4
  saveas(figurex,'Corelatia_Normalizata_DarieDragosMihai.jpg');
   end
   if n==5
  saveas(figurex,'Corelatia_Normalizata_UjicaAlexandru.jpg');
  end
  
 
pause(2); 
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
  
 pause(2);
  % PASUL 5 Construirea imaginii sablon de dimensiunea iamginii sursa
  %se inlocuiesc pixelii in care imaginea sablon s-a regasit in imaginea
  %sursa cu pixelii imaginii salbon
  
  recovered_template=uint8(zeros(size(im)));
 recovered_template(ybegin:yend,xbegin:xend)=template;
 figurez=figure;
  imshow(recovered_template);
  title('Imaginea sablon de dimensiunea imaginii sursa');
  if n==1
  saveas(figurez,'ImagineSablon_AlesutanCodrutaMaria.jpg');
  end
   if n==2
  saveas(figurez,'ImagineSablon_FilipAndrei.jpg');
   end
   if n==3
  saveas(figurez,'ImagineSablon_CuciorvaCosminDumitru.jpg');
   end
   if n==4
 saveas(figurez,'ImagineSablon_DarieDragosMihai.jpg');
   end
   if n==5
  saveas(figurez,'ImagineSablon_UjicaAlexandru.jpg');
  end
  
  pause(2);
 % PASUL 6 Suprapunerea transparenta a imaginii sablon peste imaginea sursa
if n==1
  [m,n]=size(im);
  mask=ones(m,n);
  
  i=find(recovered_template == 0);
  mask(i)= .5;
  
  figurey=figure;
  imshow(im);
  title('Imaginea sablon a Codrutei Alesutan este suprapusa peste poza originala');
  hold on; pause(2);
  h=imshow(recovered_template);
  set(h, 'AlphaData',mask);
  saveas(figurey,'ImagineSablonSuprapusa_AlesutanCodrutaMaria.jpg');
  end
   
if n==2
  [m,n]=size(im);
  mask=ones(m,n);
  
  i=find(recovered_template == 0);
  mask(i)= .5;
  
  figurey=figure;
  imshow(im);
  title('Imaginea sablon a lui Filip Andrei este suprapusa peste poza originala');
  hold on; pause(2);
  h=imshow(recovered_template);
  set(h, 'AlphaData',mask);
  saveas(figurey,'ImagineSablonSuprapusa_FilipAndrei.jpg');
    end
   
if n==3
  [m,n]=size(im);
  mask=ones(m,n);
  
  i=find(recovered_template == 0);
  mask(i)= .5;
  
  figurey=figure;
  imshow(im);
  title('Imaginea sablon a lui Cuciorva Cosmin Dumitru este suprapusa peste poza originala');
  hold on; pause(2);
  h=imshow(recovered_template);
  set(h, 'AlphaData',mask);
  saveas(figurey,'ImagineSablonSuprapusa_CuciorvaCosminDumitru.jpg');
      end
   
 if n==4
  [m,n]=size(im);
  mask=ones(m,n);
  
  i=find(recovered_template == 0);
  mask(i)= .5;
  
  figurey=figure;
  imshow(im);
  title('Imaginea sablon a lui Darie Dragos Mihai este suprapusa peste poza originala');
  hold on; pause(2);
  h=imshow(recovered_template);
  set(h, 'AlphaData',mask);
  saveas(figurey,'ImagineSablonSuprapusa_DarieDragosMihai.jpg');
        end
   
 if n==5
  [m,n]=size(im);
  mask=ones(m,n);
  
  i=find(recovered_template == 0);
  mask(i)= .5;
  
  figurey=figure;
  imshow(im);
  title('Imaginea sablon a lui Ujica Alexandru este suprapusa peste poza originala');
  hold on; pause(2);
  h=imshow(recovered_template);
  set(h, 'AlphaData',mask);
  saveas(figurey,'ImagineSablonSuprapusa_UjicaAlexandru.jpg');
   end
  
end