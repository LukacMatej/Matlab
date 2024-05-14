function [x,flag,rr,it,rv] = gauss_seidel(A,b,tol,maxit)
    x = NaN;
    xcurr = b;  
    xtotal = b;
    rv(1,1) = norm(b-A*xtotal);
    rr = norm(b-A*xtotal) / norm(b);
   
    for it = 1:maxit
      for i = 1:size(A, 1)
        xtemp = 0;
        for j = 1:i-1
          xtemp = xtemp + A(i, j) * xtotal(j);
        end
        xtemp2 = 0;
        for j = i+1:size(A, 1)
          xtemp2 = xtemp2 + A(i, j) * xtotal(j);
        end
        xtotal(i, 1) = (1/A(i,i)) * (b(i) - xtemp - xtemp2);
      end
      rv = [rv; norm(b-A * xtotal)];
      rr = norm(b-A * xcurr) / norm(b);
      if(isnan(rr) || isinf(rr))
        flag = 4;
        x = xcurr;
        return
      end
      if(rr < tol)
        flag = 0;
        x = xcurr;
        return
      end
      if(it == maxit)
        flag = 1;
        x = xcurr;
        return
      end
      xcurr = xtotal;
    end
  end