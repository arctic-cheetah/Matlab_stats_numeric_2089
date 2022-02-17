%Exercise 3

%%
% a)
AgeUS = [];
arr_len = length(Name);
for i = 1 : arr_len
   if (strcmp(Country(i), "US") )
       AgeUS(i) = Age(i);
   end
end

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























