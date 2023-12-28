function [c] = BisectionMethod()
%function [c] = Bisect(a,b,f,tol, max_iter)
%BISECTION METHOD
%Inputs: a(interval start), b(interval end), function, tolerance, max_iteration
%Output: c(root)

%func = x*sin(x)-1
% a = 0
% b = 2
% tol = 10^-3
% iterations can vary
% root = 1.1143

func = input('Please enter function', 's');
f = inline(func);
a = input('Please enter initial value');
b = input('Please enter end value');
tol = input('Please enter tolerance');
max_iter = input('Please enter no of iterations');

for index = 1:max_iter
    c=(a+b)/2; %midpoint 
    if(f(a)*f(c)<0)
        b = c;
    end
    if(f(b)*f(c)<0)
        a=c;
    end
    if(abs(f(c))<tol)
        break;
    end
    
%     err = abs(b-a);
%     if(err<tol)
%     
%     end
    
end

end

