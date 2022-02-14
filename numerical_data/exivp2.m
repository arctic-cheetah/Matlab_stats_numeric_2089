% MATH2089: File = exivp2.m
% Initial value Problen - Example 2
% First order system of differential equations
% Solve initial value problem x' = f(t, x)
% on the time interval [t0, tf] with
% initial conditions x(t0) = x0

format compact

% Parameter alpha must be defined before anonymous function
alpha = 2;

% Define function f using an anonymous function
f = @(t, x) [x(2); -2*alpha*(x(1) + t.*x(2))];

fstr = sprintf('[x_2; %.2f (x_1 + t x_2)]', -2*alpha);

% Time interval
t0 = 0, tf = 2

% Initial value at t0
x0 = [1; 0]

% Set options for ode45
%opt = [];  % Default values RelTol = 1e-3, AbsTol = 1e-6
opt = odeset('RelTol', 1e-7, 'AbsTol', 1e-10);

% Solve using medium accuracy method
[ts, ys] = ode45(f, [t0, tf], x0, opt);

% Size of output
whos ts ys

% Plot solution
figure(1)
plot(ts, ys);
grid on
xlabel('t')
ylabel('x(t)')
tstr= sprintf('Solution to IVP x'' = %s,   x(%.2f) = [%.2f; %.2f]', fstr, t0, x0)
title(tstr)
legend('x_1(t) = y(t)', 'x_2(t) = y''(t)');

