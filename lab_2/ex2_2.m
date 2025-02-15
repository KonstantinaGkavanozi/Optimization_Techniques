clc;
clear all;


syms x y;
f(x, y) = x^3 * exp(-x^2 - y^4);

epsilon = 0.001;

% Comment out the unwanted starting points and keep one of the 3 following 
% lines to get the desired results:
% x1 = 0; y1 = 0;
x1 = 1; y1 = 1;
% x1 = 1; y1 = -1;

figure;
subplot(1,2,1)
[~, k, x_k, y_k, gamma_k] = steepest_descent_changing_gamma(f, x1, y1, epsilon);
fcontour(f, [-2.5, 2.5, -2.5, 2.5]);
hold on;
plot(x_k, y_k)
xlabel('x')
ylabel('y')
plot(x_k(1), y_k(1), 'o', 'color', 'red')
plot(x_k(end), y_k(end), 'x', 'color', 'red')
legend('', 'Path', 'Starting point', 'Point of minimum')
temp_title = sprintf('Steepest Descent Algorithm for mutable gamma');
title(temp_title)
grid on;
fprintf('There is(are) %d iteration(s).\n', k)

% gamma_k is NaN when the execution of the method ends before assigning any
% value in gamma
if ~isnan(gamma_k)
    iteration = 1:k-1;
    subplot(1,2,2)
    plot(iteration, gamma_k, '-o');
    title('Values of \gamma in each iteration')
    xlabel('Iteration')
    ylabel('\gamma')
    grid on
end