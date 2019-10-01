
f1 = 10 %Frekvens 1
f2 = 20 %Frekvens 2
fs = 100 %Samplingsfrekvens 
t = 5 %Time duration
n = [0:1/fs:t]
x = sin(2*pi*10*n)+sin(2*pi*20*n)
h = 1

y = konvin3190(h,x,1)

[X,f] = frekspekin3190(x,3,fs)

%z = conv(h,x)
plot(n,y)
%freqz(x)




