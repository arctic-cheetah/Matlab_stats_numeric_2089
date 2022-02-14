function x = thomas(alpha, beta, gamma, b)
% x = thomas(alpha, beta, gamma, b)
% MATH2089: Fle = thomas.m
% Solves A*x = b where
% A = diag(alpha,-1) + diag(beta,0) + diag(gamma,1)
% Vector beta has length n, while alpha and gamma have length n-1

n = length(beta);
x = zeros(n,1);

% Gaussian elimination
for k = 1:n-1

   p = alpha(k)/beta(k);
   beta(k+1) = beta(k+1) - p*gamma(k);
   b(k+1) = b(k+1) - p*b(k);

end

% Backsubstitution
x(n) = b(n)/beta(n);
for k = n-1:-1:1

   x(k) = (b(k) - gamma(k)*x(k+1)) / beta(k);

end

