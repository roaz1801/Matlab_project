function [X,f] = frekspekin3190(x, N, fs)
    M = length(x)
    omega = (2*pi)/3
    f = [0:fs/2]
    for k = 1:M
        X(k) = abs(x(k)*exp((-i)*omega*k))
    end
end
