% MATH2089: File = excheb.m
% Interpolate function at equally spaced and Chebyshev points
% With equally spaced points, Runge's function error grows
% Choosing the Chebyshev points avoids this difficulty

clear
format compact

% Define function to be interpolated
% Runge's function
func = @(x) 1./(1+25*x.^2);
fstr = '1 / (1 + 25 x^2)';

% Define interval for interpolation
a = -1; b = 1;
% Define interval for ploting and error
xlo = a; xhi = b;

% Define degree n of polynomial: Try 8, 10, 12, ...
% Number of points is n + 1
n = 8; %n = 50;
n1 = n+1;

% n + 1 equally spaced points
x = linspace(a, b, n1);
% Make x a column vector for creating interpolation matrix
x = x(:);

% Define interpolation matrix
A = ones(n1,n1);
tmp = x;
for j = 2:n1   
    A(:,j) = tmp;
    tmp = tmp.*x;    
end;
y = func(x);
p1 = A \ y;

% Plot points and for estimating error
xplt = linspace(a, b, 1001);

yplt = func(xplt);
yint = horner(p1, xplt);
p1err = yplt - yint;
p1ea = max(abs(p1err));
fprintf('Interpolating %s on [%.2f, %.2f]', fstr, a, b);
fprintf(' by polynomial of degree %d\n', n);
fprintf('Maximum error using %d equally spaced points = %.2e\n', n+1, p1ea);

figure(1); clf
subplot(2,1,1)
plot(x, y, 'r*', xplt, yint, xplt, yplt)
grid on
xlabel('x')
tstr = sprintf('Interpolating %s by polynomial of degree %d at equally spaced points', fstr, n);
title(tstr)
legend('Interpolation points', 'Interpolating polynomial', 'Function', ...
    'Location', 'South')
subplot(2,1,2)
plot(x, zeros(size(x)), 'r*', xplt, p1err)
grid on
xlabel('x')
tstr = sprintf('Error in interpolation using %d equally spaced points',n1);
title(tstr)

% n+1 Chebyshev points on [-1, 1]
x0 = (2*n+1-2*[0:n])*(pi/(2*n1));
x0 = cos(x0(:));
% Chebyshev points on [a, b]
xc = (a+b)/2 + ((b-a)/2)*x0;
% Define interpolation matrix
AC = ones(n1,n1);
tmp = xc;
for j = 2:n1   
    AC(:,j) = tmp;
    tmp = tmp.*xc;   
end;
yc = func(xc);
pc = AC \ yc;

ycint = horner(pc, xplt);
pcerr = yplt - ycint;
pcea = max(abs(pcerr));
fprintf('Maximum error using %d Chebyshev points = %.2e\n', n+1, pcea);

figure(2); clf
subplot(2,1,1)
plot(xc, yc, 'mh', xplt, ycint, xplt, yplt)
grid on
xlabel('x')
tstr = sprintf('Interpolating %s by polynomial of degree %d at Chebyshev points', fstr, n);
title(tstr)
legend('Interpolation points', 'Interpolating polynomial', 'Function', ...
    'Location', 'NorthWest')
subplot(2,1,2)
plot(xc, zeros(size(xc)), 'mh', xplt, pcerr)
grid on
xlabel('x')
tstr = sprintf('Error in interpolation using %d Chebyshev points', n1);
title(tstr)
