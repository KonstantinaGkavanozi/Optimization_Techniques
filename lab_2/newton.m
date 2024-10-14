function [min_point, k, x, y] = newton(f, x1, y1, gamma, epsilon)
    f_jacobian = jacobian(f);
    f_hessian = hessian(f);
    K_MAX = 1000;  
    x = x1;
    y = y1;
    
    for k = 1:K_MAX
        if norm(f_jacobian(x(k), y(k))) < epsilon
            min_point = [x(k), y(k)];
            return; 
        else
            A = f_hessian(x(k), y(k));          
            d = - inv(A) * f_jacobian(x(k), y(k))';
            x(k+1) = x(k) + gamma*d(1);
            y(k+1) = y(k) + gamma*d(2);
        end
    end
    min_point = nan;
end