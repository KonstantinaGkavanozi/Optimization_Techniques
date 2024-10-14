clc;
clear all;

syms x1 x2;
f(x1, x2) = 1/3*x1^2 + 3*x2^2;

x1_bounds = [-10, 5];
x2_bounds = [-8, 12];

epsilon = 0.001;

%Commenting out the variables for each excercise

% disp('2nd Excercise');
% gamma = 0.5;
% s = 5;
% x1 = 5;
% x2 = -5;

% disp('3rd Excercise');
% gamma = 0.1;
% s = 15;
% x1 = -5;
% x2 = 10;
% 
disp('4th Excercise');
gamma = 0.2;
s = 0.1;
x1 = 8;
x2 = -10;



figure;
fill([x1_bounds(1) x1_bounds(1) x1_bounds(2) x1_bounds(2)], [x2_bounds(1) x2_bounds(2) x2_bounds(2) x2_bounds(1)], [145/256, 154/256, 168/256], 'FaceAlpha', 0.7)
hold on
fcontour(f(x1,x2), [-15, 15, -15, 15])
title('$ f(x1, x2) = \frac{1}{3} x1^2 + 3x2^2 $', 'FontSize', 18, 'interpreter', 'latex')
xlabel('$ x1 $', 'FontSize', 14, 'interpreter', 'latex')
ylabel('$ x2 $', 'FontSize', 14, 'interpreter', 'latex')
grid on

[x_k, y_k] = steepest_descent_with_projection(f, x1, x2, x1_bounds, x2_bounds, s, gamma, epsilon);

hold on;
plot(x_k, y_k, 'red')
plot(x_k(1), y_k(1), 'ro')
plot(x_k(end), y_k(end), 'rx')
legend('Constraints Region', '', 'Path', 'Starting Point', 'Point of minimum')

k = length(x_k);
figure;
plot(1:k, x_k, 'o')
hold on
plot(1:k, y_k, 'x')
legend('x', 'y')
xlabel('iteration')
title('Values of x1 and x2 coordinates in each iteration')

k = length(x_k) - 1;
fprintf('k = %d\n', k);
fprintf('x1_min = %f\n',x_k(end))
fprintf('x2_min = %f\n',y_k(end))

      

