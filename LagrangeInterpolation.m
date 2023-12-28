function LagrangeInterpolation()
%x=[1,3,4,6]
%y=[4,7,8,11]

    % Get input for x values
    x_str = input('Enter x values as a vector [x1, x2, ..., xn]: ', 's');
    x = str2num(x_str);

    % Get input for y values
    y_str = input('Enter y values as a vector [y1, y2, ..., yn]: ', 's');
    y = str2num(y_str);

    % Check if the input vectors are of the same length
    if length(x) ~= length(y)
        error('Error: The length of x and y vectors must be the same.');
    end

    w = length(x);
    n = w - 1;
    l = zeros(w, w);
    
    for k = 1 : n + 1
        v = 1;
        for j = 1 : n + 1
            if k ~= j
                v = conv(v, poly(x(j))) / (x(k) - x(j));
            end
        end
        l(k,:) = v;
    end
    
    c = y * l;
    c

end
