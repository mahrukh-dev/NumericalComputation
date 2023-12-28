function NewtonForwardDifferenceInterpolation()
% This function performs Newton's forward interpolation.

% Input the values of x, y, and xp
x = input('Enter x: ');
y = input('Enter f: ');
xp = input('Enter required xp: ');

% Calculate the number of data points
rows = length(x);
cols = rows + 1;

% Calculate the step size
h = x(2) - x(1);

% Initialize the forward difference table
f = zeros(rows, cols);

% Populate the table with data
for i = 1:rows
    f(i, 1) = x(i);
    f(i, 2) = y(i);
end

% Calculate the forward differences
for j = 3:cols
    for i = 1:rows - j + 2
        f(i, j) = f(i + 1, j - 1) - f(i, j - 1);
    end
end

% Find the value of p
p = 0;
for i = 1:rows
    temp = (xp - x(i)) / h;
    if (temp > 0 && temp < 1)
        p = temp;
        x0 = i;
    end
end

% Calculate the interpolated value at xp
y0 = f(x0, 2);
r = 1;
for i=2:rows
    r=r*(p-1+2);
    y0=y0 + (r* (f(x0,i+1)/factorial(i-1)));
    
end

% Display the results
disp(f);
fprintf('Interpolated value at xp: %f\n', y0);
end
  