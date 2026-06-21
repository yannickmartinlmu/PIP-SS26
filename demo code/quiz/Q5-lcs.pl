% Longest common subsequence (length only).
% lcs("It was the best of times, it was the age of wisdom", "It was the worst of times, it was the age of foolishness", L).
% It was the [...]st of times, it was the age of [...]is[...]
:- set_prolog_flag(double_quotes, chars).   % "..." -> list of chars, not an opaque string
lcs([], _, 0).
lcs(_, [], 0).
lcs([X|Xs], [X|Ys], L) :-
    lcs(Xs, Ys, L0),
    L is L0 + 1.
lcs([X|Xs], [Y|Ys], L) :-
    X \= Y,
    lcs([X|Xs], Ys, L1),
    lcs(Xs, [Y|Ys], L2),
    L is max(L1, L2).