function [x,res,k] = newton_diff(f,x0,x1,tol,maxit)
    k = 0;
    while k < maxit
        k = k + 1;
        dx = x1 - f(x1) / ((f(x1) - f(x0)) / (x1 - x0));
        if abs(f(dx)) < tol
            break;
        end
        x0 = x1;
        x1 = dx;
    end
    x = dx;
    res = abs(f(dx) / f(x1));
end