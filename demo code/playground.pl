% Fibonacci: tabling is a perfect fit (pure, no side-effects) 
:- table fibonacci/2.

fibonacci(0, 1).
fibonacci(1, 1).
fibonacci(N, F) :-
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    fibonacci(N1, F1),
    fibonacci(N2, F2),
    F is F1 + F2.




% TODO: Simple program that fails with tabling


%   Order of Demo:
%   1. ?- get_user_tabled(3, X).          % 2s, fails
%   2. ?- get_user_cached(3, X).          % 2s, fails (no cache entry written)
%   3. ?- assertz(user_db(3, user(3, bob))).
%   4. ?- get_user_tabled(3, X).          % instant false:  tabling cached the failure
%   5. ?- get_user_cached(3, X).          % 2s, succeeds:   retried, finds bob
%   6. ?- get_user_cached(3, X).          % instant hit:    now cached



% Dynamic user store, so can be extended at runtime with assertz or asserta
:- dynamic user_db/2.

user_db(1, user(1, alice)).
user_db(2, user(2, carol)).
% To add bob: assertz(user_db(3, user(3, bob))).


% Simulates an expensive external API call
fetch_user(Id, UserData) :-
    format('  [API] calling fetch_user(~w) ...~n', [Id]),
    sleep(2),
    user_db(Id, UserData).   % fails if user unknown


% Version A: built-in tabling 
% Tabling memoises every answer *and* every failure.
% Consequence: a failed lookup stays failed even after user_db is extended.
:- table get_user_tabled/2.

get_user_tabled(Id, UserData) :-
    fetch_user(Id, UserData).


%  Version B: explicit success-only cache 
% Only writes to cache on success, so a failed lookup is retried next time.
% Handles dynamic data correctly at the cost of re-running on each miss.
:- dynamic user_cache/2.

get_user_cached(Id, UserData) :-
    (   user_cache(Id, UserData)
    ->  format('  [Cache] hit for user ~w~n', [Id])
    ;   fetch_user(Id, UserData),        % fails here → nothing cached
        assertz(user_cache(Id, UserData))
    ).
