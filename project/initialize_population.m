function population = initialize_population(population_size, num_gaussians)
    population = zeros(population_size, num_gaussians * 5 + 1);
    %genes = zeros(1,chromosomes);
    c1_limits = [-3 4]; 
    c2_limits = [-4 3];
    [f_min,f_max] = f_limits();

    for i = 1:population_size
        genes = zeros(1, num_gaussians * 5);

        for j = 1:5:num_gaussians * 5
            % Randomly generate parameters for each Gaussian variable
            magnitude = f_min + (f_max - f_min)*rand();
            mean1 = c1_limits(1) + (c1_limits(2) - c1_limits(1))*rand();
            mean2 = c2_limits(1) + (c2_limits(2) - c2_limits(1))*rand();
            stdDev1 = 0.2 + 1.1 * rand();
            stdDev2 = 0.2 + 1.1 * rand();

            % Store the parameters in the genes array
            genes(j) = magnitude;
            genes(j + 1) = mean1;
            genes(j + 2) = mean2;
            genes(j + 3) = stdDev1;
            genes(j + 4) = stdDev2;
        end

        % Add the genes to the population matrix
        population(i, 1:num_gaussians * 5) = genes;
        
        % Calculate fitness and add it to the last column
        population(i, num_gaussians * 5 + 1) = evaluate_fitness(genes, num_gaussians * 5);
    end
end
