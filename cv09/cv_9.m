f1 = @(x) sin(x)./x;
n = [10,100,1000,10000,100000,1000000,10000000];
I = zeros(1, length(n));
I_ref = zeros(1, length(n));
for i = 1:length(n)
    I = composite_midpoint(f1, 0, 1, n(i));
    I_ref = integral(f1,0,1);
end

f2 = @(x) 2.*x + 1;
f3 = @(x) (1/2 + cos(x)).*sin(x);

[I2,k2] = adapt_trapz(f2, -1, 1, 1000, 1e-12)
[I3,k3] = adapt_trapz(f3, 0, 1, 1000, 1e-12);

I2_ref = integral(f2,-1,1);
I3_ref = integral(f3,0,1);