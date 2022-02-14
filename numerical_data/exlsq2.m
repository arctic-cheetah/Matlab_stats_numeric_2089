% MATH2089: File = exlsq2.m
% Find line of best fit to data in least squares sense

format compact

% Sample points
tdat = [0:0.5:10];
% Line data plus normally distributed noise
x0 = [2; 0.6]
sigma = 0.5
ydat = x0(1) + x0(2)*tdat + 0.6*randn(size(tdat));

% Coefficieint matrix
% Force to be a column vector
tdat = tdat(:); ydat = ydat(:);
A = [ones(size(tdat)) tdat];

% Condition number of A
Acond = cond(A)

% Least squares solution via Normal equations
ATA = A'*A
ATy = A'*ydat
xn = ATA \ ATy

% Least squares solution using backslash (QR factorization)
xs = A \ ydat

% Line of best fit
tplt = [min(tdat)-1 max(tdat)+1];
yplt = xs(1)+ xs(2)*tplt;

% Residuals
r = xs(1) + xs(2)*tdat;
rnrm2 = sum(r.*r)

figure(1)
plot(tdat, ydat, 'r*', tplt, yplt, 'b-')
grid on
xlabel('t')
tstr = sprintf('Line %.2f + %.2f t of best fit to data, ||r||_2^2 = %.2f', xs, rnrm2);
title(tstr)
%title('Linear least squares')