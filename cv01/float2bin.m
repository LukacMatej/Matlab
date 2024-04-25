function b = float2bin(number,dec_length)
    cela = floor(abs(number));
    desetina = mod(abs(number),cela);
    b = "";
    %cela
    while cela>0
        zbytek = mod(cela,2);
        b = zbytek+b;
        cela = floor(cela/2);
    end
    b = b + ".";
    %desetina
    for i = 1:dec_length
        desetina = desetina*2;
        if desetina>1
            zbytek = 1;
        else
            zbytek = 0;
        end
        desetina = mod(desetina,floor(desetina));
        b = b + zbytek;
    end
    if number<0
        b = "-" + b;
    end
end