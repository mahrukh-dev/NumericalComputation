function NewtonRaphsonMethod()

% fun = 2*sin(x)-x
% initial guess = 1.5
% iterations = 3
% tol = 10^-3
% root = 1.895622

fun = input('Please enter your function', 's');
x(1) = input('enter initial guess');
iter = input('enter max no of iteration');
tol = input('enter tolerence');
f = inline(fun);
der = diff(str2sym(fun)); % Use str2sym to convert the function string to a symbolic expression
d = inline(char(der));    % Convert the symbolic expression to a function handle
disp('i     x(i+1)     err(i)')

for i = 1:iter
    x(i+1) = x(i) - (f(x(i)) / d(x(i)));
    err(i) = abs(x(i+1) - x(i));
    fprintf('%i       %f       %f\n', i, x(i+1), err(i))
    if err(i) < tol
        break
    end
end

end
