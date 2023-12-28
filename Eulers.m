function Eulers()

fun = input('Enter Function: ', 'S');
f = inline(fun);

a = input('Enter Lower limit: ');
b = input('Enter Higher limit: ');
h = input('Enter stepsize: ');
y0 = input('Enter initial value: ');

m =(b-a)/h;
y = zeros(1, m+1);

x=a:h:b;
y(1)=y0;

for n=1:m
    y(n+1)=y(n)+h*f(x(n),y(n));
end

fprintf('i     x      y \n');
for i=1:n
    fprintf('%i %f %f \n',i, x(i), y(i));
end

plot(x,y);

end