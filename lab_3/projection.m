function [projected_point] = projection(x, x_bounds)
    x_min = x_bounds(1);
    x_max = x_bounds(2);
    
    if(x>= x_min && x<=x_max)
        point = x;
    elseif(x<x_min)
        point = x_min;
    else
        point = x_max;
    end
    projected_point = point;
end