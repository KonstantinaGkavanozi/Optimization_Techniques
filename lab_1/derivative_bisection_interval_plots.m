function derivative_bisection_interval_plots(f, title_string, a1, b1, l_values, figure_index)
    l_length = length(l_values);
    figure(figure_index)
    for i = 1:l_length
        [~, a_total, b_total, ~] = derivative_bisection_algorithm(f, a1, b1, l_values(i));
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