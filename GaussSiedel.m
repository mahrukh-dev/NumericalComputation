function GaussSiedel()

% a = [4,1,-1;1,-5,-1;2,-1,-6]
% b = [13;-8;-2]
% tol = 10^-3
% initial guess = [0;0;0]
%max iter = 3

    % Get input from users
    a = input('Enter the coefficient matrix a: ');
    b = input('Enter the column vector b: ');
    max_iter = input('Enter the maximum number of iterations: ');
    tol = input('Enter the tolerance: ');

    % Determine the size of the system
    n = length(b);
    
    % Initialize the solution vector
    x = zeros(n, 1);

    % Iterative process
    for k = 1:max_iter
        % Store the previous solution vector
        p = x;
        
        % Update each component of the solution vector
        for j = 1:n
            x(j) = (b(j) - a(j, j+1:n) * x(j+1:n) - a(j, 1:j-1) * x(1:j-1)) / a(j, j);
        end

        % Calculate the error between consecutive solutions
        err = norm(p - x, inf);

        % Display the current iteration and the updated solution
        fprintf('Iteration %d: x = %s\n', k, mat2str(x));

        % Check for convergence
        if err < tol
            disp('Converged.');
            break;
        end
    end
end
