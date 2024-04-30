% Define the size of the matrix
n = 25;

% Create the Poisson matrix
A = gallery('poisson', n);

% Create the right-hand side vector
b = ones(n^2, 1);

% Set the initial guess for the solution
x0 = zeros(n^2, 1);

% Set the maximum number of iterations
maxIterations = 1000;

% Set the tolerance for convergence
tolerance = 1e-6;
% Initialize the vector to store the residual values
rv = zeros(maxIterations, 1);

% Perform the Jacobi iteration
x = x0;
for k = 1:maxIterations
    xNew = x;
    for i = 1:n^2
        xNew(i) = (b(i) - A(i, [1:i-1, i+1:end]) * x([1:i-1, i+1:end])) / A(i, i);
    end
    rv(k) = norm(b - A * xNew);
    if norm(xNew - x) < tolerance
        break;
    end
    x = xNew;
end

% Plot the residual values
figure;
plot(1:k, rv(1:k));
xlabel('Iteration');
ylabel('Residual Value');
title('Convergence of Jacobi Iteration');
% Display the solution
disp(x);