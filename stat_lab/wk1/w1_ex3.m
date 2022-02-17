%Exercise 3
%Use presdat.txt
%%
% a)
% Worser version:
% AgeUS = [];
% j = 1;
% arr_len = length(Name);
% for i = 1 : arr_len
%    if (strcmp(Country(i), "US") )
%        AgeUS(j) = Age(i);
%        j = j + 1;
%    end
% end
AgeUS = Age(strcmp(Country, "US"))

%%
% b)
figure(1);
plot(AgeUS)
title("President age against time");
xlabel("Time");
ylabel("Age");

%%
% c)
figure(2);
n_bin = floor(sqrt(length(AgeUS)));
histogram(AgeUS, n_bin)
title("Age of US Presidents")
xlabel("Age");
ylabel("Number of ages");

%%
% d)
edges = [42 : 3 : 78];
figure(3);
histogram(AgeUS, edges);
title("Age of US Presidents with Edges")
xlabel("Age");
ylabel("Number of ages");

%%
% e)
% Increasing the resolution of the class via 'edges'
% displays the most common age for a US president than
% using n_bins

%%
% f)
% AgeAU = [];
% j = 1;
% for i = 1 : arr_len
%    if (strcmp(Country(i), "Aust") )
%        AgeAU(j) = Age(i);
%        j = j + 1;
%    end
%    
% end
AgeAU = Age(strcmp(Country, "Aust"));
fprintf("Australian PM data (mean, variance, SD):")
mean_AU = mean(AgeAU)
var_AU = var(AgeAU)
sd_AU = sqrt(var_AU)

fprintf("US President data (mean, variance, SD):")
mean_US = mean(AgeUS)
var_US = var(AgeUS)
sd_US = sqrt(var_US)

%%
% g)
figure(4);
boxplot(Age,Country);
title("Boxplot of National Leader Age");
ylabel("Age of Leader");
xlabel("Nation");

%%
% h)
fprintf("Australia: Five number summary:");
AU_quantile = quantile(AgeAU, [0 : .25 : 1])

fprintf("USA: Five number summary:");
US_quantile = quantile(AgeUS, [0 : .25 : 1])

%%
% i)
%Joe Biden

%%
% j)
% The box plots display similar IQR's and their medians'
% are close. Albeit, Australian PM's tend to be slightly 
% younger because of the lower median.
% Aside from the outlier from the US, there
% does not appear to be a significant difference in age
% for leaders to take office































