%           c
%           ^
%           |
% a <-----> b
edge(a, b).  
edge(b, a).  
edge(b, c).

% :- table path/3.
path(X, Y, [X, Y]) :- edge(X, Y).
path(X, Y, [X|P]) :- edge(X, Z), path(Z, Y, P).