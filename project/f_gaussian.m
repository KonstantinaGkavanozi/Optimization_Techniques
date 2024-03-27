%Calculating the value for each Gaussian
function value = f_gaussian(u1,u2,population,size)
    
    value = 0;

    for i = 1:5:size
        A = population(i);
        c1 = population(i+1);
        c2 = population(i+2);
        s1 = population(i+3);
        s2 = population(i+4);
        power = ((u1-c1)^2/(2*s1^2)) + ((u2-c2)^2/(2*s2^2));
        value = value + A * exp(-power);
    end

end
