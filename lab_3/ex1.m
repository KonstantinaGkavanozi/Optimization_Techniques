%Steepest Descent Method

clc;
clear all;

syms x1 x2;
f(x1, x2) = 1/3*x1^2 + 3*x2^2;

epsilon = 0.001;
gamma = [0.1, 0.3, 3, 5];

%x1 = [-30, -2, 15]
%x2 = [-20, 2, 30]

x1 = 15;
x2 = 30;

figure;
sgtitle('Steepest Descent algorithm for constant \gamma')

for i = 1:length(gamma)
    [~, k, x_k, y_k] = steepest_descent(f, x1, x2, gamma(i), epsilon);

    % Create subplots
    subplot(2, 2, i);  

    % Plot contour of the function
    fcontour(f, [-2.5, 2.5, -2.5, 2.5]);
    hold on;

    % Plot the optimization path
    plot(x_k, y_k)
    xlabel('x')
    ylabel('y')

    % Plot the starting point and the point of minimum
    plot(x_k(1), y_k(1),'o', 'color', 'red')  % Starting point
    plot(x_k(end), y_k(end),'x', 'color', 'red')  % Point of minimum
    legend('','Path', 'Start', 'Minimum')  % Adjust legend labels

    % Set title and labels
    temp_title = sprintf('gamma = %.3f', gamma(i));
    title(temp_title)
    grid on;

    % Print iteration information
    fprintf('For gamma = %.3f, there are %d iteration(s).\n', gamma(i), k)
end
