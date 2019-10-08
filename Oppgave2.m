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

%Frekvensspekter av 10 f�rste trasene
[Xseis1,fseis1] = frekspekin3190(seismogram1(t > 0.5 & t < 1.5, 1),N,fs);


t_array = t(t > 0.5 & t < 1.5);
L = 249;
t1 = tukeywin(L,1); 

tukey_seismogram = seismogram1(t > 0.5 & t < 1.5, 1).*t1;
%Frekvensspekter av 10 f�rste trasene
[Xseis2,fseis2] = frekspekin3190(tukey_seismogram,N,fs);

figure
subplot(2,1,1);
plot(fseis1,20*log(abs(Xseis1)))
title('Frekvensspekter av x og h konvolvert')
xlabel('Frekvens')
ylabel('Amplitude')

subplot(2,1,2);
plot(fseis2,20*log(abs(Xseis2)))
title('Frekvensspekter av x signal')
xlabel('Frekvens')
ylabel('Amplitude')

figure
subplot(2,1,1);
plot( t_array, seismogram1(t > 0.5 & t < 1.5, 1));
title('Frekvensspekter av x og h konvolvert')
xlabel('Frekvens')
ylabel('Amplitude')


subplot(2,1,2);
plot(t_array, tukey_seismogram);
title('Frekvensspekter av x signal')
xlabel('Frekvens')
ylabel('Amplitude')


%{
figure
imagesc(offset1,t*1000,seismogram1)
colormap gray
colorbar
%}


%plot(t, t_seismogram);
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

y1 = zeros(size(seismogram1));
y2 = zeros(size(seismogram1)); 

for i = 1:601
    y1(:,i) = konvin3190(h1,seismogram1(:,i),0);
end

for i = 1:601
    y2(:,i) = konvin3190(h2,seismogram1(:,i),0);
end

figure
imagesc(offset1,t*1000,y1)
colormap gray
colorbar
title('y1')
xlabel('Frekvens')
ylabel('Amplitude')

figure
imagesc(offset1,t*1000,y2)
colormap gray
colorbar
title('y2')
xlabel('Frekvens')
ylabel('Amplitude')

figure
imagesc(offset1,t*1000,seismogram1)
colormap gray
colorbar
title('Frekvensspekter av x signal')
xlabel('Frekvens')
ylabel('Amplitude')

%Plott av den f�rste trasen
figure
%plot(t, y1(1:1501, 1),t, y2(1:1501,1));
plot(t_array, y1(t > 0.5 & t < 1.5, 1),t_array,y2(t > 0.5 & t < 1.5, 1))
title('Frekvensspekter av x signal')
xlabel('Frekvens')
ylabel('Amplitude')



