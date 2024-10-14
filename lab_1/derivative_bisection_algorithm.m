function [result, a, b, k] = derivative_bisection_algorithm(f, a1, b1, lambda)

    result = nan;
    a = a1;
    b = b1;
    f_derivative = diff(f);
    n = 1;
    while 1
        if (1/2)^n <= lambda/(b1 - a1)
            break;
        else
            n = n+1;
        end
    end
    
    for k = 1:n
        x1(k) = (a(k) + b(k))/2;
        f_derivative_x1k = subs(f_derivative, x1(k));
        
        if abs(f_derivative_x1k) < 10^(-4)    %practically zero
            result = x1(k);
            break;
        elseif f_derivative_x1k > 0
            a(k+1) = a(k);
            b(k+1) = x1(k);
        elseif f_derivative_x1k < 0
            b(k+1) = b(k);
            a(k+1) = x1(k);
        end
    end   
    if isnan(result)    % if f_derivative(x1(k)) was calculated to not be 0 give an interval as result
        result = [a(k), b(k)];
    end
end
       
