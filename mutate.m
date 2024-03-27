function mutated_individual = mutate(individual,gsize,populationNum)

   mod_index = randi(populationNum);
   
    switch(mod(mod_index,5))
        case 1 %magnitude of Gaussian
            individual(mod_index,1:gsize) = -1 + 2*rand; %magnitude of Gaussian
        case 2 %c1 [-3, 4]
            individual(mod_index,1:gsize) = -3 + 7*rand; 
        case 3 %c2 [-4,3]
            individual(mod_index,1:gsize) = -4 + 7*rand;
        case 4 %s1 [0.2,1.3]
            individual(mod_index,1:gsize) = 0.2 + 1.1 * rand;
        case 5 %s2 [0.2,1.3]
            individual(mod_index,1:gsize) = 0.2 + 1.1 * rand; 
    end

    %The individual, with one of his genes changed
    mutated_individual = individual(mod_index,1:gsize); 
end