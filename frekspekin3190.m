function [X,f] = frekspekin3190(x, N, fs)
%   [X,f] = frekspekin3190(x,N,fs) regner ut frekvensresponsen til
%   signalet x med samplingsfrekvens fs for N punkter på enhetssirkelen.
%   I tillegg til frekvensspekteret X returnerer den også tilhørende 
%   frekvens f.
    M = length(x); %Lengde til signal
    f_hat = [0:N-1]/N;  %Antall punkter
    f = f_hat*fs;   %Tilhørende frekvens til frekvensspekteret
    X = zeros(N,1); 
    %Vil bare ha halvparten av frekvensspekteret.
    for n = 1:N/2+1
        for k=1:M
        X(n) = X(n)+x(k)*exp((-i)*2*pi*f_hat(n)*k); %Fourier transform
    end
end