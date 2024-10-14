
x = linspace(0, 3, 100);  % Define the range from -2 to 6 with 100 points

f1 = (x - 1).^3 + (x - 4).^2 .* cos(x);

f2 = exp(-2*x) + (x-2).^2;

f3 = x.^2.*log(0.5*x) + sin(0.2*x).^2;


% Create the plot
subplot(3,1,1);
plot(x, f1);
xlabel('x');
ylabel('f1');
title('f1(x) = (x-1)^3 + (x-4)^2*cos(x)');
grid on;

subplot(3,1,2);
plot(x, f2);
xlabel('x');
ylabel('f2');
title('f2(x) = exp(-2*x) + (x-2)^2');
grid on;

subplot(3,1,3);
plot(x, f3);
xlabel('x');
ylabel('f3');
title('f3 = x^2*log(0.5*x) + sin(0.2*x)^2');
grid on;




