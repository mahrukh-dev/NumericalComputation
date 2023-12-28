function RKFour()

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
    k1=h*f(x(n),y(n) );
    k2=h*f(x(n)+h/2,y(n)+k1/2);
    k3=h*f(x(n)+h/2,y(n)+k2/2);
    k4=h*f(x(n)+h,y(n)+k3);
    y(n+1)=y(n)+(1/6)*(k1+2*k2+2*k3+k4);

end

yexact=(x+1).^2-0.5*exp(x);
error=abs(yexact-y);
%fprint('Error: %f', error);



fprintf('i     x      y \n');
for i=1:n
    fprintf('%i %f %f \n',i, x(i), y(i));
end

plot(x,y);

end