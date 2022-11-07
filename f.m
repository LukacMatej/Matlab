function z = f(x,y)
switch nargin
    case 1
        y=0;
end
z = x.*exp(1).^(-x.^2-y.^2) + tanh(x.*y)
end