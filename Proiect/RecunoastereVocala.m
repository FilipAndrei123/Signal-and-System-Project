function rv = RecunoastereVocala(y,Fs)
figure, plot([0:length(y)-1]/Fs,y),xlabel('t'),ylabel('x(t)'),title ('Semnal voce')

N=2000;
n=[0:N-1];
x=y(8000+n)';
pause(3);
figure,subplot(311),t=[0:N-1]/Fs;plot(t,x),axis([0 0.03 -1 1])
subplot(312),Xf=fft(x);plot(abs(Xf)*2/N),ylabel('Spectrul semnalului x')
k1=[173 217 286];
QQ=['amplitudini rezultate']; disp(QQ);
AR=abs(Xf(k1))*2/N
QQ=['faze rezultate (radiani)']; disp(QQ);
FR=angle(Xf(k1))
QQ=['frecvente rezultate (Hz)']; disp(QQ);
disp((k1-1)/N*Fs);
z=0.14*cos(2*pi*705*t+1.75)+0.23*cos(2*pi*885*t+1.49)+0.42*cos(2*pi*1167*t-0.66);
subplot(311),hold on,plot(t,z,'g--'),
subplot(313),Zf=fft(x);plot(abs(Zf)*2/N), ylabel('Spectrul semnalului z')


pause(1)

%%%%%%%%%%%%%%%% Procesare Voce Codruta Alesutan Maria
[y,Fs] = audioread('B_AlesutanCodrutaMaria.m4a');
N=2000;n=[0:N-1];x=y(8000+n)';Xf=fft(x);k1=[173 217 286];
AmplitudiniRezultateACM=abs(Xf(k1))*2/N;
FazeRezultateACM=angle(Xf(k1));

%%%%%%%%%%%%%%%% Procesare Voce Filip Andrei
[y,Fs] = audioread('B_FilipAndrei.m4a');
N=2000;n=[0:N-1];x=y(8000+n)';Xf=fft(x);k1=[173 217 286];
AmplitudiniRezultateFA=abs(Xf(k1))*2/N;
FazeRezultateFA=angle(Xf(k1));

%%%%%%%%%%%%%%%% Procesare Voce Cuciorva Cosmin
[y,Fs] = audioread('B_CuciorvaCosmin.m4a');
N=2000;n=[0:N-1];x=y(8000+n)';Xf=fft(x);k1=[173 217 286];
AmplitudiniRezultateCCD=abs(Xf(k1))*2/N;
FazeRezultateCCD=angle(Xf(k1));

%%%%%%%%%%%%%%%% Procesare Voce Darie Dragos
[y,Fs] = audioread('B_DarieDragosMihai.m4a');
N=2000;n=[0:N-1];x=y(8000+n)';Xf=fft(x);k1=[173 217 286];
AmplitudiniRezultateDDM=abs(Xf(k1))*2/N;
FazeRezultateDDM=angle(Xf(k1));

%%%%%%%%%%%%%%%% Procesare Ujica Alexandru
[y,Fs] = audioread('B_UjicaAlexandru.m4a');
N=2000;n=[0:N-1];x=y(8000+n)';Xf=fft(x);k1=[173 217 286];
AmplitudiniRezultateUA=abs(Xf(k1))*2/N;
FazeRezultateUA=angle(Xf(k1));


%%%%%%%%%%%%%%%% Procesare ALL
[y,Fs] = audioread('B_All.m4a');
N=2000;n=[0:N-1];x=y(8000+n)';Xf=fft(x);k1=[173 217 286];
AmplitudiniRezultateALL=abs(Xf(k1))*2/N;
FazeRezultateALL=angle(Xf(k1));




pause(2)

if AR == AmplitudiniRezultateACM
    if FR == FazeRezultateACM
        ZZ=['Vocea in apartine la Alesutan Codruta Maria']; disp(ZZ);
        figure
        SelectieStudent(1)
    end
end

if AR == AmplitudiniRezultateFA
    if FR == FazeRezultateFA
         ZZ=['Vocea in apartine lui Filip Andrei']; disp(ZZ);
        figure
        SelectieStudent(2)
    end
end

if AR == AmplitudiniRezultateCCD
    if FR == FazeRezultateCCD
          ZZ=['Vocea in apartine lui Cuciorva Cosmin Dumitru']; disp(ZZ);
        figure
        SelectieStudent(3)
    end
end

if AR == AmplitudiniRezultateDDM
    if FR == FazeRezultateDDM
        ZZ=['Vocea in apartine lui Darie Dragos Mihai']; disp(ZZ);
        figure
        SelectieStudent(4)
    end
end

if AR == AmplitudiniRezultateALL
    if FR == FazeRezultateALL
        ZZ=['Vocea in apartine tuturora']; disp(ZZ);
        figure
        SelectieStudent(6)
    end
end

if AR == AmplitudiniRezultateUA
    if FR == FazeRezultateUA
        ZZ=['Vocea in apartine lui Ujica Alexandru']; disp(ZZ);
        figure
        SelectieStudent(5)
    end
end
end