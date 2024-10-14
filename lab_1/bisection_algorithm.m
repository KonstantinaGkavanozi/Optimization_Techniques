function [solution, a, b, k] = bisection_algorithm(f, a1, b1, l, epsilon)
%This is the algorithm of the bisection method
%f is the objective function
    
    k = 1;
    a(k) = a1;
    b(k) = b1;
       
    while 1
        if abs(b(k) - a(k)) < l
            
            break;
        else
           
            x1(k) = (a(k) + b(k))/2 - epsilon;
            x2(k) = (a(k) + b(k))/2 + epsilon;
            if f(x1(k)) < f(x2(k))
                a(k+1) = a(k);
                b(k+1) = x2(k);
            else 
                a(k+1) = x1(k);
                b(k+1) = b(k);
            end
        end
        k = k + 1;
    end
    solution = (a(k) + b(k))/2;
   

end


