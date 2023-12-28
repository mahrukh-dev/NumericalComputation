function y = StirlingFormula()
    % Get user inputs for x, table_x, and table_y
    x = input('Enter the value of x for interpolation: ');
    table_x_str = input('Enter the values of table_x as a vector [x1, x2, ..., xn]: ', 's');
    table_y_str = input('Enter the values of table_y as a vector [y1, y2, ..., yn]: ', 's');
    
    % Convert input strings to numeric arrays
    table_x = str2num(table_x_str);
    table_y = str2num(table_y_str);

    % Check if the input vectors are of the same length
    if length(table_x) ~= length(table_y)
        error('Input vectors table_x and table_y must have the same length.');
    end
    
    % Perform Stirling interpolation
    n = length(table_x);
    d = zeros(n, n + 1);

    for i = 1:n
        d(i, 1) = table_y(i);
    end

    % Calculate the forward differences
    for j = 2:n+1
        for i = 1:n-j+1
            d(i, j) = d(i+1, j-1) - d(i, j-1);
        end
    end

    % Calculate the Stirling coefficients
    fact_den = factorial(0:n-1);
    stirling_coeff = zeros(n, n);

    for i = 1:n
        for j = 1:i
            stirling_coeff(i, j) = d(i, j) / (fact_den(j) * prod(x - table_x(1:i-1)));
        end
    end

    % Calculate the interpolated value
    y = d(1, 1);
    for j = 2:n
        term = 1;
        for k = 1:j-1
            term = term * (x - table_x(k));
        end

        y = y + stirling_coeff(j, j) * term;
    end

    % Display the result
    fprintf('Interpolated value at x = %f is y = %f\n', x, y);
end
