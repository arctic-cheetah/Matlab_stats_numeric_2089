function [p, P] = lagpol(x, y, z)
% [p, P] = lagpol(x, y, z)
% MATH2089: File = lagpol.m
% Evaluate interpolating polynomial using Lagrange polynomial basis
%  -- Input arguments --
% x = distinct data points
% y = data values (vector of same size as x)
% z = points where interpolating polynomial is evalauted
% -- Output arguments --
% p = values of interpolating polynomial at z
% P = array of values of individual Lagrange polynomials at z
%     Column j, P(:,j) contains values of j th Lagrange polynomial at z
% Deliberately confusing notation with lower case p and upper case P!

% Turn data into column vectors
x = x(:);
y = y(:);
% Number of data values = n
% Polynomials are of degree n - 1
n = length(x);

% Points where polynomial is to be evaluated
z = z(:);
m = length(z);

% Set up array for storing Lagrange polynomial values
P = zeros(m,n);
% Inefficient doubly nested loop to evaluate Lagrange polynomials
for j = 1:n
    
    v = ones(m,1);
    for k = [1:j-1 j+1:n]
        v = v .* (z - x(k))./(x(j) - x(k));
    end;
    P(:,j) = v;
    
end;

% Interpolating polynomial p, coefficients are data values y
% No linear system to be solved!
p = P*y;
    