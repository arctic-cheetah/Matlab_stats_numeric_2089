%Q2
%% a)
p = 0.5;
B =  binornd(1, p, [100, 500]);

%% b)
%mean() computes each column
%Compute the mean of each row;
mean_sample_B = mean(transpose(B));
estimated_mean_of_B = sum(mean_sample_B) / 100
st_err_of_B = var(estimated_mean_of_B)


%% c)
%Expect variance to become very small (or zero) and mean to approach to n*p


%% d)
%Expect sampling distribution to approach a normal distribution
figure(1);
title("Sampling the mean from the binomial distribution");
histogram(mean_sample_B, 10);

%%e)
%Sample distribution fits the normal distribution very well
histfit(mean_sample_B, 10, 'normal')




