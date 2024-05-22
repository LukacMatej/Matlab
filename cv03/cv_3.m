tol=1e-7;
maxit=1000;
A = full(gallery('poisson',5));
b = ones(size(A,1),1);
figure
hold on
[x,flag,rr,it,rv] = jacobi(A,b,tol,maxit);
if flag ~= 4
    plot(0:it,rv)
end
[x,flag,rr,it,rv] = gauss_seidel(A,b,tol,maxit);
if flag ~= 4
    plot(0:it,rv)
end
[x,flag,rr,it,rv] = pcg(A,b,tol,maxit);
if flag ~= 4
    plot(0:it,rv)
end
saveas(gcf,'graph_poisson.png')
% 
figure
hold on
A = full(gallery('lehmer',20));
b = ones(size(A,1),1);
[x,flag,rr,it,rv] = jacobi(A,b,tol,maxit);
if flag ~= 4
    plot(0:it,rv)
end
[x,flag,rr,it,rv] = gauss_seidel(A,b,tol,maxit);
if flag ~= 4
    plot(0:it,rv)
end
[x,flag,rr,it,rv] = pcg(A,b,tol,maxit);
if flag ~= 4
    plot(0:it,rv)
end
saveas(gcf,'graph_lehmer','png')
% 
figure
hold on
A = full(gallery('dorr',5));
b = ones(size(A,1),1);
[x,flag,rr,it,rv] = jacobi(A,b,tol,maxit);
if flag ~= 4
    plot(0:it,rv)
end
[x,flag,rr,it,rv] = gauss_seidel(A,b,tol,maxit);
if flag ~= 4
    plot(0:it,rv)
end
[x,flag,rr,it,rv] = pcg(A,b,tol,maxit);
if flag ~= 4
    plot(0:it,rv)
end
saveas(gcf,'graph_dorr','png')
% 