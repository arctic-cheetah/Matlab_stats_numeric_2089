% MATH2089: File = exheat1dtime.m
% Solution of heat equation in 1 space variable and time
% using Explicit, Fully Implicit or Crank-Nicolson methods

format compact

% Select method:
% mthd = 0 for Explicit method;
% mthd = 1 for Fully Implicit method
% mthd = 2 for Crank-Nicolson
mthd = 0;

fprintf('\nHeat equation in 1 space variable and time\n');
if mthd == 0
   mstr = 'explicit';
elseif mthd == 1
   mstr = 'fully implicit';
elseif mthd == 2
   mstr = 'Crank-Nicolson';
else
   error(['Unknown method ' num2str(mthd) ' specified']);
end;
fprintf('using an %s method\n', mstr);

% Space interval [a, b]
a = 0; b = 1;
% Number of space points is m+2 from a = x_0 < x_1 < ... < x_m < x_{m+1} = b
%m = 9;
m = 19;
%m = 99;
fprintf('Space interval = [%.4f, %.4f]\n', a, b);
fprintf('Number of points in space discretiztion m+2, m = %d\n', m);

% Time interval [0, T]
T = 10;  % Stable for m = 19, N = 80
%T = 20;   % Unstable for m = 19, N = 80
% Number of time points is N+1 from 0 = t_0 < t_1 < ... < t_N = T
%N = 10;
N = 80;
%N = 200;
fprintf('Time interval = [0, %.4f]\n', T);
fprintf('Number of steps in time discretiztion N = %d\n', N);

% Diffusion constant: how quickly does heat move
D = 0.008;

% Discretization
hx = (b-a) / (m+1);
x = linspace(a, b, m+2); % Only needed for plotting
ht = T / N;
t = linspace(0, T, N+1); % Only needed for 3-D plot

% Plot grid points
figure(1)
axis([0 T a b])
grid on
set(gca, 'XTick', t)
set(gca, 'YTick', x)
hold on
lw = 4;
plot([0 0], [a b], 'b-', 'LineWidth', lw);
plot([0 T], [a a], 'g-', 'LineWidth', lw);
plot([0 T], [b b], 'g-', 'LineWidth', lw);
hold off
xlabel('Time t in [0, T]')
ylabel('Space x in [a, b]')
title('Discretization of domain')

% Stability constant in discretization
s = D*ht / hx^2;
fprintf('Stability constant s = %.4f\n', s);

% Sparse linear system for temperature at next time step
if mthd == 1
   % Fully implicit method
   e = ones(m,1);
   A = spdiags([-s*e (1+2*s)*e -s*e], [-1 0 1], m, m);
elseif mthd == 2
   % Crank-Nicolson method
   e = ones(m,1);
   A = spdiags([(-s/2)*e (1+s)*e (-s/2)*e], [-1 0 1], m, m);
end;

% Initial condition
u = 20 + 80*sin(pi*(x-a)/(b-a));  % Single sinusoid
%u = 20 + 20*abs(sin(4*pi*(x-a)/(b-a))); % 4 caps

% Force u to be a column vector for implicit methods
u = u(:);

% Boundary conditions
ua = 20;
ub = 20;

% Force boundary conditions at t = 0
u(1) = ua;
u(m+2) = ub;

figure(2)
ph = plot(x, u);
grid
xlabel('x')
ylabel('u(x, t)')
tstr = sprintf('Heat equation: %s method, s = %.2f', mstr, s);
title(tstr);
set(ph, 'EraseMode', 'xor');
tpos = [a + 0.7*(b-a) 0.92*max(u)];
th = text(tpos(1), tpos(2), 'Time = 0');
set(th, 'EraseMode', 'xor', 'FontWeight', 'Bold', 'Color', 'm', 'FontSize', 15)
disp('Press any key to continue ...'); pause;

% Storage for 3-D plot
U = zeros(m+2, N+1);
U(:,1) = u;  % Initial condition

% Time count
t0 = cputime;

% Time stepping loop
for ell = 1:N
   
   % Time point
   t_ell = ell*ht;
   
   % Implicit or explicit method
   if mthd == 0
      % Explicit method: first order time, second order space
      % forward difference in time, central difference in space
      u(2:m+1) = s*u(1:m) + (1-2*s)*u(2:m+1) + s*u(3:m+2);
   elseif mthd == 1
      % Fully implicit method: first order in time, second order in space
      % Set up right-hand-side of linear system
      b = u(2:m+1);
      b(1) = b(1) + s*ua;
      b(m) = b(m) + s*ub;
      % Solve tridiagonal linear system for internal nodes
      u(2:m+1) = A \ b;
   elseif mthd == 2
      % Crank-Nicolson method: second order in time and space
      % Set up right-hand-side of linear system
      b = (s/2)*u(1:m) + (1-s)*u(2:m+1) + (s/2)*u(3:m+2);
      b(1) = b(1) + (s/2)*ua;
      b(m) = b(m) + (s/2)*ub;
      % Solve tridiagonal linear system for internal nodes
      u(2:m+1) = A \ b;
   end;

   % Boundary conditions
   u(1) = ua; u(m+2) = ub;
   
   % Plot temperature
   %plot(x, u);
   set(ph, 'YData', u);
   str = ['Time = ' num2str(t_ell)];
   set(th, 'String', str);
   % MUST comment out pause for the cputime to make any sense!
   pause(0.05)
   
   U(:,ell+1) = u;
   
end;

tc = cputime - t0;
fprintf('CPU time for %s method = %.2f\n', mstr, tc);

figure(3)
mesh(t, x, U);
shading interp
view(135,25);
xlabel('t')
ylabel('x')
zlabel('u(x, t)')
title(tstr);
