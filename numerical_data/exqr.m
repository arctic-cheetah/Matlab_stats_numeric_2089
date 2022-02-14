% MATH2089: File = exqr.m
% Example on QR factorization
% (Updated 11 May 2020)

clear
format compact
format short e
echo on

% Define matrix A
% Try other examples
%A = [1 1; -1 1; 2 2]
A = [2 2; -2 -8; 1 -2]

% Number of rows and columns in A
[m, n] = size(A)

% Calculate QR factorization of A
[Q, R] = qr(A)

% Extract submatrices
Y = Q(:,1:n)
Z = Q(:,n+1:m)
R = R(1:n,1:n)

% Check A = YR
YR = Y*R
YRchk = norm(A-YR, 1)

% Check orthogonality of Y, Z
YTY = Y'*Y
ZTY = Z'*Y
ZTZ = Z'*Z

echo off