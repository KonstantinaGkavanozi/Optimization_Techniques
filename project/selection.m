function [selected_parent1, selected_parent2, selected_index1, selected_index2] = selection(population, population_size)
     
    normalized_fitness= [];
    fitness = [];
        
    %Retrieving fitness scores from each individual
    for i=1:population_size
        j = i*6;
        if j<numel(population)
            fitness(i) = population(j); 
        end
    end
    
    % Calculate normalized fitness scores
    fitness_sum = sum(fitness);
    fitness_size = numel(fitness);

    for j=1:fitness_size
        normalized_fitness(j) = fitness(j)/fitness_sum;
    end

    
    % Create the spinning wheel (cumulative probabilities)
    roulette_wheel = cumsum(normalized_fitness);

    % Generate a random number in the range [0, 1)
    spin = rand();

    % Find the index of the selected individual based on spinning wheel logic
    index1 = find(roulette_wheel >= spin, 1, 'first');
    selected_index1 = index1 * 6 - 5;
    j = 1;
    %Storing in the selected_parent the whole chromosome of the parent
    for i=selected_index1:selected_index1+5
        
        selected_parent1(j) = population(i);
        j = j + 1;
    end
    
    %Repeat the same with the second parent
    
    index2 = find(roulette_wheel >= spin, 1, 'first');
    selected_index2 = index2 * 6 - 5;
    

    %Making sure that the second parent will not be the same with the first
    tic;
    while isequal(selected_index1, selected_index2)

        spin = rand();
        index2 = find(roulette_wheel >= spin, 1, 'first');        
        selected_index2 = index2 * 6 - 5;
        toc;
        if toc > 1
            if index2-1>0 && index2-1<numel(population)
                index2 = index2 - 1;
            elseif index2+1>0 && index2+1<numel(population)
                index2 = index2 + 1;
            end
            selected_index2 = index2 * 6 - 5;
        end
    end

    j = 1;
    for i=selected_index2:selected_index2+5
        
        selected_parent2(j) = population(i);
        j = j + 1;
    end 
    disp("end of selection")

end
