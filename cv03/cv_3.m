tol=1e-7;
maxit=1000;
A = full(gallery('poisson',5));
b = sum(A,2);
[x,flag,rr,it,rv] = jacobi(A,b,tol,maxit);
[x,flag,rr,it,rv] = gauss_seidel(A,b,tol,maxit);
[x,flag,rr,it,rv] = pcg(A,b,tol,maxit);
plot(0:it,rv)
saveas(gcf,'graph_poisson','png')
% 
A = full(gallery('lehmer',20));
b = sum(A,2);
[x,flag,rr,it,rv] = pcg(A,b,tol,maxit);
plot(0:it,rv)
saveas(gcf,'graph_lehmer','png')
% 
A = full(gallery('dorr',5));
b = sum(A,2);
[x,flag,rr,it,rv] = pcg(A,b,tol,maxit);
if flag == 1
    it = maxit;
end
plot(0:it,rv)
saveas(gcf,'graph_dorr','png')
% 