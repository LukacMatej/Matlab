function [x, M] = find_int_roots(p)
x = [];
n = length(p);
M = p;
iterate = true;
while iterate
    k = divisors(M(end,n));
    if (isempty(k))
        break;
    end
    k = [-k, k];
    iterate = false;
    for i = 1:length(k)
        sum = M(end,1);
        temp(1) = sum;
        for j = 2:n
            sum = sum * k(i) + M(end,j);
            temp(j) = sum;
        end
        if (sum == 0)
            x = [x;k(i)];
            n = n-1;
            M = [M;temp];
            iterate = true;
            break;
        end
    end
end