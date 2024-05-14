function [x,res,k] = newton(f,fp,x0,tol,maxit)
    k = 0;
    xk = x0;
    while k < maxit
        k = k + 1;
        xk1 = xk - f(xk) / fp(xk);
        res = abs(xk - xk1);
        if abs(f(xk)) < tol
            break;
        end
        xk = xk1;
    end
    x = xk;
end