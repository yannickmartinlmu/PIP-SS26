fib_tail(N, Result) :- fib_tail(N, 1, 1, Result).
fib_tail(0, A, _, A) :- !.
fib_tail(N, A, B, Result) :-
    N > 0,
    N1 is N - 1,
    Sum is A + B,
    fib_tail(N1, B, Sum, Result).

:- table fib/2.
fib(0, 1).
fib(1, 1).
fib(N, F) :-
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    fib(N1, F1),
    fib(N2, F2),
    F is F1 + F2.

measure_both(X) :-
    format("Tabled:"),
    time(fib(X, _)),
    format("Tail-Recursive:"),
    time(fib_tail(X, _)).