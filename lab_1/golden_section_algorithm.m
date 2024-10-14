function [a, b, f_iterations] = golden_section_algorithm(f, a1, b1, l)

    a(1) = a1;
    b(1) = b1;
   
    k=1;
    gamma = 0.618;
    
    x1(k) = a1 + (1 - gamma) * (b1 - a1);
    x2(k) = a1 + gamma * (b1 - a1);
    f(x1(1));
    f(x2(1));

    

    while 1
        if b(k) - a(k) < l
            break;
        end
        if f(x1(k)) > f(x2(k))
            a(k+1) = x1(k);
            b(k+1) = b(k);
            x2(k+1) = a(k+1) + gamma * (b(k + 1) - a(k + 1));
            x1(k+1) = x2(k);
            f(x1(k+1));
            k = k + 1;
        else
            a(k+1) = a(k);
            b(k+1) = x2(k);
            x2(k+1) = x1(k);
            x1(k+1) = a(k+1) + (1 - gamma) * (b(k + 1) - a(k + 1));
            f(x2(k+1));
            k = k + 1;
        end
    end
    f_iterations = k;
end