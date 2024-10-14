clc;
clear all;


syms x;

f1 =(x-1)^3 + (x-4)^2*cos(x);
f2 =exp(-2*x) + (x-2)^2;
f3 =x^2*log(0.5*x) + sin(0.2*x)^2;

a1 = 0;
b1 = 3;
n = 500;    


epsilon = 0.001;
lambda_values = linspace(0.01, 0.5, n);

for i = 1:n
    [~, ~, ~, number_of_calculations_f1(i)] = derivative_bisection_algorithm(f1, a1, b1, lambda_values(i));
    [~, ~, ~, number_of_calculations_f2(i)] = derivative_bisection_algorithm(f2, a1, b1, lambda_values(i));
    [~, ~, ~, number_of_calculations_f3(i)] = derivative_bisection_algorithm(f3, a1, b1, lambda_values(i));
end

figure
subplot(1,3,1)
plot(lambda_values, number_of_calculations_f1)
title('f_1(x)')
grid on;
xlabel('l')
ylabel('function calculations')


subplot(1,3,2)
plot(lambda_values, number_of_calculations_f2)
title('f_2(x)')
grid on;
xlabel('l')
ylabel('function calculations')

subplot(1,3,3)
plot(lambda_values, number_of_calculations_f3)
title('f_3(x)')
grid on;
xlabel('l')
ylabel('function calculations')