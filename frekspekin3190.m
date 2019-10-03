function [X,f] = frekspekin3190(x, N, fs)
    M = length(x);
    f_hat = [0:N-1]/N;
    f = f_hat*fs;
    X = zeros(N,1);
    for n = 1:N
        for k=1:M
        X(n) = X(n)+x(k)*exp((-i)*2*pi*f_hat(n)*k);
    end
end
