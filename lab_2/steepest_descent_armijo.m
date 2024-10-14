function [min_point, k, x, y, gamma] = steepest_descent_armijo(f, x1, y1, epsilon, alpha, beta, s)
    f_jacobian = jacobian(f);
    MAX_K = 1000;  % maximum number of iterations
    x = x1;
    y = y1;
    gamma = nan;
    for k = 1:MAX_K
        if norm(f_jacobian(x(k), y(k))) < epsilon
            min_point = [x(k), y(k)];
            return;
        else
            d = - f_jacobian(x(k), y(k));
            [gamma(k), x(k+1), y(k+1)] = armijo(f, f_jacobian, x(k), y(k), d, alpha, beta, s);
        end
    end
    min_point = nan;
end