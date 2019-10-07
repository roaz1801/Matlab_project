f1 = 10; %Frekvens 1
f2 = 20; %Frekvens 2
fs = 100; %Samplingsfrekvens 
t = [0:1/fs:5]; %Time duration
h = [0.2,0.2,0.2,0.2,0.2]; %FIR filter fra oppgave 1
N = 5000; %Antall punkter for frekvensspekteret.
x = sin(2*pi*f1*t)+sin(2*pi*f2*t); %Signalet vi behandler

%Vi vil ha forksjellig lengde på t avhengi av om lengden vi velger på y.
t1 = [0:length(x)-1]*1/fs ;
t2 = [0:length(x)+length(h)-2]*1/fs;

%Konvolverer y, kan velge mellom ylen=1 eller 0.
y = konvin3190(h,x,0);

%Finner frekvensspekteret av de forksjellige signalene/filtrene
[Xh,fh] = frekspekin3190(h,N,fs);
[Xx,fx] = frekspekin3190(x,N,fs);
[Xy,fy] = frekspekin3190(y,N,fs);



%Plotter figurene
figure
plot(fh,abs(Xh))
title('Frekvensspekter av h')
xlabel('Frekvens')
ylabel('Amplitude')


figure
subplot(2,1,1);
plot(fy,abs(Xy))
title('Frekvensspekter av x og h konvolvert')
xlabel('Frekvens')
ylabel('Amplitude')


subplot(2,1,2);
plot(fx,abs(Xx))
title('Frekvensspekter av x signal')
xlabel('Frekvens')
ylabel('Amplitude')




