function [offspring1, offspring2] = crossover(parent1, parent2, crossover_rate)
    % Get the length of the parents (assuming they have the same length)
    len = numel(parent1);
    
    % Choose a random crossover point within the parent 
    %len - 2 makes sure that at least one element will be exchanged 
    crossover_point = randi(len - 2) + 1;
    

    % Generate a random number between 0 and 1
    randNum = rand();

    % Check if crossover should be applied
    if randNum <= crossover_rate
        % Create offspring by combining genetic material from parents
        offspring1 = [parent1(1:crossover_point), parent2(crossover_point + 1:end)];
        offspring2 = [parent2(1:crossover_point), parent1(crossover_point + 1:end)];
        
    else
        % No crossover, copy parents directly
        offspring1 = parent1;
        offspring2 = parent2;
    end

    
end
