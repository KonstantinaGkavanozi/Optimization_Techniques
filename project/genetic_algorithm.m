function [best_solution,error] = genetic_algorithm(num_gaussians,generations_num,mutation_rate)
tic;

population_size = 150; 
generation = 1; 
chromosomes = num_gaussians * 5;
crossover_rate = 0.8;

error = inf(1,generations_num);
best_individual = zeros(generations_num,chromosomes+1);


% Initializing the first population with random values
population = initialize_population(population_size, num_gaussians);

% Sorting the population based on the fitness score of each indivual.
population = sortrows(population,chromosomes+1);

best_individual(generation,:) = (population(1,:));
error(generation) = population(1,chromosomes+1); 
prev_error = population(1,chromosomes+1);

while ( prev_error >=0.005 && generation <= generations_num)
    generation = generation + 1;

   %Selecting the parents
    [parent1, parent2, idx1, idx2] = selection(population, population_size);
    
    %Applying Crossover
    [offspring1, offspring2] = crossover(parent1, parent2, crossover_rate);
    
    j = 1;
    for i=idx1:idx1+5

        population(idx1) = offspring1(j);
        j = j + 1;
    end

    j = 1;
    for i=idx2:idx2+5

        population(idx2) = offspring2(j);
        j = j + 1;
    end

    %Mutating some of the  individuals
    for i = 1:population_size
        if rand() * 100 < mutation_rate   
           population(i,1:chromosomes) = mutate(population,chromosomes,population_size);
        end
    end
    
    %Calculate again the fitness for each gene
    for j = 1:population_size
        population(j,chromosomes+1) = evaluate_fitness(population(j,1:chromosomes),chromosomes);
    end
    
    % Sorting the population for each generation based on the fitness score of each indivual.
    population = sortrows(population,chromosomes+1);
    
    best_individual(generation,:) = (population(1,:));
    error(generation) = population(1,chromosomes+1); 
    prev_error = population(1,chromosomes+1);
end    

[~,idx] = min(error); % index of the generation with the lowest MSE.
best_solution = best_individual(idx,1:chromosomes); % take the individual with that index,

toc;
end
