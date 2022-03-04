%%Binomial distribution
%Q1) 

%%a i)
p = 0.35;
i = nchoosek(20, 5) * p^5 * (1-p)^15

%% aii)
% P(5 <= y <= 14) = P(y <= 14) - P(4 <= y)
ii_ = binocdf(14, 20, p) - binocdf(4, 20, p)

%% aiii)
% P(5 < y <= 15) = P(5 < y <= 15) = P(y <= 15) - P(y <= 5)
iii_ = binocdf(15, 20, p) - binocdf(5, 20, p)

%% aiv)
% P(Y ∈ {1, 5, 9, 17})
iv_ = sum(binopdf([1, 5, 9, 17], 20, p))

%% av)
% P(Y ∈ {1, 5, 9, 17})
v_ = 1 - sum(binopdf([5, 13, 16], 20, p))

%%
% bi)
p = 1/5;
i_ = nchoosek(10, 10) * p^10

%% bii)
% P(x >= 5) = 1 - P(X <= 4)
ii_ = 1 - binocdf(4, 10, p)

%% iii) Probabilities are indpendent, so just multiply
pass_quiz = ii_ %A pass for a quiz occurs when a student answers 5 or more questions correctly
% let Y = number of quizes passed
% P(Y >= 1) = 1 - P(Y == 0)
pass = 1 - binopdf(0, 3, pass_quiz)

atleast_pass_one_quizz = pass * ii_;



