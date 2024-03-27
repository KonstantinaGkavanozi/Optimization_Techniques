% Define the function
f = @(u1, u2) sin(u1 + u2) * sin(u2^2);

% Define the input ranges
u1_range = linspace(-1, 2, 100);
u2_range = linspace(-2, 1, 100);

% Generate input combinations
[U1, U2] = meshgrid(u1_range, u2_range);

% Evaluate the function for each input combination
output_data = f(U1, U2);

% Plot the function
figure;
surf(U1, U2, output_data);
title('f(u_1, u_2) = sin(u_1 + u_2) * sin(u_2^2)');
xlabel('u_1');
ylabel('u_2');
zlabel('f(u_1, u_2)');
