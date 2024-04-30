function [I,k] = adapt_trapz(f, a, b, maxlevel, tol)
h = b - a;
x = linspace(a, b, 3);
y = f(x);
I = h * (y(1) + 4*y(2) + y(3)) / 2;
k = 1;
while k < maxlevel
    x = linspace(a, b, 2^k + 1);
    y = f(x);
    I_new = h * sum(y(1:2:end-2) + 2*y(2:2:end-1) + y(3:2:end)) / (2^k * 2);
    if abs(I_new - I) < tol
        I = I_new;
        k = k + 1;
        break;
    end
    I = I_new;

end
end