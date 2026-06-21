sum_list_naive([], 0).
sum_list_naive([H|T], S) :-
    sum_list_naive(T, S1),
    S is S1 + H.