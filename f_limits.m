function [f_min,f_max] = f_limits()

% Calculating the maximum and the mininum value of f(u1,u2) in order for
% the min and max to then be used to define the magnitude for the Gaussians

    size = 100;
    f_val = zeros(size,size);
    count_u1 = 1;

    for u1 = linspace(-1,2,size)
        count_u2 = 1;
        for u2 = linspace(-2,1,size)
            f_val(count_u1,count_u2) = func(u1,u2);
        count_u2 = count_u2 + 1;
        end
        count_u1 = count_u1 + 1;
    end
    f_min = min(min(f_val));
    f_max = max(max(f_val));
end