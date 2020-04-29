clc; close all;
 im=imread('PozaGrup.jpg');
 imshow(im); title('Poza Grup');
 
 pause(2);
%%%%%%%%%%%%%%%%%%%%Cod Codri
 template=imread('AlesutanCodrutaMaria.jpg');
 
  if (size(im,3) == 3)
       im=rgb2gray(im);
  end
  if (size(template,3)==3)
      template=rgb2gray(template);
  end
  c=normxcorr2(template, im);
  [max_c,imax]=max(c(:));
  [ypeak,xpeak]=ind2sub(size(c), imax(1));
  corr_offset=[(xpeak-size(template,2))
              (ypeak-size(template,1))];
  xoffset=corr_offset(1);
  yoffset=corr_offset(2);
  
  xbegin=round(xoffset+1);
  xend=round(xoffset + size(template,2));
  ybegin=round(yoffset+1);
 yend=round(yoffset + size(template,1));
  
  recovered_template=uint8(zeros(size(im)));
 recovered_template(ybegin:yend,xbegin:xend)=template;
 figure
  imshow(recovered_template);
  
  [m,n]=size(im);
  mask=ones(m,n);
  recovered_template1=recovered_template;
  template1=template;
  i1=find(recovered_template1 == 0);
  mask(i1)= .5;
 
  
  
   pause(2);
  %%%%%%%%%%%%%%%%%%%%Cod Filip
 template=imread('FilipAndrei.jpg');

  if (size(im,3) == 3)
       im=rgb2gray(im);
  end
  if (size(template,3)==3)
      template=rgb2gray(template);
  end

  c=normxcorr2(template, im);

  [max_c,imax]=max(c(:));
  [ypeak,xpeak]=ind2sub(size(c), imax(1));
  corr_offset=[(xpeak-size(template,2))
              (ypeak-size(template,1))];
  xoffset=corr_offset(1);
  yoffset=corr_offset(2);
  

  xbegin=round(xoffset+1);
  xend=round(xoffset + size(template,2));
  ybegin=round(yoffset+1);
 yend=round(yoffset + size(template,1));

  recovered_template=uint8(zeros(size(im)));
 recovered_template(ybegin:yend,xbegin:xend)=template;
 figure
  imshow(recovered_template);

  
  [m,n]=size(im);
  mask=ones(m,n);
  recovered_template2=recovered_template;
  template2=template;
  i2=find(recovered_template2 == 0);
  mask(i2)= .5;
 
  
  
   pause(2);
  %%%%%%%%%%%%%%%%%%%%Cod Cucio
 template=imread('CuciorvaCosminDumitru.jpg');

  if (size(im,3) == 3)
       im=rgb2gray(im);
  end
  if (size(template,3)==3)
      template=rgb2gray(template);
  end
 
  c=normxcorr2(template, im);
 
  [max_c,imax]=max(c(:));
  [ypeak,xpeak]=ind2sub(size(c), imax(1));
  corr_offset=[(xpeak-size(template,2))
              (ypeak-size(template,1))];
  xoffset=corr_offset(1);
  yoffset=corr_offset(2);
  
 
  xbegin=round(xoffset+1);
  xend=round(xoffset + size(template,2));
  ybegin=round(yoffset+1);
 yend=round(yoffset + size(template,1));
 
  recovered_template=uint8(zeros(size(im)));
 recovered_template(ybegin:yend,xbegin:xend)=template;
 figure
  imshow(recovered_template);
  

  [m,n]=size(im);
  mask=ones(m,n);
  recovered_template3=recovered_template;
  template3=template;
  i3=find(recovered_template3 == 0);
  mask(i3)= .5;
  
  
  
  
   pause(2);
   %%%%%%%%%%%%%%%%%%%%Cod Dragos

 template=imread('DarieDragosMihai.jpg');
  
  if (size(im,3) == 3)
       im=rgb2gray(im);
  end
  if (size(template,3)==3)
      template=rgb2gray(template);
  end
 
  c=normxcorr2(template, im);
 
  [max_c,imax]=max(c(:));
  [ypeak,xpeak]=ind2sub(size(c), imax(1));
  corr_offset=[(xpeak-size(template,2))
              (ypeak-size(template,1))];
  xoffset=corr_offset(1);
  yoffset=corr_offset(2);
 
  xbegin=round(xoffset+1);
  xend=round(xoffset + size(template,2));
  ybegin=round(yoffset+1);
 yend=round(yoffset + size(template,1));

  recovered_template=uint8(zeros(size(im)));
 recovered_template(ybegin:yend,xbegin:xend)=template;
 figure
  imshow(recovered_template);
  
  [m,n]=size(im);
  mask=ones(m,n);
  recovered_template4=recovered_template;
  template4=template;
  i4=find(recovered_template4 == 0);
  mask(i4)= .5;

  
   pause(2);
  %%%%%%%%%%%%%%%%%%%%Cod ujica

 template=imread('UjicaAlexandru.jpg');

  if (size(im,3) == 3)
       im=rgb2gray(im);
  end
  if (size(template,3)==3)
      template=rgb2gray(template);
  end

  c=normxcorr2(template, im);
 
  [max_c,imax]=max(c(:));
  [ypeak,xpeak]=ind2sub(size(c), imax(1));
  corr_offset=[(xpeak-size(template,2))
              (ypeak-size(template,1))];
  xoffset=corr_offset(1);
  yoffset=corr_offset(2);

  xbegin=round(xoffset+1);
  xend=round(xoffset + size(template,2));
  ybegin=round(yoffset+1);
 yend=round(yoffset + size(template,1));
 
  recovered_template=uint8(zeros(size(im)));
 recovered_template(ybegin:yend,xbegin:xend)=template;
 figure
  imshow(recovered_template);
  [m,n]=size(im);
  mask=ones(m,n);
  recovered_template5=recovered_template;
  template5=template;
  i5=find(recovered_template5 == 0);
  mask(i5)= .5;
  
  
  pause(2);
  %%%Suprapunere
  figurey=figure;
  imshow(im);title('Imaginile sablon sunt suprapusa');
  hold on; pause(2);
  saveas(figurey,'A1)Serie_suprapunere_Imagini_Sablon_Suprapuse.jpg');
  h1=imshow(recovered_template1);
  set(h1, 'AlphaData',mask);
  hold on; pause(2);
  saveas(figurey,'A2)Serie_suprapunere_Imagini_Sablon_Suprapuse.jpg');
  h2=imshow(recovered_template2);
  set(h2, 'AlphaData',mask);
  hold on; pause(2);
  saveas(figurey,'A3)Serie_suprapunere_Imagini_Sablon_Suprapuse.jpg');
  h3=imshow(recovered_template3);
  set(h3, 'AlphaData',mask);
  hold on; pause(2);
  saveas(figurey,'A4)Serie_suprapunere_Imagini_Sablon_Suprapuse.jpg');
  h4=imshow(recovered_template4);
  set(h4, 'AlphaData',mask);
  hold on; pause(2);
  saveas(figurey,'A5)Serie_suprapunere_Imagini_Sablon_Suprapuse.jpg');
  h5=imshow(recovered_template5);
  set(h5, 'AlphaData',mask);
  hold on; pause(2);
  saveas(figurey,'A6)Serie_suprapunere_Imagini_Sablon_Suprapuse.jpg');
 
 