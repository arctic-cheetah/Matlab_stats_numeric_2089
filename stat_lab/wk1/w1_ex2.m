%Exercise 1:
%%
%a)
figure(1);
n_bins = floor(length(Inflow));
histogram(Inflow, 6);
xlabel("Inflow of water (m^3 / s)");
ylabel("Number of observations");
title("Hardap Dam Inflow 1962 - 1986")
%%
%b)
avg = mean(Inflow)
variance = var(Inflow)
quartiles = quantile(Inflow, [0 : .25 : 1])

%%
%c)
figure(2);
histogram(Inflow, n_bins, "Normalization", "pdf");
xlabel("Inflow of water (m^3 / s)");
ylabel("Frequency of observations");
title("Hardap Dam Inflow 1962 - 1986")

%%
%d)
figure(3);
histogram(Inflow, 50, "Normalization", "pdf");
xlabel("Inflow of water (m^3 / s)");
ylabel("Frequency of observations");
title("Hardap Dam Inflow 1962 - 1986")

% The greater the number of 'bins' aka classes,
% the more susceptible the data is to noise and
% the harder it is to discern any noticable patterns.

%%
%e)
figure(5);
edges = [0, 500, 1500, 3000, 6500];
histogram(Inflow, edges, "Normalization", "pdf");
xlabel("Inflow of water (m^3 / s)");
ylabel("Frequency of observations");
title("Hardap Dam Inflow 1962 - 1986")

%%
%f)
fprintf("Mean %f > Median %f\n", avg, quartiles(3));
% The mean is larger than the median 
% because there are outliers that affect the
% calculation of the average. Where as the median is
% unaffected.

%%
% g)
% The histogram in e) portrays the gaps between data, 
% have a non-zero frequency. However, the frequency should
% be zero because for example, an inflow of 4000m/s^2 has
% never been recordered

%%
% h)
figure(6);
log10_inflow = log10(Inflow)
histogram(log10_inflow, n_bins);
xlabel("Logarithmic Inflow of Water log10(m^3 / s)");
ylabel("Number of observations");
title("Hardap Dam Inflow 1962 - 1986 as Log10")

%% 
% i)
% is it better to used a normalised or unnormalised histogram?
% What is the advantage of using a log scale to find skewness?

log10_skew = skewness(log10_inflow)
skew = skewness(Inflow)

%Log10 scaled data is slightly negatively skewed, 
%close to zero and indicating symmetry
%Ordinary data shows positive skewness








