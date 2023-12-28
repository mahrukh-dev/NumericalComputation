function y = BesselsFormula()
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
    
    % Perform Bessel interpolation
    n = length(table_x);
    d = zeros(n, n);

    % Populate the first column of the divided differences table
    for i = 1:n
        d(i, 1) = table_y(i);
    end

    % Populate the rest of the divided differences table
    for j = 2:n
        for i = 1:n-j+1
            d(i, j) = (d(i+1, j-1) - d(i, j-1))/(table_x(i+j-1) - table_x(i));
        end
    end

    % Initialize the interpolated value
    y = d(1, 1);

    % Calculate the interpolated value using the Bessel interpolation formula
    for j = 2:n
        term = 1;
        for k = 1:j-1
            term = term * (x - table_x(k));
        end
        y = y + d(1, j) * term;
    end

    % Display the result
    fprintf('Interpolated value at x = %f is y = %f\n', x, y);
end
