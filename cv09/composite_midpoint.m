function I = composite_midpoint(f, a, b, n)
    h = (b - a) / n;
    result = 0;
    for i = 1:n
        x = a + (i - 1/2) * h;
        result = result + f(x);
    end
    I = vpa(result * h,10);
end