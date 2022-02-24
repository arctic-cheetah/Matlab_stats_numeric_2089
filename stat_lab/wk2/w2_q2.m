%% a)
%i)
max(rand([10, 1]))

%% ii)
Y = []
for i = 1:1000
    Y(i) = max(rand([10, 1]))
end

%% iii)
histogram(Y, [0: 0.05 :1], 'Normalization', 'pdf')
hold on

%% b
f = @(y) 10*y.^9;
x_scale = [0 : 0.05 : 1]
plot(x_scale, f(x_scale), 'b')