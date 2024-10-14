function [min_x, min_val] = calculate_minimum()
    % Define the function
    f = @(x) x^3 * exp(-x^2 - y^4);

    % Initial guess
    x_initial = 0;

    % Use fminsearch to find the minimum
    min_x = fminsearch(f, x_initial);
    min_val = f(min_x);
end