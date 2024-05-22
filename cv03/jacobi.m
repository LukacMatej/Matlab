function [x,flag,rr,it,rv] = jacobi(A,b,tol,maxit)
  n = size(A,1);
  x = b;
  rv(1) = norm(b-A*x);
  rr = rv(1)/norm(b);
  for i = 1:maxit
    it = i;
    last = x;
    for j = 1:n
      sum = A(j, :) * last - A(j, j) * last(j);
      x(j) = (b(j) - sum) / A(j, j);
    end
    rv(i+1) = norm(b-A*x);
    rr = rv(i+1)/ norm(b);
    if isnan(rr) || isinf(rr)
      flag=4;
      return;
    end
    if rr < tol
      flag = 0;
      return;
    end
  end
  flag = 1;
end