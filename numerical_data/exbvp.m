% MATH2089: File = exbvp.m
% Boundary value Problem
% Solve initial value problem y'' = f(t, y, y')
% on the interval [a, b] with
% boundary values y(a) = ya, y(b) = yb

format compact

% Define function f using an anonymous function
% As first order system x = [y, y']
f = @(t, x) [x(2); x(2)./t - x(1)./t.^2]
fstr = 'y'''' - y''/t + y/t^2 = 0';

% Interval
a = 1, b = 2

% Boundary values
ya = 2, yb = 6

% Set options for ode45
%opt = [];  % Default values RelTol = 1e-3, AbsTol = 1e-6
opt = odeset('RelTol', 1e-7, 'AbsTol', 1e-10);

% Solve using medium accuracy method with step-size control

% First guess for eta = y'(a)
eta1 = 1
[ts1, xs1] = ode45(f, [a, b], [ya; eta1], opt);
yb1 = xs1(end,1)

% Second guess for eta
eta2 = 5
[ts2, xs2] = ode45(f, [a, b], [ya; eta2], opt);
yb2 = xs2(end,1)

% Value of eta from linear interpolation between eta = 1, 5
eta3 = 3.4427
[ts3, xs3] = ode45(f, [a, b], [ya; eta3], opt);
yb3 = xs3(end,1)

% Plot solutions
plot(ts1,xs1(:,1), ts2,xs2(:,1), ts3,xs3(:,1), a,ya,'m*', b,yb,'m*');
grid on
xlabel('t')
ylabel('y(t)')
tstr= sprintf('BVP %s, y(%.1f) = %.2f, y(%.1f) = %.2f',fstr, a, ya, b, yb);
title(tstr)
lstr1 = sprintf('eta = %.4f',eta1);
lstr2 = sprintf('eta = %.4f',eta2);
lstr3 = sprintf('eta = %.4f',eta3);
legend(lstr1,lstr2,lstr3,'Location','NorthWest')
