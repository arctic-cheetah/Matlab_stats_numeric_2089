%Week 2 exercise for statistics
A = [2, 4, 6];
B = [1, 2, 3, 4];
A_intersect_B = [2,4];


%% b)

%ii)
data = randi(6, [1, 1000]);
num_found_A = ismember(data, A);
pa = sum(num_found_A(:) == 1) / 1000

%iii)
num_found_B = ismember(data, B);
pb = sum(num_found_B(:) == 1) / 1000

%iv)
num_found_AB = ismember(data, A_intersect_B);
pab = sum(num_found_AB(:) == 1) / 1000

