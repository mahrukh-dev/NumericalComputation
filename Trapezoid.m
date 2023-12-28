function [ area ] = Trapezoid( f, a, b, h, n)

fun = input('Enter Function: ', 'S');
f = inline(fun);

a = input('Enter Lower limit: ');
b = input('Enter Higher limit: ');
h = input('Enter stepsize: ');
n = (b-a)/h;

for i = 1 : n
    x(i) = a + i * h;
end

s1 = f(a);
s2 = f(b);
s = 0;

for i = 1:n-1
    s = s + f(x(i));
end

area = (h / 2) * (s1 + s2 + 2 * s);

end