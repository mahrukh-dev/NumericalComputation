function JacobIterativeMethod()
% a = [4,1,-1;1,-5,-1;2,-1,-6]
% b = [13;-8;-2]
% tol = 10^-3
% initial guess = [0;0;0]
%max iter = 3
    a = input('Enter the coefficient matrix a: ');
    b = input('Enter the column vector b: ');
    tol = input('Enter the tolerance: ');
    p = input('Enter the initial guess vector p: ');
    max_iter = input('Enter the maximum number of iterations: ');

    n = length(b);
    x = zeros(n, 1);

    for k = 1:max_iter
        p = x;
        for j = 1:n
            x(j) = (b(j) - a(j, 1:j-1) * p(1:j-1) - a(j, j+1:n) * p(j+1:n)) / a(j, j);
        end

        err = norm(p - x, inf);

        fprintf('Iteration %d: x = %s\n', k, mat2str(x));

        if err <= tol
            disp('Converged.');
            break;
        end
    end
end
