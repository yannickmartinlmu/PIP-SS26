log_event(Msg) :-
    get_time(T),
    format("[~w] ~w~n", [T, Msg]).