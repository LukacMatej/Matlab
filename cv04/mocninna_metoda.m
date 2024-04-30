function [vec, lambda] = mocninna_metoda(A, y0, tol, maxit)
    vec = y0 / norm(y0);
    lambda = 0;
    for i = 1:maxit
        mat = A * vec;
        lam = lambda;
        lambda = vec'*mat;
        if abs(lambda - lam) < tol
            break
        end
        vec = mat / norm(mat);
    end
    vec = vec(:,1);
    lambda = sum(lambda,1);
    lambda = lambda(end,1);
end