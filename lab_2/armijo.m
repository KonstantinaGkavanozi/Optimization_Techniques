function [gamma, x2, y2] = armijo(f, f_jacobian, x1, y1, d, alpha, beta, s)
    m = 0;
    gamma = s*beta^m;
    x2 = x1 + gamma*d(1);
    y2 = y1 + gamma*d(2);
    while double(f(x1, y1) - f(x2, y2)) < alpha*beta^m*s*(d)'*f_jacobian(x1, y1)
        gamma = s*beta^m;
        x2 = x1 + gamma*d(1);
        y2 = y1 + gamma*d(2);
        m = m+1;
    end
end