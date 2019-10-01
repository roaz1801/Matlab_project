function y = konvin3190(h,x,ylen)
    N = length(x); %Lengde til x
    M = length(h); %Lengde til h
    %Lager to instanser der man kan sette ylen=1 eller 0
    if ylen == 1
        y = zeros(M+N-1,1);
        for m = 1:M
            for n = 1:N
                k = n+m-1
                y(k) = y(k) + h(m)*x(n);
            end
        end
    end
    
%Fungerer ikke akkurat nå for 0    
    if ylen == 0
        y = zeros(N,1);
        for m = 1:M
            for n = 1:N
                k = n+m-1
            end
            y(k) = y(k) + h(m)*x(n);
        end
    end
end

        

