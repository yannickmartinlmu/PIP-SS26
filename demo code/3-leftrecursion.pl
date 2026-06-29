:- set_prolog_flag(double_quotes, chars).


% Printing the tree works by default
% phrase(tree_nodes(node(a, node(b, nil,node(c, nil, nil)), node(d, nil, nil))), Ns).
% But generating trees needs tabling: 
% phrase(tree_nodes(Tree), "abcd"). 

:- table tree_nodes//1.
tree_nodes(nil) --> [].
tree_nodes(node(Name, Left, Right)) -->
        tree_nodes(Left),
        [Name],
        tree_nodes(Right).