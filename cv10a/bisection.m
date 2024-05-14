function [x, res, k] = bisection(f, a, b, tol, maxit)
% if sign(f(a)) == sign(f(b))
%   error 'Bolzanova věta neplatí pro zadaný interval';
% end
k = 0; 
fa = f(a);
while k < maxit
  k = k + 1;
  xk = (a + b) / 2;
  fxk = f(xk);
  res = abs(fxk);
  if abs(fxk) < tol
    break;
  end
  if sign(fa) * sign(fxk) > 0
    a = xk;
  else
    b = xk;
  end
end
x = xk;
end