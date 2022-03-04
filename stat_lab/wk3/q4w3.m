%% Q4 ai) and aii)

ai_ = expcdf(2, 2)

%% aiii_

aiii_ = expcdf(13, 2) - expcdf(10, 2)

%% aiv)
% 1, since the CDF is between [0, 1]. 

%%bi)
ttf = 1/0.0003;
% Let T the random variable to describe the time till failure.
% P(t >= 1E4) = 1 - P(t <= 1E4)
bi_ = 1 - expcdf(1E4, ttf)

%% bii)
% P(t <= 7E3)
bii_ = expcdf(7E3, ttf)

%% biii)
% P(Y >= y) = 1 - P(Y <= y) = 0.95
%Therefore approx. 171 hrs
biii_ = expinv(1 - 0.95, ttf)
