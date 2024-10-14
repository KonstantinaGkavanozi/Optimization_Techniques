clc;
clear all;

% Define the function
syms x1 x2;
f(x1, x2) = 1/3*x1^2 + 3*x2^2;

figure(1);
fsurf(f(x1,x2), [-15, 15, -5, 5])
title('$ f(x1, x2) = \frac{1}{3} x1^2 + 3x2^2 $', 'FontSize', 18, 'interpreter', 'latex')
xlabel('$ x1 $', 'FontSize', 14, 'interpreter', 'latex')
ylabel('$ x2 $', 'FontSize', 14, 'interpreter', 'latex')
zlabel('$ f(x1,x2) $', 'FontSize', 14, 'interpreter', 'latex')

figure(2);
fcontour(f(x1,x2), [-15, 15, -5, 5])
title('$ f(x1, x2) = \frac{1}{3} x1^2 + 3x2^2 $', 'FontSize', 18, 'interpreter', 'latex')
xlabel('$ x1 $', 'FontSize', 14, 'interpreter', 'latex')
ylabel('$ x2 $', 'FontSize', 14, 'interpreter', 'latex')
grid on

figure(3);
fill([-10 -10 5 5], [-8 12 12 -8], [145/256, 154/256, 168/256], 'FaceAlpha', 0.7)
hold on
fcontour(f(x1,x2), [-15, 15, -15, 15])
title('$ f(x1, x2) = \frac{1}{3}x1^2 + 3x2^2 $', 'FontSize', 18, 'interpreter', 'latex')
xlabel('$ x1 $', 'FontSize', 14, 'interpreter', 'latex')
ylabel('$ x2 $', 'FontSize', 14, 'interpreter', 'latex')
hold on;
grid on
legend('Constraints')