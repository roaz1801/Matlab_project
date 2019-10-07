%FIR 1
h1 = [0.0002, 0.0001, -0.0001, -0.0005, -0.0011, -0.0017, -0.0019, ...
    -0.0016, -0.0005, 0.0015, 0.0040, 0.0064, 0.0079, 0.0075, 0.0046, ...
    -0.0009, -0.0084, -0.0164, -0.0227, -0.0248, -0.0203, -0.0079, ...
    0.0127, 0.0400, 0.0712, 0.1021, 0.1284, 0.1461, 0.1523, 0.1461, ...
    0.1284, 0.1021, 0.0712, 0.0400, 0.0127, -0.0079, -0.0203, -0.0248, ...
    -0.0227, -0.0164, -0.0084, -0.0009, 0.0046, 0.0075, 0.0079, 0.0064, ...
    0.0040, 0.0015, -0.0005, -0.0016, -0.0019, -0.0017, -0.0011, ...
    -0.0005, -0.0001, 0.0001, 0.0002];
%FIR 2
h2 = [-0.0002, -0.0001, 0.0003, 0.0005, -0.0001, -0.0009, -0.0007, ...
    0.0007, 0.0018, 0.0005, -0.0021, -0.0027, 0.0004, 0.0042, 0.0031, ...
    -0.0028, -0.0067, -0.0023, 0.0069, 0.0091, -0.0010, -0.0127, ...
    -0.0100, 0.0077, 0.0198, 0.0075, -0.0193, -0.0272, 0.0014, 0.0386, ...
    0.0338, -0.0246, -0.0771, -0.0384, 0.1128, 0.2929, 0.3734, 0.2929, ...
    0.1128, -0.0384, -0.0771, -0.0246, 0.0338, 0.0386, 0.0014, -0.0272, ...
    -0.0193, 0.0075, 0.0198, 0.0077, -0.0100, -0.0127, -0.0010, 0.0091, ...
    0.0069, -0.0023, -0.0067, -0.0028, 0.0031, 0.0042, 0.0004, -0.0027, ...
    -0.0021, 0.0005, 0.0018, 0.0007, -0.0007, -0.0009, -0.0001, 0.0005, ...
    0.0003, -0.0001, -0.0002];

%Vi m� ha to forskjellige t vektorer for � f� plottet filtrene
%Vi vet at tiden er p� 6s.
t1 = linspace(0,6,57);
t2 = linspace(0,6,73);

fs = 100; %Samplingsfrekvens
N = 1000; %Antall punkter

%{
%Plott av filterene m.h.p tid. 
figure
plot(t1,h1,t2,h2)
title('Filter vs Tid')
xlabel('Tid')
ylabel('Filterverdi')
legend('h1','h2')

%Frekvensspekter av de to filtrene
[H1,fh1] = frekspekin3190(h1,N,fs);
[H2,fh2] = frekspekin3190(h2,N,fs);

%Plotter frekvensspektrene til de to
%filtrene i ett plott.
figure
plot(fh1,20*log(abs(H1)),fh2,20*log(abs(H2)))
title('Frekvensspekter av filtrene')
xlabel('Frekvens(dB)')
ylabel('Amplitude')
legend('H1_{dB}(e^{jw})','H2_{dB}(e^{jw})')
%}
%Oppgave 2b


t = linspace(0,6,1501);
n = 200;

%{
N=500;
t0=tukeywin(N,0);                 %Equivalent to rectangular window
t25=tukeywin(N,0.25);
t5=tukeywin(N);                   %r=0.5
t75=tukeywin(N,0.75);
t1=tukeywin(N,1);                 %Equivalent to Hann window
%}

%[Xse,fse] = frekspekin3190(seismogram1,1000,fs)
seismog1 = seismogram1(1:n+450,1:n);
[Xseis1,fseis1] = frekspekin3190(seismog1,N,fs);
[Xseis2,fseis2] = frekspekin3190(seismogram1(t > 0.5 & t < 1.5, 1:5),N,fs);
figure
imagesc(seismogram1)
colormap gray
colorbar

%plot(fse,abs(Xse))

figure
plot(fseis1,20*log10((abs(Xseis1))))

figure
plot( t(t > 0.5 & t < 1.5), seismogram1(t > 0.5 & t < 1.5, 1:5));


%Oppgave 2c

%{
title('Plott av h1(t) og h2(t)')
xlabel('Tid')
ylabel('Amplitude')


title('Offset vs Tid')
xlabel('Offset')
ylabel('Tid')
%}
%plot(t,y1)

y2 = zeros(1501,657); 
%y_2(1,:) = konvin3190(h1,seismogram1(1,:),1);
for i = 1501
    y2(i,:) = konvin3190(h1,seismogram1(i,:),1);
end

figure
imagesc(y2)
colormap gray
colorbar


%y2 = konvin3190(h2,seismogram1,1);
%contourf(seismogram1(100:n+500,1:100));
%set(gca, 'YDir','reverse')

%plot(t,seismogram1)



