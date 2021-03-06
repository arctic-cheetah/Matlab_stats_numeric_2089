%% MATH2089 NM Tutorial Week 1 Template

%% QUESTIONS 1-3

%Q1a:
abs_error = abs(sqrt(2) - 1.414);
rel_error = abs_error / sqrt(2);
fprintf('Q1a) Absolute error: %.10f \n', abs_error);
fprintf('\tRelative error: %.10f\n', rel_error);

%Q1b:
abs_error = 0.5E-2;
rel_error = abs_error / 1034.46;
fprintf('Q1b) Absolute error: %f \n', abs_error);
fprintf('\tRelative error: %f\n', rel_error);

%Q1c:
abs_error = 0.5E-4;
rel_error = abs_error / 200;
fprintf('Q1c) Absolute error: %f \n', abs_error);
fprintf('\tRelative error: %f\n', rel_error);


%Q1d:
f_d = @(x) sin(x) - x;
abs_error_i = 2^(-52);
abs_error_ii = 2^(-52);
rel_error_ii = abs(abs_error_ii / f_d(0.1));
fprintf('Q1d i) Absolute error: %.6e \n', abs_error_i);
fprintf('Q1d ii) Absolute error: %.6e \n', abs_error_ii);
fprintf('Q1d ii) Relative error: %.6e \n', rel_error_ii);

%%


%  Home exercises

%% QUESTION 4 

%  Download explot.m from Moodle and run it
explot

%% QUESTION 5

% (a) pi with standard format
format % restore the default setting
pi

% (b) pi with format long 
format long
pi

% (c) pi to 8 s.f.
p = 3.1416;

% (d) absolute and relative errors
abs_err = abs(p - pi)
rel_err = abs_err / pi

% (e) y = sin(x) with large x
x = 2E30 - floor(2E30/pi)
y = sin(x);
fprintf("%e\n", y);

% (f) plot y = sin(x) with large x
f_d = @(x) sin(pi * 10.^x);
x = [1:100];
y = f_d(x);
plot(x,y);


%% QUESTION 6

% (a)
a = 0.75*0.2 - 0.15 

% (b)
b1 = floor(6/1)    
b2 = floor(0.6/0.1)

% (c)
h = 1e-14;
c = 100+h-100 

% (d)
h = 1e-15
d = 100+h-100 

% (e)
eps, realmax, realmin

% (f)
f1 = 1+eps>1   
f2 = 1+eps/2>1 

%% QUESTION 7

% (a)
a1 = 1/0       
a2 = -1/0      
a3 = log(0)    
a4 = log(-1)  

% (b)
b1 = 0/0        
b2 = Inf - Inf  
b3 = 0*Inf      
b4 = 0*NaN      

%% QUESTION 8

% learn to use help


%% QUESTION 9

% (a) largest t such that e^t is finite
%x = intmax('uint64'); %18446744073709551615
t = log(realmax) % ~709


% (b) e^{-t} for t = 700,710,...,800
x = [700:10:800]
tmp = exp(-x)


%% QUESTION 10
% recursion sensitive to error in initial value

format long;
q_10( 0.367879)
q_10(exp(-1))



function res = q_10(initial)
    fprintf("Initial value: %.16f \n", initial)
    res = [initial];
    for i = 2 : 10
        res(i) = 1 - i*res(i - 1);
    end
end















