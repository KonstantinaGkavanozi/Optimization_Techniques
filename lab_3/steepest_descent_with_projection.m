function [x, y, x_bar, y_bar] = steepest_descent_with_projection(f, x, y, x_bounds, y_bounds, s, gamma, epsilon)
    
    x = projection(x, x_bounds);
    y = projection(y, y_bounds);

    f_jacobian = jacobian(f);

    K_MAX = 5000;
    
    for k=1:K_MAX  
        if(norm(f_jacobian(x(k),y(k)))<epsilon)
            disp('The algorithm is terminated');
            return;
        else
            d = -f_jacobian(x(k),y(k));

            x_bar(k) = projection(x(k) + s*d(1), x_bounds);
            y_bar(k) = projection(y(k) + s*d(2), y_bounds);

            x(k+1) = x(k) + gamma*(x_bar(k)-x(k));
            y(k+1) = y(k) + gamma*(y_bar(k)-y(k));

            if abs(x(k+1) - x(k)) < 10^(-5) && abs(y(k+1) - y(k)) < 10^(-5)
                return
            end

        end
    end
end