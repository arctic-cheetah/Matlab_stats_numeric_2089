% MATH2089: File = exwave1dtime.m
% Solution of wave equation in 1 space variable and time
% using explicit method

format compact
clear all

fprintf('\nWave equation in 1 space variable and time\n');
mthd = 0;
mstr = 'explicit';
fprintf('using an %s method\n', mstr);

% Initial conditions u(x,0) = f(x) and u_t(x,0) = g(x)
ex = 3;
switch ex
    case {1}
        % Example 1: Vibrating string, fixed ends
        a = 0; b = 1;
        % Boundary values
        ua = 0; ub = 0;
        % Wavespeed: how quickly does wave move
        c = 2;
        % Time interval [0, T]
        T = 1;   % Stable for m = 19, N = 80
        %T = 2;  % Just Stable for m = 19, N = 80
        %T = 2.1;  % Unstable for m = 19, N = 80
        % Discretization
        m = 19; N = 80;
        % Initial displacement sin waves
        f = @(x) sin(pi*x) + sin(2*pi*x);
        % Initial velocity zero
        g = @(x) zeros(size(x));
        fprintf('Example 1: Two sin initial condition')
    case {2}
        % Example 2: Vibrating string, fixed ends
        a = 0; b = 1;
        % Wavespeed: how quickly does wave move
        c = 2;
        ua = 0; ub = 0;
        T = 2;
        % Discretization for T = 2 with finer space grid
        %m = 19; N = 100;
        %m = 29; N = 150;
        %m = 39; N = 200;
        m = 99; N = 400;
        % Initial displacement: piecewise linear
        f = @(x) x.*(x<=0.6) + (1.5-1.5*x).*(x>0.6);
        % Initial velocity zero
        g = @(x) zeros(size(x));
        fprintf('Example 2: Piecwise linear initial condition')
    case{3}
        % Example 3 -- Vibrating string, fixed ends
        a = 0; b = 1;
        % Wavespeed: how quickly does wave move
        c = 2;
        % Time horizon
        T = 2;
        % Boundary conditions
        ua = 0; ub = 0;
        % Discretization
        %m = 4; N = 10;
        m = 19; N = 80;
        % Double number of grid points, halve hx, ht
        %m = 39; N = 160;
        % Initial displacement: sin
        c1 = 1; c2 = 2;
        f = @(x) c1*sin(pi*x);
        % Initial velocity non-zero
        g = @(x) 2*pi*c2*sin(pi*x);
        % Exact solution
        uex = @(x,t) sin(pi*x).*(c1*cos(2*pi*t)+c2*sin(2*pi*t));
        fprintf('Example 3: sin initial condition with exact solution')
end;

% Discretization of space
% Number of space points is m+2 from
% a = x_0 < x_1 < ... < x_m < x_{m+1} = b
hx = (b-a) / (m+1);
x = linspace(a, b, m+2);
fprintf('Space interval = [%.4f, %.4f]\n', a, b);
fprintf('Space discretization: ');
fprintf('Number of points m+2, m = %d, hx = %.2f\n', m, hx);

% Discretization of time
% Number of time points is N+1 from 0 = t_0 < t_1 < ... < t_N = T
ht = T / N;
t = linspace(0, T, N+1);
fprintf('Time interval = [0, %.4f]\n', T);
fprintf('Time discretization: ');
fprintf('Number of steps N = %d, ht = %.4f\n', N, ht);

% Stability parameter for explicit central difference discretization
% of wave equation
r = c^2 * ht^2 / hx^2;
fprintf('Stability constant r = %.4f\n', r);

% Coefficient matrix for next time step as matrix multiplication
e = ones(m,1);
A = spdiags([r*e 2*(1-r)*e r*e], [-1 0 1], m, m);

% Force x to be a column vector
x = x(:);

% Storage for 3-D plot
U = zeros(m+2, N+1);

% Initial conditions for time 0
u = f(x);
% Force bounday conditions at t = 0
u(1) = ua; u(m+2) = ub;
% Store values
U(:,1) = u;
uold = u;

figure(1)
ph = plot(x, u);
if ex == 3
    umax = 2.5*max(abs(u));
else
    umax = 1.5*max(abs(u));
end;
ylim([-umax umax]);
grid on
xlabel('x')
ylabel('u(x, t)')
tstr = sprintf('Wave equation: %s method, r = %.2f', mstr, r);
title(tstr);
set(ph, 'EraseMode', 'xor');
tpos = [a + 0.71*(b-a) 0.86*umax];
th = text(tpos(1), tpos(2), 'Time = 0');
set(th, 'EraseMode', 'xor', 'FontWeight', 'Bold', 'Color', 'm', 'FontSize', 15)
disp('Press any key to continue ...'); pause;

% First time step using initial velocity g
u(2:m+1) = (r/2)*u(1:m)+(1-r)*u(2:m+1)+(r/2)*u(3:m+2) + ht*g(x(2:m+1));
u(1) = ua; u(m+2) = ub;
U(:,2) = u;
unew = zeros(size(u));

% Time count
t0 = cputime;

% Time stepping loop
for ell = 2:N

    % Time point
    t_ell = ell*ht;

    % Explicit method: second order time, second order space
    % Central difference in time, central difference in space
    % unew = A*u - uold
    unew(2:m+1) = r*u(1:m) + 2*(1-r)*u(2:m+1) + r*u(3:m+2) - uold(2:m+1);

    % Boundary conditions
    u(1) = ua; u(m+2) = ub;

    % Plot wave at time t
    %plot(x, u);
    set(ph, 'YData', u);
    str = ['Time = ' num2str(t_ell)];
    set(th, 'String', str);
    % MUST comment out pause for the cputime to make any sense!
    pause(0.05)

    U(:,ell+1) = unew;

    % Store values for next time step
    uold = u;
    u = unew;

end;

tc = cputime - t0;
fprintf('CPU time for %s method = %.2f\n', mstr, tc);

figure(2)
mesh(t, x, U);
view(135,25);
xlabel('t')
ylabel('x')
zlabel('u(x, t)')
title(tstr);

% If exact solution defined, calculate and plot error
if exist('uex')
    [TG, XG] = meshgrid(t, x);
    Uex = uex(XG, TG);
    Uerr = Uex - U;
    emax = max(max(abs(Uerr)));
    fprintf('Maximum error = %.2e\n', emax);
    figure(4)
    mesh(t, x, Uerr);
    view(135,25);
    xlabel('t')
    ylabel('x')
    zlabel('Error in computed u(x, t)')
    tstr = sprintf('Error in wave equation: %s method, r = %.2f', mstr, r);
    title(tstr);
end;


