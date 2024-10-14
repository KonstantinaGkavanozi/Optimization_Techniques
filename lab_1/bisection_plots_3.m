clc;
clear all;

functions_project1;
a1 = 0;
b1 = 3;
epsilon = 10^-3;
lambda_values = [ 0.01, 0.1, 0.5, 1 ];

figure_index = 1;
bisection_interval_plots(f1, 'f_1(x)', a1, b1, epsilon, lambda_values, figure_index)

figure_index = 2;
bisection_interval_plots(f2, 'f_2(x)', a1, b1, epsilon, lambda_values, figure_index)


figure_index = 3;
bisection_interval_plots(f3, 'f_3(x)', a1, b1, epsilon, lambda_values, figure_index)

for figure_index = 1:3
    figure(figure_index)
    legend('a', 'b')
end