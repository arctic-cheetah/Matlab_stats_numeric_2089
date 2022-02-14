
f = @(x) exp(-x.^2 + 1);
g = @(x) x + 2;

x = linspace(-3, 3, 101);
y = f(x);
z = g(x);
plot(x, y,'r*', x, z, 'b.-');
legend('f(x)','g(x)');
title('Plot of f(x) and g(x)');
xlabel('x axis');
ylabel('y axis');
grid on