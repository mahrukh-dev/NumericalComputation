function NewtonDividedDiffferenceInterpolation2()
x = input('Enter x: ');
y = input('Enter y: ');

xp = input('Enter required xp: ');

rows = length(y);
cols = rows + 1;
h = x(2) - x(1);

f = zeros(rows, cols);

for i = 1:rows
    f(i, 1) = x(i);
    f(i, 2) = y(i);
end

% Calculate the divided differences
for j = 3:cols
    for i = 1:rows - j + 2
        f(i, j) = f(i + 1, j - 1) - f(i, j - 1);
    end
end

p = 0;
for i = rows:-1:1
    temp = (xp - x(i)) / h;
    if (temp > 0 && temp < 1)
        p = temp;
        x0 = i;
    end
end

y0 = f(x0, 2);
r = 1;
n = 1;

for i = 2:rows
    r = r * (p + i - 2);
    if (x0 - n < 1)
        break;
    end
    y0 = y0 + (r * (f(x0 - n, i + 1) / factorial(i - 1)));
    n = n + 1;
end

disp('Divided Differences:');
disp(f);
fprintf('Final answer is: %f\n', y0);

end
