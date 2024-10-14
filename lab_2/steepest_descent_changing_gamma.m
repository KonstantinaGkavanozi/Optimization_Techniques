function [min_point, k, x, y, gamma] = steepest_descent_changing_gamma(f, x1, y1, epsilon)
    syms sym_gamma; %symbolic gamma, used for the minimization of the pfi(gamma)
    
    f_gradient = jacobian(f);
    K_MAX = 1000;  % maximum number of iterations
    x = x1;
    y = y1;
    gamma = nan;
    for k = 1:K_MAX
        if norm(f_gradient(x(k), y(k))) < epsilon
            min_point = [x(k), y(k)];
            return;
        else
            d = - f_gradient(x(k), y(k));
            
%%%% check this
            values = f_gradient(x(k), y(k)); % values of f_jacobian at (x(k), y(k))
            gamma_fun = @(x, y)f(x(k) - sym_gamma*values(1), y(k) - sym_gamma*values(2)); % function for minimization
            gamma(k) = fminsearch(gamma_fun, 0);
            
            x(k+1) = x(k) + gamma(k)*d(1);
            y(k+1) = y(k) + gamma(k)*d(2);
        end
    end
    min_point = nan;
end