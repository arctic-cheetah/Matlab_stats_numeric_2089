%Exercise 4
%data is crash.txt

%Metadata
filename = "crash.txt";
delimiter = '\t';
dat = importdata(filename, delimiter)


%%
% ai)
chest_five_summary = quantile(Chest, [0 : .25 : 1])
chest_mean = mean(Chest)
chest_var = var(Chest)
chest_sd = sqrt(chest_var)

%%
% aii)
chest_sum = sum(Chest >= 60)

%%
% aiii)
figure(1)
%Use the sqrt of the number of element in Chest
%n_bin = 6 is too small and masks too much data to discern
%a pattern

%n_bin = 25 is too large and permits too much noise to
% establish a pattern

n_bins = ceil(sqrt(length(Chest)))
histogram(Chest, n_bins, "Normalization", "pdf")
xlabel("Chest deacceleration in units of (g)");
ylabel("Frequency");
title("Chest Deacceleration during a car accident");

%%
% bi)
figure(2);
boxplot(Chest, Airbag)
xlabel("Airbag protected passenger (true/false)")
ylabel("Chest impact acceleration in g")
title("Airbag protection against Chest Acceleration")

%%
%bii)
% The spread of the data for those protected with an airbag
% is smaller than those that are unprotected. The median 
% of chest deacceleration for those procted with an airbag
% is also lower than those unprotected

%%
%biii)
% There is an outlier in the data for unprotected individuals

%%
%biv)

protected = Chest(Airbag > 0);
unprotected = Chest(Airbag == 0);
skew_protect = skewness(protected)
skew_unprotect = skewness(unprotected)

% Data for those protected: 
% appear to have a slight positive skew
% Data for those unprotected:
% appear to a stronger positive skew than those protected

%%
% ci)
figure(3);
boxplot(Chest, Doors)
xlabel("Number of doors")
ylabel("Chest impact acceleration in g")
title("Number of Car Doors against Chest Acceleration")


% The increase in median of chest impact due to a greater
% number of doors suggest that more doors may cause 
% a higher g deacceleration to the chest

%%
% cii)
% A vehicle with 2 doors tends to have the least severe
% injury

%%
% ciii)
% This could be due to the fact the a car with a greater 
% number of doors is more heavier. During a crash this 
% would mean rapid and more lethal deacceleration to the 
% chest

%%
% d)
boxplot(Weight, Doors);
xlabel("Number of doors")
ylabel("Mass of car (kg)")
title("Number of Car Doors against Chest Acceleration")

% This suggests that assuming a greater number of doors
% means a greater mass of the vehicle, the deacceleration
% to the chest is higher than those cars with a smaller 
% number of doors or mass.











