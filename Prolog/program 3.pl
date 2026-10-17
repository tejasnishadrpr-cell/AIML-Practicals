% Append two lists
my_append([], L, L).
my_append([H|T], L, [H|R]) :-
    my_append(T, L, R).

% Reverse a list
my_reverse([], []).
my_reverse([H|T], R) :-
    my_reverse(T, RT),
    my_append(RT, [H], R).

% Search for an element
my_member(X, [X|_]).
my_member(X, [_|T]) :-
    my_member(X, T).

% Find length
my_length([], 0).
my_length([_|T], N) :-
    my_length(T, N1),
    N is N1 + 1.
