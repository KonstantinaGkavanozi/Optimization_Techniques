clc;
clear all;

functions_project1;

%setting the values of the variables
a1 = 0;
b1 = 3;
l = 0.01;

n = 500;

epsilon_values = linspace(0.00001, 0.0005,n);

for i = 1:n
    [f1_solution(i),~, ~, f1_iterations(i)] = bisection_algorithm(f1, a1, b1, l, epsilon_values(i));
    [f2_solution(i),~, ~, f2_iterations(i)] = bisection_algorithm(f2, a1, b1, l, epsilon_values(i));
    [f3_solution(i),~, ~, f3_iterations(i)] = bisection_algorithm(f3, a1, b1, l, epsilon_values(i));
end

figure
subplot(3,1,1)
plot(epsilon_values, f1_iterations,'LineWidth',1)
title('f_1(x)')
grid on;
xlabel('\epsilon')
ylabel('iterations')

subplot(3,1,2)
plot(epsilon_values, f2_iterations,'LineWidth',1)
title('f_2(x)')
grid on;
xlabel('\epsilon')
ylabel('iterations')

subplot(3,1,3)
plot(epsilon_values, f3_iterations,'LineWidth',1)
title('f_3(x)')
grid on;
xlabel('\epsilon')
ylabel('iterations')
