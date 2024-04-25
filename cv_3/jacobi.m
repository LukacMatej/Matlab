function [x,flag,rr,it,rv] = jacobi(A,b,tol,maxit)
n = size(A,1);
x = zeros(n,1);
xold=x;
rr = zeros(maxit,1);
rv = zeros(maxit,1);
for it = 1:maxit
	for i = 1:n
        x(i) = (b(i) - A(i,1:i-1)*x(1:i-1) - A(i,i+1:n)*xold(i+1:n)) / A(i,i);
    end
    if rr(it) < tol
        flag = 0;
        rr = rr(1:it);
        rv = rv(1:it);
        return
    end
    rv(it) = norm(b-A*x);
    rr(it) = rv(it) / norm(b);
    xold=x;
end
flag = 1;
rr = rr(1:it);
rv = rv(1:it);
end