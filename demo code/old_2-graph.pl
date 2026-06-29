% path(a, c , P)
%           c
%           ^
%           |
% a <-----> b
edge(a, b).  
edge(b, a).  
edge(b, c).

:- table reach/2.
reach(X, Y) :- edge(X, Y).
reach(X, Y) :- edge(X, Z), reach(Z, Y).

%:- table path/3.
path(X, Y, [X, Y]) :- edge(X, Y).
path(X, Y, [X|P]) :- edge(X, Z), path(Z, Y, P).