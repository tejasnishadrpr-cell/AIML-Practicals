% Four queens in four columns
queens(Q) :-
    Q = [A, B, C, D],
    permutation([1,2,3,4], Q),
    safe(Q).

% Check that queens do not attack diagonally
safe([]).
safe([H|T]) :-
    safe_row(H, T, 1),
    safe(T).

safe_row(_, [], _).
safe_row(H, [X|T], D) :-
    H =\= X + D,
    H =\= X - D,
    D1 is D + 1,
    safe_row(H, T, D1).
