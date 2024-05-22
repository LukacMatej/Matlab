function [t,y] = euler_imp(f,a,b,y0,h)
    t = a:h:b;
    n = length(t)-1;
    y = zeros(1,n+1);
    y(1) = y0;
    for i = 1:n
        y(i+1) = y(i)+h*f(t(i + 1), y(i) + h * f(t(i), y(i)));
    end
end
