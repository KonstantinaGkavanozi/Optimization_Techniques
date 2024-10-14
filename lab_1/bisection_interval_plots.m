% generates the plots of the values a_k, b_k with respect to k resulting from
% the Bisection algorithm
function bisection_interval_plots(f, title_string, a1, b1, epsilon, l_values, figure_index)
    l_length = length(l_values);
    figure(figure_index)
    for i = 1:l_length
        [~, a_total, b_total, ~] = bisection_algorithm(f, a1, b1, l_values(i), epsilon);
        k = 1:length(a_total);

        figure(figure_index)
        subplot(l_length,1,i)
        plot(k, a_total)
        hold on
        plot(k, b_total)
        title(title_string+", l = "+string(l_values(i)))
        xlabel('k')
        grid on
        hold on
    end
end