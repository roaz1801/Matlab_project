function y = konvin3190(h,x,ylen)
%konvin3190 Konvolverer to signaler
%   konvin3190(h,x,ylen) konvolverer de to vektor-signalene h og x.
%   Dersom ylen = 0 er utgangssignalet lengde length(x), mens hvis ylen 
%   er 1 har utgangssignalet lengde length(h)+length(x)-1
   
    N = length(x); %Lengde til x
    M = length(h); %Lengde til h   
    %Lager to instanser der man kan sette ylen=1 eller 0
    if ylen == 1
        y = zeros(M+N-1,1); %Lengde på y
        for m = 1:M
            for n = 1:N
                k = n+m-1;
                y(k) = y(k) + h(m)*x(n); %Konvolverer
            end
        end      
    end
      
    
    if ylen == 0
        y = zeros(N,1); %Lengde på y
        for m = 1:M
            for n = 1:N-M+1
                k=n+m-1;
                y(k) = y(k) + h(m)*x(n); %Konvolverer
            end
        end
    end
   
end

        


        

