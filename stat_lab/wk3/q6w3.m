% Q6
my_sz = [1,10];
%% ai)
data_norm = normrnd(3, 4, my_sz);
figure(1);
qqplot(data_norm);
% Close to the normal distribution
%% aii)
data_unif = unifrnd(0, 1, my_sz);
figure(2);
qqplot(data_unif);
% histogram(data_unif, 100)
%Not close to normal

%% aiii)
data_exp = exprnd(4, my_sz);
figure(3);
qqplot(data_exp);
%Not close to normal, skewed strongly to the right amd slightly skewed to the left

%% aiv)
data_bino = binornd(20, 0.9, my_sz);
figure(4);
qqplot(data_bino);
% Not close to normal

%% av)
data_poiss = poissrnd(9, my_sz);
figure(5);
qqplot(data_poiss);
%slightly skewed. But sometimes the poisson may approach normal

%b)
%Sample size makes it difficult to judge whether something is normally
%distributed. But many figures resemble normal distributions, albeit with
%a small number of data points

%% ci)
%ensure to add inflows.txt to PATH
tb = readtable("inflows.txt");
rain = table2array(tb(:, "Inflow"))
clf('reset')
qqplot(rain)
%Data is strongly right skewed