importfile(newdata1)

[X1,f1] = frekspekin3190(h1,1000,fs)
[X2,f2] = frekspekin3190(h2,1000,fs)

t = 1000;
n1 = linspace(0,t,57)
n2 = linspace(0,t,73)
figure
plot(n1,h1,n2,h2)
title('Plott av h1(t) og h2(t)')
xlabel("Tid")
ylabel("Amplitude")



figure
subplot(2,1,1);
plot(f1,20*log10(abs(X1)))
title('Frekvensspekter av h1')
xlabel('Frekvens')
ylabel('Amplitude')

subplot(2,1,2);
plot(f2,20*log10(abs(X2)))
title('Frekvensspekter av h2')
xlabel('Frekvens')
ylabel('Amplitude')



