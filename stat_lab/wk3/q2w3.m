% Q2 Poisson distribution

%% ai) 
i_ = poisscdf(3, 7)
% or
% poisscdf(0:3,7)

%% aii)
ii_ = poisscdf(2, 7)

%% aiii)

iii_ = sum(poisspdf(19:20, 7)) 
%or 
%poisspdf(19, 7) + poisspdf(20,7)

%% aiv)
% P (Q > 0) = 1 - P(Q == 0)
iv_ = 1 - poisspdf(0, 7)

%% bi)
lambda = 16 %1 star per 16cubic light years
% P(V >= 2) = 1 - P(V <= 1)
i_ = 1 - poisscdf(1, 1)

%% bii)
%48 light years