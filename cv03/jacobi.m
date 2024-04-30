function [x,flag,rr,it,rv] = jacobi(A,b,tol,maxit)
n = size(A,1);
x = NaN;
x_cr = b;
x_new = b;
rv(1,1) = norm(b-A*x_new);
rr = norm(b-A*x_new)/norm(b);
for it = 1:maxit
  for i = 1:n
    sum1 = 0;
    for j = 1:n
      if j ~= i
        sum1 = sum1 + A(i, j) * x(j);
      end
    end
    x_new(i, 1) = (1/A(i, i)) * (b(i) - sum1);
  end
  rv = [rv; norm(b-A * x_new)];
  rr = rv;norm(b-A * x) / norm(b);
  if(isinf(rr))
    flag = 4;
    x = x_cr;
    return
  end
  if (rr < tol)
    flag = 0;
    x = x_new;
  end
  if it == maxit
    flag = 1;
    x = x_new;
  end
  x = x_new;
end
end