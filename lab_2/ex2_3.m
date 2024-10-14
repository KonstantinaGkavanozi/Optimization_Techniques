clear variables; close all; clc;

syms x y;
f(x, y) = x^3 * exp(-x^2 - y^4);
epsilon = 0.001;


%alpha = 0.1; beta = 0.2; s = 1; flag = 1;
alpha = 0.05; beta = 0.1; s = 1; flag = 2;
%alpha = 0.01; beta = 0.05; s = 0.5; flag = 3;

x1 = 1; 
y1 = 1;

figure;
temp_sgtitle = sprintf('case %d', flag);
sgtitle(temp_sgtitle)
subplot(1,2,1)
[~, k, x_k, y_k, gamma_k] = steepest_descent_armijo(f, x1, y1, epsilon, alpha, beta, s);
fcontour(f, [-2.5, 2.5, -2.5, 2.5]);
hold on;
plot(x_k, y_k)
xlabel('x')
ylabel('y')
plot(x_k(1), y_k(1), 'o', 'color', 'red')
plot(x_k(end), y_k(end), 'x', 'color', 'red')
legend('', 'Path', 'Starting point', 'Point of minimum')
temp_title = sprintf('Steepest Descent algorithm with Armijo Rule');
title(temp_title)
grid on;
fprintf('There is(are) %d iteration(s).\n', k)


if ~isnan(gamma_k)
    iteration = 1:k-1;
    subplot(1,2,2)
    plot(iteration, gamma_k, '-o');
    title('Values of \gamma in each iteration')
    xlabel('Iteration')
    ylabel('\gamma')
    grid on
end