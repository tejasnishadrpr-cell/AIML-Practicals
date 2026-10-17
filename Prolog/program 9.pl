% Objective function
value(X, Y) :-
    Y is -((X - 3) * (X - 3)) + 9.

% Find a better neighbouring value
better(X, Next) :-
    Next is X + 1,
    value(Next, V1),
    value(X, V),
    V1 > V.

better(X, Next) :-
    Next is X - 1,
    value(Next, V1),
    value(X, V),
    V1 > V.

% Hill climbing
hill(X, Best) :-
    (better(X, Next) ->
        hill(Next, Best)
    ;
        Best = X
    ).
