function [a, b, f_iterations] = fibonacci_algorithm(f, a1, b1, l, epsilon)
    

    a = a1;
    b = b1;
    n = 1;
    while 1
        
        if fibonacci(n) > (b1 - a1)/l
            break;
        else 
            n = n + 1;
        end
    end

    x1(1) = a1 + (fibonacci(n-2)/fibonacci(n)) * (b1 - a1);
    x2(1) = a1 + (fibonacci(n-1)/fibonacci(n)) * (b1 - a1);
    f(x1(1));
    f(x2(1));
    f_iterations = 2;

    for k = 1:n-2
        disp(k)
        if k == n-2
            
            if f(x1(n-2)) > f(x2(n-2))
                a(n-1) = x1(n-2);
                b(n-1) = b(n-2);
            else
                a(n-1) = a(n-2);
                b(n-1) = x2(n-2);
            end
            
            break;
        end
        if f(x1(k)) > f(x2(k))
            a(k+1) = x1(k);
            b(k+1) = b(k);
            x1(k+1) = x2(k);
            x2(k+1) = a(k+1) + fibonacci(n-k-1)/fibonacci(n-k)*(b(k+1) - a(k+1));
            
            f(x2(k+1));
            

            
        else
            a(k+1) = a(k);
            b(k+1) = x2(k);
            x2(k+1) = x1(k);
            x1(k+1) = a(k+1) + fibonacci(n-k-2)/fibonacci(n-k)*(b(k+1) - a(k+1));
            
            f(x1(k+1));
            
        end
        f_iterations = f_iterations + 2;
    end
end