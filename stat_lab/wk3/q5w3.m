%Q5

%% ai) ii) iii)
ai = normcdf(1) - normcdf(-1)
aii = normcdf(2) - normcdf(-2)
aiii = normcdf(3) - normcdf(-3)

%iv
% parts i, ii, iii all refer to the standard normal distribution, at 1, 2
% and 3 standard deviations or the 68,95,99 rule

%% v)P(Z >= z) = 0.05 = 1 - P(Z <= z) 
av = norminv(0.95)
avi = norminv(0.025)
aviii = norminv(0.005)

%% bv)
z = @(x) (x - 3) / 2
bv = normcdf(z(5)) - normcdf(z(1))

%% ci)
% X is the random variable for exposure of PM in, ug / m^3
mean_PM = 7.1 %ug / m^3
std_PM = 1.5
z = @(x) (x - mean_PM) / std_PM
% P(X >= 9)
ci = 1 - normcdf(z(9))

%% cii)
cii = normcdf(z(8)) - normcdf(z(3))

%% ciii)
% P(X >= x) = 0.05
% 1 - P(X <= z) = 0.05
z_iii = norminv(1 - 0.05);
ciii = z_iii * std_PM + mean_PM

