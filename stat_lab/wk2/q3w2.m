%% a)
f = @(x) 1/46 * exp(-x ./ 46);
x = linspace(0, 200, 10001);

figure(1);
plot(x, f(x))

%% d)
figure(2);
data = exprnd(46, [1, 1000]);
histogram(data, 'Normalization', 'pdf' )

%The density histogram closely follows the curve in part a)

%% iii)
x_mean = mean(data)
%The mean for the vector is very close to the true mean in part b)

%% iv)
% num_accident_greater_than_30 = data(data > 30);
p30 = numel(data(data > 30)) / 1000
% The proportion of values greater than 30 is close to 
% true value by around 0.05
