% Objective function
value(X, Y) :-
    Y is -((X - 3) * (X - 3)) + 9.

% Simulated Annealing
anneal(X, 0, X).

anneal(X, T, Best) :-
    T > 0,
    random_between(-1, 1, Step),
    Next is X + Step,
    value(X, V),
    value(Next, NV),
    (NV >= V ->
        Chosen = Next
    ;
        random(R),
        P is exp((NV - V) / T),
        (R < P -> Chosen = Next ; Chosen = X)
    ),
    T1 is T * 0.9,
    anneal(Chosen, T1, Best).
