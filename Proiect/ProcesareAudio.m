function pr = ProcesareAudio()
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

end