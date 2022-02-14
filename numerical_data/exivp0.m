% MATH2089: File = exivp0.m
% Solve various initial value problems (IVP)
% y' = f(t, y) on the interval [t0, tmax] with
% initial conditions y(t0) = y0
% Requires exact solution yex(t) to calcualte errors
% Can choose from several methods
% (Updated 23 May 2021)

format compact

% Select which example to run
ex = 3;
switch ex
    case {1}

        % Define function f using an anonymous function
        f = @(t, y) t + y
        fstr = 't + y';
        % Time interval
        t0 = 0, tmax = 1
        % Initial value at t0
        y0 = 1
        % Number of intervals
        N = 10
        % Define exact solution for calculating errors
        yex = @(t) 2*exp(t) - 1 - t

    case{2}

        % Define function f using an anonymous function
        f = @(t, y) 1 ./(1 + t.^2) -2*y.^2
        fstr = '1/(1+t^2)-2y^2';
        % Time interval
        t0 = 0, tmax = 1
        % Initial value at t0
        y0 = 0
        % Number of intervals
        N = 10
        % Define exact solution for calculating errors
        yex = @(t) t./(1 + t.^2)

    case {3}

        % Define function f using an anonymous function
        f = @(t, y) t.*exp(3*t) - 2*y
        fstr = 't exp(3 t) - 2 y';
        t0 = 0, tmax = 1
        y0 = 0
        % Number of intervals
        N = 2
        yex = @(t) (t/5).*exp(3*t) - (1/25)*exp(3*t) + (1/25)*exp(-2*t)

    case {4}

        % Define function f using an anonymous function
        f = @(t, y) 1 + y./t
        fstr = '1 + y/t';
        t0 = 1, tmax = 2
        y0 = 2
        % Number of intervals
        N = 4
        yex = @(t) t.*log(t) + 2*t

    case{5}

        % Define function f using an anonymous function
        f = @(t, y) 2*y./t + t.^2.*exp(t)
        fstr = '2 y/t + t^2 exp(t)';
        t0 = 1, tmax = 2,
        y0 = 0
        N = 10
        yex = @(t) t.^2 .* (exp(t) - exp(1))


    case {6}

        % Define function f using an anonymous function
        f = @(t, y) -30*y
        fstr = '-30 y';
        % Time interval
        t0 = 0, tmax = 2
        % Initial value at t0
        y0 = 1/3
        % Set number of intervals N
        % Try N = 20, 25, 30, 40
        N = 20;
        % Define exact solution for calculating errors
        yex = @(t) (1/3)*exp(-30*t)

end;

ipr = 1; % print summary

% Select which method to use
% The MATLAB fucntion M-files euler, heun, and rk4
% are available from the course web page
[ts, ys] = euler(f, t0, tmax, N, y0);
%[ts, ys] = heun(f, t0, tmax, N, y0);
%[ts, ys] = rk4(f, t0, tmax, N, y0);
%[ts, ys] = ode45(f, [t0, tmax], y0);

yexact = yex(ts);
err = yexact - ys;
emax = max(abs(err))

% Plot solution
tplt = linspace(t0, tmax, 401);
yplt = yex(tplt);
figure(1)
plot(tplt, yplt, '-', ts, ys, '*--');
grid on
xlabel('t')
ylabel('y(t)')
h = (tmax - t0)/N;

% EITHER: use this title with euler, heun, and rk4
tstr= sprintf('Solution to IVP y'' = %s, h = %.3f', fstr, h);
% OR: use this title with ode45, since step size is variable
%tstr= sprintf('Solution to IVP y'' = %s, fstr);

title(tstr)
legend( 'Exact solution', 'Approximation', ...
    'Location', 'NorthWest')

% Plot grid points
figure(2)
N1 = length(ts)-1;
plot([0:N1], ts, 'r.', [0 N1], [ts(1) ts(end)], 'b-')
grid on
title('Grid points')
legend('Grid points', 'Equally spaced', ...
    'Location', 'NorthWest')
