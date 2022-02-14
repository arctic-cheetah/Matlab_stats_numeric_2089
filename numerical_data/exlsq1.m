% MATH2089: File = exlsq1.m
% Data fitting in least squares sense
% (Updated 11 May 2020)

format compact

% Sample points
xdat = [0:0.5:2]; % or xdat = linspace(0,2,5);
ydat = [1.0 0.6 0.4 0.1 0.08];

% Force to be a column vector
xdat = xdat(:);
ydat = ydat(:);
  
% (a) Line of best fit
A = [ones(size(xdat)) xdat];
u = A \ ydat
x = linspace(0,2,100);
y = u(1) + u(2)*x;
figure(1)
plot(x,y,'b-',xdat,ydat,'m*');
title('Line of best bit')
  
% (b) Quadratic of best fit
A = [ones(size(xdat)) xdat xdat.^2];
u = A \ ydat
x = linspace(0,2,100);
y = u(1) + u(2)*x + u(3)*x.^2;
figure(2)
plot(x,y,'b-',xdat,ydat,'m*');
title('Quadratic of best bit')
  
% (c) Polynomial interpolation of degree 4
A = [ones(size(xdat)) xdat xdat.^2 xdat.^3 xdat.^4];
u = A \ ydat
x = linspace(0,2,100);
y = u(1) + u(2)*x + u(3)*x.^2 + u(4)*x.^3 + u(5)*x.^4;
figure(3)
plot(x,y,'b-',xdat,ydat,'m*');
title('Polynomial interpolation')
  
% (d) Approximation by exponential function
%     Converted to a linear problem by taking logs
A = [ones(size(xdat)) xdat];
u = A \ log(ydat)
lam = exp(u(1))
mu = u(2)
x = linspace(0,2,100);
y = lam * exp(mu*x);
figure(4)
plot(x,y,'b-',xdat,ydat,'m*');
title('Exponential approximation')
  