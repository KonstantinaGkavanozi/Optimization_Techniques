function [minArg,minValue] = minimize_1d_function(f, starting_point, d)
    % use bicection with derivative method to minimize f and return both
    % its min value and the argument that holds it
    
    % parameters to be changed
    upper = 1;
    lower = 0;
    l = 0.1;

    syms gamma(x);
    gamma(x) = f(starting_point(1) + x * d(1), starting_point(2) + x * d(2));
    dg = diff(gamma);

     while upper - lower >= l
        midpoint = (upper + lower) / 2;
        der_g = dg(midpoint);
        if der_g > 0
            upper = midpoint;
        elseif der_g < 0
            lower = midpoint;
        else
           % break the loop
           upper = midpoint;
           lower = midpoint;
        end
     end

     minArg = upper; % = lower
     minValue = g(minArg);
end