clc;
clear all;

syms x y;
f(x, y) = x^3 * exp(-x^2 - y^4);

gamma = [0.01, 0.1, 0.5, 1, 2];
epsilon = 0.001;

x1 = -1;
y1 = -1;

figure;
sgtitle('Newton algorithm for constant \gamma')

for i = 1:length(gamma)
    [~, k, x_k, y_k] = newton(f, x1, y1, gamma(i), epsilon);
    
    % Create subplots
    subplot(2, 3, i);  % Adjust subplot size as needed

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