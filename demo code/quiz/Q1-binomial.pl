binomial(_, 0, 1).
binomial(N, N, 1).
binomial(N, K, C) :-
    N > K, K > 0,
    N1 is N - 1, K1 is K - 1,
    binomial(N1, K1, C1),
    binomial(N1, K,  C2),
    C is C1 + C2.