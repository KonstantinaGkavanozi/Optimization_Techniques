function [min, k, x, y] = steepest_descent(f, x1, y1, gamma, epsilon)
    f_gradient = jacobian(f);
    K_MAX = 1000;
    x(1) = x1;
    y(1) = y1;

    for k = 1:K_MAX
        if norm(f_gradient(x(k), y(k))) < epsilon
            min = [x(k), y(k)];
            return;
        else
            d = - f_gradient(x(k),y(k));
            x(k+1) = x(k) + gamma*d(1);
            y(k+1) = y(k) + gamma*d(2);
        end
    end

    min = nan;

end