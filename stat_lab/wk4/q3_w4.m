%% ai)
i = 1;
tb = readtable("kevlar90.txt");
data = table2array(tb);

%% aii)
subplot(1, 2, 1);
histogram(data, 10, "Normalization", 'pdf')
%Sample distribution appears to fit the exponential distribution
subplot(1, 2, 2);
histfit(data, 10, "exponential")

%% aiii)

mean_x = mean(data)

%% aiv)
sample_std = sqrt(var(data))


%% b)
i = sample_exp(10, mean_x, i)

%% c)
i = sample_exp(500, mean_x, i)


%% bi)
function [i] = sample_exp(n, smp_mean, i)
    T = exprnd(smp_mean, [n, 1000]);
    tmp = size(T);
    T_rows = tmp(1);

    %% bii)
    sample_mean_T = mean(transpose(T));
    %% biii)
    % Expect for the sample mean and var to be very similar to T's mean and var
    mean_T = sum(sample_mean_T) / T_rows
    var_T = mean_T

    %% biv)
    % Expect sampling distribution of X to be normal dist
    figure(i)
    subplot(1, 2, 1)
    histogram(sample_mean_T, ceil(sqrt(T_rows)), "Normalization", "pdf")

    %% bv)
    subplot(1, 2, 2)
    histfit(sample_mean_T, ceil(sqrt(T_rows)), "normal")
    i = i + 1;
end



