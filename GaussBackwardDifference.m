function result = GaussBackwardDifference()
%central diff interpolation
    x = input('Enter x values as a row vector: '); % Example input: [2 4 6 8 10 12 14]
    y = input('Enter f values as a row vector: '); % Example input: [23 93 259 569 1071 1813 2843]
    xp = input('Enter required xp: '); % Example input: 9

    rows = length(x);
    
    cols = rows + 1;

    h = x(2) - x(1);
    f = zeros(rows, cols);

    % Add data to the table
    for i = 1:rows
        f(i, 1) = x(i);
        f(i, 2) = y(i);
    end

    % Find the deltas
    n = 1;
    for j = 3:cols
        for i = rows:-1:n+1
            f(i, j) = f(i, j-1) - f(i-1, j-1);
        end
        n = n + 1;
    end

    % Find the y0
    p = 0;
    for i = rows:-1:1
        temp = (xp - x(i)) / h;
        if ((temp > 0) && (temp < 1))
            p = temp;
            x0 = i;
        end
    end

    % Calculate the backward difference
    y0 = f(x0, 2);
    r = 1;
    n = 1;
    for i = 2:rows
        r = r * (p - i + 2);
        if (x0 + n > rows)
            break;
        end
        y0 = y0 + (r * (f(x0 + n, i + 1) / factorial(i - 1)));
        n = n + 1;
    end

    result = y0;
end
