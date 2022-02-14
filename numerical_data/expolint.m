% MATH2089: File = expolint.m
% Polynomial interpolation example

format compact

% Data (must be column vectors)
xdat = [-2; -1; 0; 1; 3];
ydat = [4; 2; -3; 5; 4];

% Degree = number of data points - 1
n = length(xdat);
deg = n-1

% Vandermonde matrix using monomial basis x^k
% Data tdat must be a column vector
A = ones(n, n);
xp = xdat;
for k = 1:deg

    A(:,k+1) = xp;
    xp = xp.*xdat;

end;

% Solve Vandermonde linear system
a = A \ ydat

% Plot data and interpolating polynomial
xlo = min(xdat) - 1;
xhi = max(xdat) + 1;
xplt = linspace(xlo, xhi, 401);
yplt = horner(a, xplt);
figure(1)
plot(xdat, ydat, 'r*', xplt, yplt, 'b-');
grid on
%xlabel('t');
title('Polynomial interpolation');



