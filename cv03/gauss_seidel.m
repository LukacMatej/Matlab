function [x,flag,rr,it,rv] = gauss_seidel(A,b,tol,maxit)
  n = size(A,1);
  x = b;
  rv(1) = norm(b-A*x);
  rr = rv(1)/norm(b);
  for i = 1:maxit
    it = i;
    for j = 1:n
        sum1 = A(j, 1:j-1) * x(1:j-1);
        sum2 = A(j, j+1:n) * x(j+1:n);
        x(j) = (b(j) - sum1 - sum2) / A(j, j);
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