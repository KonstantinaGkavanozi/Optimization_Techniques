function fitness = evaluate_fitness(population, size)
       
    u1_limits = [-1 2];
    u2_limits = [-2 1];
    
    val = 0;
    points = 25;
    n = points^2;
    for u1 = linspace(u1_limits(1),u1_limits(2),points)
        for u2 = linspace(u2_limits(1),u2_limits(2),points)
    
        val = val + (func(u1,u2) - f_gaussian(u1,u2,population,size))^2;
        end
    end
    
    %Mean Square Error
    fitness = val/n;
    
end
