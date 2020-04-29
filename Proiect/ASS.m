%%%%%%%%%%%%%%%% Amplitudini/faza/frecventa
[y,Fs] = audioread('B_FilipAndrei.m4a');
figure, plot([0:length(y)-1]/Fs,y),xlabel('t'),ylabel('x(t)'),title ('Semnal voce')
sound(y,Fs);
N=2000;
n=[0:N-1];
x=y(8000+n)';
figure,subplot(311),t=[0:N-1]/Fs;plot(t,x),axis([0 0.03 -1 1])
subplot(312),Xf=fft(x);plot(abs(Xf)*2/N),ylabel('Spectrul semnalului x')
k1=[173 217 286];
QQ=['amplitudini rezultate']; disp(QQ);
abs(Xf(k1))*2/N
QQ=['faze rezultate (radiani)']; disp(QQ);
angle(Xf(k1))
QQ=['frecvente rezultate (Hz)']; disp(QQ);
disp((k1-1)/N*Fs);
z=0.14*cos(2*pi*705*t+1.75)+0.23*cos(2*pi*885*t+1.49)+0.42*cos(2*pi*1167*t-0.66);
subplot(311),hold on,plot(t,z,'g--'),
subplot(313),Zf=fft(x);plot(abs(Zf)*2/N), ylabel('Spectrul semnalului z')