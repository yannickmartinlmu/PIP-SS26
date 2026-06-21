% --- Q1 ---: YES, pure, overlapping, perfect fit
binomial(_, 0, 1).
binomial(N, N, 1).
binomial(N, K, C) :-
    N > K, K > 0,
    N1 is N - 1, K1 is K - 1,
    binomial(N1, K1, C1),
    binomial(N1, K,  C2),
    C is C1 + C2.


% --- Q2 --- NO, has desired side-effect
log_event(Msg) :-
    get_time(T),
    format("[~w] ~w~n", [T, Msg]).

% --- Q3 --- NO, has non-determinism, repeats the same number
roll_die(N) :- random_between(1, 6, N).


% --- Q4 --- MAYBE, no benefit, but no penality either (except small overhead)
sum_list_naive([], 0).
sum_list_naive([H|T], S) :-
    sum_list_naive(T, S1),
    S is S1 + H.

% --- Q5 --- YES
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


% --- Q6 --- NO, calculation is non-finite. 
nat(0).
nat(N) :- nat(M), N is M + 1.

