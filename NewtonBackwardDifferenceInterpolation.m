function NewtonBackwardDifferenceInterpolation()
%x: [2;4;6;8;10;12;14]
%f: [23;93;259;569;1071;1813;2843]
%xp: 11.8

x = input('Enter x: ');
y = input('Enter f: ');

xp = input('Enter required xp: ');

rows = length(x);
cols = rows+1;

h = x(2) - x(1);
f = zeros(rows, cols);

%add data to the table
for i = 1:rows
    f(i,1) = x(i);
    f(i,2) = y(i);
end

%find the deltas
n = 1;
for j = 3:cols
    for i = 1:rows-n
        f(i,j) = f(i+1, j-1) - f(i, j-1);
    end
    n = n + 1;
end

%find the y0
p = 0;
for i = rows:-1:1           %change from forward difference
    temp = (xp-x(i))/h;     %h = x(2) - x(1) - already computed above
    if((temp > 0 && temp < 1))
        p = temp;
        x0 = i;
    end
end

%final answer
y0 = f(x0, 2);              %y0 = f0 (2 = 2nd col)
r = 1;
n = 1
%x0-n
%n=4
for i = 2:rows
    %f(xo-n,i+1)
    %f(3,3)
    r = r * (p+i-2);        %change from forward difference
    if(x0 - n < 1)
        break;
    end
    y0 = y0 + (r*(f(x0 - n, i+1)/factorial(i-1)));
    n = n + 1;
end
x0
disp(f);
fprintf('Final answer is: %f\n', y0);

