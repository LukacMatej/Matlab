function [x, res, k] = bisection(f, a, b, tol, maxit)
    % This function implements the bisection method to find a root of a function.
    
      % Check if initial interval has opposite signs
      if sign(f(a)) == sign(f(b))
        error('f(a) and f(b) must have opposite signs');
      end
    
      % Initialize variables
      k = 0; 
      fa = f(a);
      fb = f(b);
    
      % Loop until convergence or maximum iterations reached
      while abs(b - a) > tol && k < maxit
        k = k + 1;
        
        % Calculate midpoint
        c = (a + b) / 2;
        fc = f(c);
    
        % Update interval based on signs
        if sign(fa) * sign(fc) < 0
          b = c;
          fb = fc;
        else
          a = c;
          fa = fc;
        end
      end
    
      % Check if a root was found
      if k == maxit
        warning('Maximum iterations reached without convergence');
      end
    
      % Calculate root and relative residual
      x = (a + b) / 2;
      res = abs(f(x)) / (abs(a) + abs(b));
    end