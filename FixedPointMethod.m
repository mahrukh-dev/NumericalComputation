function FixedPointMethod()

fun=input('Enter Function:','s');
x(1)=input('Enter Inital Guess:');
max_itr=input('Enter maximum no of iterations:');
tol=input('Enter Tolerance:');
g=inline(fun);
disp('i       x(i+1)      err(i)')
for i=1:max_itr
    x(i+1)=g(x(i));
    err(i)=abs(x(i+1)-x(i));
    fprintf('%i   %f      %f\n',i,x(i+1),err(i));
    if err(i) < tol
        disp('Converged...');
        break
    end
end
root=x(i+1)
end