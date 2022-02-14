function [ts, ys] = rk4(f, t0, tmax, N, y0)
% [ts, ys] = rk4(f, t0, tmax, N, y0)
% MATH2089: File = rk4.m
% A 4-stage Runge-Kutta method for a system of first order ODEs 
%   y' = f(t,y) for t in [t0, tmax] using N steps
% The initial condition y0 is a column vector (size m by 1)
% The function f(t,y) returns a column vector of the same size
% The output is consistent with ode45:
%   ts is a vector of size N+1 by 1
%   ys is a matrix of size N+1 by m
% (Frances Kuo 23 May 2021)

y0 = y0(:);          % ensure that y0 is a column vector
m = length(y0);      % m is the dimension of the system
h = (tmax-t0)/N;
t = [t0 : h : tmax]; % t is a vector of size 1 by N+1
y = zeros(m,N+1);    % y is a matrix of size m by N+1

y(:,1) = y0;         % y0 is a column vector of size m by 1
for n = 1:N
    tn = t(n);
    yn = y(:,n);
    k1 = f(tn, yn);
    k2 = f(tn + h/2, yn + (h/2)*k1);
    k3 = f(tn + h/2, yn + (h/2)*k2);
    k4 = f(tn + h,   yn +     h*k3);
    y(:,n+1) = yn + (h/6) * (k1 + 2*k2 + 2*k3 + k4); % rk4
end

ts = t'; % transpose to match the output format of ode45
ys = y';