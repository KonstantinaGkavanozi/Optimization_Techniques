clc;
clear all;

syms x;

f1 =(x-1)^3 + (x-4)^2*cos(x);
f2 =exp(-2*x) + (x-2)^2;
f3 =x^2*log(0.5*x) + sin(0.2*x)^2;

a1 = 0;
b1 = 3;

lambda_values = [ 0.01, 0.05, 0.1, 0.5, 1 ];

figure_index = 1;
derivative_bisection_interval_plots(f1, 'f_1(x)', a1, b1, lambda_values, figure_index)

figure_index = 2;
derivative_bisection_interval_plots(f2, 'f_2(x)', a1, b1, lambda_values, figure_index)


figure_index = 3;
derivative_bisection_interval_plots(f3, 'f_3(x)', a1, b1, lambda_values, figure_index)

for figure_index = 1:3
    figure(figure_index)
    legend('a', 'b')
end