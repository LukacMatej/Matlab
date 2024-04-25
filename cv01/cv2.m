for k = 1:n
    pivotace-najdi max(abs(A(k:n,k)))
    for i = k+1:n
        for j = k:n
            a(i,j) = a(i,j)-((a(i,k)/a(k,k))*a(k,j));
        end
    end
end