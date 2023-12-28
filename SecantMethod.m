function SecantMethod()

%func = cos(x) -x *exp(x)
% initial guess = 0
% second guess = 1
% iteraltion = 2
% root = 0.4467

fun = input('Enter Function: ', 'S');
f = inline(fun);
x0 = input('Enter first approximation: ');
x1 = input('Enter second approximation: ');

max_iter = input('Enter max_iter: ');
tol = input('Enter tolerance: '); %eg 3 dp

i = 0;
    y0 = f(x0);
    y1 = f(x1);
   
disp('i     x0     x1     x     f(x0)     f(x1)     f(x)     abs(x-x1)')
   
while i <= max_iter
    x = x1 - y1 * (x1 - x0) / (y1 - y0);


    fprintf('%i   %f   % f    % f   % f   % f   % f\n', i, x0, x1, x, f(x0), f(x1), f(x), abs(x-x1))
    if abs(x - x1) < tol
        output = x;
        break;
    end
       
    i = i + 1;
    x0 = x1;
    x1 = x;
    y0 = f(x0);
    y1 = f(x1);
end

end
