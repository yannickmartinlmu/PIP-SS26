%           c
%           ^
%           |
% a <-----> b
edge(a, b).  
edge(b, a).  
edge(b, c).

% :- table reach/2.
reach(X, Y) :- edge(X, Y).
reach(X, Y) :- edge(X, Z), reach(Z, Y).
