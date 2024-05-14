function [x, M] = find_int_roots(p)
x = [];
M = p;
k = divisors(M(end));
k = [-k, k];

k = unique(k);
if (size(p,2) == 1)
    x = [];
    M = [];
    return;
end
i = 1;
while i <= size(k,2)
    if (size(p,2) == 1)
        return;
    end
    curr_root = k(i);
    curr_array = [p(1)];
    for j=1:size(p,2)
        num = curr_root * curr_array(j) + p(j+1);
        curr_array(end+1) = num;
        if(j == size(p,2)-1)
            break;
        end
    end
    i = i+1;

    if(curr_array(end) == 0)
        x = [x; curr_root];
        curr_array(end) = [];
        M = [M; [zeros(1,size(M,2)-size(curr_array,2)), curr_array]];
        p = curr_array;
        k = divisors(p(end));
        k = [-k, k];
        k = unique(k);
        i = 1;
    end
end
end