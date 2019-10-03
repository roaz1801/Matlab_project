
f1 = 10 %Frekvens 1
f2 = 20 %Frekvens 2
fs = 100 %Samplingsfrekvens 
t = [0:1/fs:5] %Time duration
t1 = [0:length(x)-1]*1/fs
t2 = [0:length(x)+length(h)-2]*1/fs

x = sin(2*pi*f1*t)+sin(2*pi*f2*t)

h = [0.2,0.2,0.2,0.2,0.2]

y = konvin3190(h,x,0)

[X,f] = frekspekin3190(x,1000,fs)

%z = conv(h,x)
%plot(f,X)
plot(f,abs(X))
%freqz(x)




