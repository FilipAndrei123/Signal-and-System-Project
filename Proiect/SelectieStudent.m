function s = SelectieStudent(nr)
%%1.Codruta Alesutan Maria
%%2.Filip Andrei
%%3.Cuciorva Cosmin Dumitru
%%4.Darie Dragos Mihai
%%5.Ujica Alexandru
%%6.Toti membri


if nr == 1
 X=['Ati selectat numarul ',num2str(nr),' corespunzator studentului Alesutan Codruta Maria']; disp(X);
template1=imread('AlesutanCodrutaMaria.jpg');
CorelatieImagine(template1,1)
end
if nr == 2
 X=['Ati selectat numarul ',num2str(nr),' corespunzator studentului Filip Andrei']; disp(X);
template2=imread('FilipAndrei.jpg');
CorelatieImagine(template2,2)
end
if nr == 3
 X=['Ati selectat numarul ',num2str(nr),' corespunzator studentului Cuciorva Cosmin Dumitru']; disp(X);
template3=imread('CuciorvaCosminDumitru.jpg');
CorelatieImagine(template3,3)
end
if nr == 4
 X=['Ati selectat numarul ',num2str(nr),' corespunzator studentului Darie Dragos Mihai']; disp(X);
template4=imread('DarieDragosMihai.jpg');
CorelatieImagine(template4,4)
end
if nr == 5
 X=['Ati selectat numarul ',num2str(nr),' corespunzator studentului Ujica Alexandru']; disp(X);
template5=imread('UjicaAlexandru.jpg');
CorelatieImagine(template5,5)
end
if nr == 6
 X=['Ati selectat numarul ',num2str(nr),' corespunzator tuturor studentilor grupului']; disp(X);
CorelatieImagini()
end
end