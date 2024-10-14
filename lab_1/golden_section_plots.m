clc;
clear all;

functions_project1;

%setting the values of the variables
a1 = 0;
b1 = 3;

n = 500;

l_values = linspace(0.005, 0.1, n);

for i = 1:n
    [~, ~,f1_iterations(i)] = golden_section_algorithm(f1, a1, b1, l_values(i));
    [~, ~,f2_iterations(i)] = golden_section_algorithm(f2, a1, b1, l_values(i));
    [~, ~,f3_iterations(i)] = golden_section_algorithm(f3, a1, b1, l_values(i));
end

figure
subplot(3,1,1)
plot(l_values, f1_iterations)
title('f_1(x)')
grid on;
xlabel('lamda')
ylabel('iterations')

subplot(3,1,2)
plot(l_values, f2_iterations)
title('f_2(x)')
grid on;
xlabel('lamda')
ylabel('iterations')

subplot(3,1,3)
plot(l_values, f3_iterations)
title('f_3(x)')
grid on;
xlabel('lamda')
ylabel('iterations')
