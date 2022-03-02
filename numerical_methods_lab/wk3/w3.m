% MATH2089 NM Tutorial Week 3 Template

%% QUESTION 17

A = [2 -1 2; -1 1 -1; 2 -1 3]

% (a) A is symmetric
% Method 1) 
is_symmetric = issymmetric(A)
% Method 2: Use relative error of matrix transpose and itself
diff_is_zero_means_symmetric = norm(A - transpose(A)) / norm(A)
% Method 3: Use a for loop to check for each element

% (b) Cholesky factorization
[R, flag] = chol(A)

% (c) A is positive definite ?
eig(A)
% Yes, since all the eigenvalues are positive

% (d) find the inverse of A using Cholesky factorization

%Method 1)
inv(R) * inv(transpose(R)) 
% (e) computational cost for matrix inversion

%Method 1)
% Cholesky factorisation is 1/3n^3
% Transposing R is n(n+1)/2 = O(n^2)
%Finding inv(R) and R^t is O(n^2). Therefore using Cholesky factorisation
%to find the inverse costs 1/3n^3 + O(n^2)

% (f) condition numbers
k_1 = cond(A, 1)
k_inf = cond(A, Inf)

% (g) relative error
%Since A is known precisely, the error is eps
rel_err = k_1 * (eps + 0.5E-4)

%% QUESTION 18

A = [1 1 3 0; 1 3 0 0; -2 0 0 1; 3 0 0 2]
b = [0; 5; -6; 2]

% (a) LU factorization uses partial pivoting
[L1, U1, p1] = lu(A, 'vector')  
x1 = U1 \ (L1 \ b(p1)); x1T = x1'

% (b) LU factorization requires permutation
chk = norm(A-L1*U1, 1) 


% (c) sparsity of A as percent


% (d) permute the columns of A using colamd
pc = colamd(A)
B = A(:,pc) 
[L2, U2, p2] = lu(B, 'vector')
x2 = U2 \ (L2 \ b(p2)); x2T = x2'

% (e) permuting columns changes the labelling of variables


%% QUESTION 19

% (a) load west0156 into sparse matrix A


% (b) size, issparse


% (c) look up A_ij for i = 146,...,156 and j = 1,...,5


% (d) B = A' A, p = symrcm(B), C = B(p,p)


% (e) spy plots


% (f) symmetry


% (g) sparsity as percent


% (g) symrcm


% (h) bandwidth


% (i) Is B positive definite?