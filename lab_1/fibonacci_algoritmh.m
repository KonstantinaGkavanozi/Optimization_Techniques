function [a, b, f_iterations] = fibonacci_algoritmh(f, a1, b1, l, epsilon)
    

    a = a1;
    b = b1;

    while 1
        n = 1;
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

    k = 1;

    if fx1(k) > fx2(k)
        a(k+1) = x1(k);
        b(k+1) = b(k);
        x1(k+1) = x2(k);
        x2(k+1) = a(k+1) + fibonacci(n-k-1)/fibonacci(n-k)*(b(k+1) - a(k+1));
        while k == n-2
            x1(n) = x1(n-1);
            x2(n) = x1(n-1) + epsilon;
            if f(x1(n)) > f(x2(n))
                a(n) = x1(n);
                b(n) = b(n-1);
            else
                a(n) = a(n-1);
                b(n) = x2(n);
                break;                
            end
        
        end
        
        f(x2(k));
        k = k + 1;
        

    else
        a(k+1) = a(k);
        b(k+1) = x2(k);
        x2(k+1) = x1(k);
        x1(k+1) = a(k+1) + fibonacci(n-k-2)/fibonacci(n-k)*(b(k+1) - a(k+1));

        while k == n-2
            x1(n) = x1(n-1);
            x2(n) = x1(n-1) + epsilon;
            if f(x1(n)) > f(x2(n))
                a(n) = x1(n);
                b(n) = b(n-1);
            else
                a(n) = a(n-1);
                b(n) = x2(n);
                break;                
            end
         
        end

        f(x1(k+1));
        k = k + 1;
    end
    f_iterations = k;
end
