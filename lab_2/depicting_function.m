% Define the function
f = @(x, y) x.^3 .* exp(-x.^2 - y.^4);

% Define the range for x and y
x = linspace(-2, 2, 100); % Adjust the range as needed
y = linspace(-2, 2, 100); % Adjust the range as needed

% Create a grid of x and y values
[X, Y] = meshgrid(x, y);

% Calculate the function values for each pair of x and y
Z = f(X, Y);

% Create a surface plot
figure;
surf(X, Y, Z);
title('f(x, y) = x^3 * e^{-x^2 - y^4}');
xlabel('x');
ylabel('y');
zlabel('f(x, y)');
