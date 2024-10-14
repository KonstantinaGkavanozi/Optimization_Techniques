function [min_point, k, x, y, m_k] = levenberg_marquardt(f, x1, y1, gamma, epsilon)
    f_jacobian = jacobian(f)';
    f_hessian = hessian(f);
    I = eye(2);
    
    MAX_K = 1000;   % maximum number of iterations
    x = x1;
    y = y1;
    
    for k = 1:MAX_K
        if norm(f_jacobian(x(k), y(k))) < epsilon
            min_point = [x(k), y(k)];
            return;
        else
             m_k(k) = calculate_m_k(f_hessian, x(k), y(k)); 
             
             array =  f_hessian(x(k), y(k)) + m_k(k)*I; % the tranformed positive definite hessian
             array_inv = inv(array);
             
             d = - array_inv * f_jacobian(x(k), y(k));
             x(k+1) = x(k) + gamma*d(1);
             y(k+1) = y(k) + gamma*d(2);
        end
    end
    min_point = nan;
end
