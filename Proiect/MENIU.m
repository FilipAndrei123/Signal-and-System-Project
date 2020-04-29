function meniu = MENIU(nr)
%%Selectie dupa numar ordine
%%1.Alesutan Codruta Maria
%%2.Filip Andrei
%%3.Cuciorva Cosmin Dumitru
%%4.Darie Dragos Mihai
%%5.Ujica Alexandru
%%6.Selectie toti

if nr == 1
[y,Fs] = audioread('B_AlesutanCodrutaMaria.m4a');
sound(y,Fs);
pause(5);
end
if nr == 2
[y,Fs] = audioread('B_FilipAndrei.m4a');
sound(y,Fs);
pause(5);
end
if nr == 3
[y,Fs] = audioread('B_CuciorvaCosmin.m4a');
sound(y,Fs);
pause(5);
end
if nr == 4
[y,Fs] = audioread('B_DarieDragosMihai.m4a');
sound(y,Fs);
pause(5);
end
if nr == 5
[y,Fs] = audioread('B_UjicaAlexandru.m4a');
sound(y,Fs);
pause(5);
end
if nr == 6
[y,Fs] = audioread('B_All.m4a');
sound(y,Fs);
pause(15);
end

[yy,Fss] = audioread('All_I_NEED.mp3');
samples = [1,30*Fss];
[yy,Fss] = audioread('All_I_NEED.mp3',samples);
%sound(yy,Fss);

RecunoastereVocala(y,Fs);


end