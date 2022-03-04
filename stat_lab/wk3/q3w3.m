%Q3

%% ai)
%0.5
ai_ = unifcdf(0, -1, 1)
%% aii)
%0.5
aii_ = unifcdf(0, -1, 1)

%% aiii)
aiii_ = unifcdf(0.8, -1, 1) - unifcdf(-0.9, -1, 1)

%% aiv)
aiv_ = unifinv(0.9, -1, 1)

%% b i)
%Let Y be the random variable for the thickness of the photoresist
% P(Y >= 0.2125) = 1 - P(Y <= 0.2125)
bi_ = 1 - unifcdf(0.2125,  0.2050, 0.2150)

%% b ii)
%%0.2140
bii_ = unifinv(0.9, 0.2050, 0.2150) 