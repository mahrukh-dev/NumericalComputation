function SimpsonsThreeEight()
fun = input('Enter Function: ', 'S');
f = inline(fun);

a = input('Enter Lower limit: ');
b = input('Enter Higher limit: ');
h = input('Enter stepsize: ');
n = (b-a)/h;

s1 = f(a);
s2 = f(b);
s3 = 0;
s4 = 0;

for i = 1:n-2
    x = a + i * 2 * h;
    if x >= b
        break;
    end
    s3 = s3 + f(x);
end

for i = 1:n-1
    z = a + (i * 2 - 1) * h;
    if z > b
        break;
    end
    s4 = s4 + f(z);
end

area = ((3 * h) / 8) * (s1 + s2 + 3 * s4 + 2 * s3)

end