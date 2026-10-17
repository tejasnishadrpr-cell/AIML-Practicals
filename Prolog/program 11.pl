% Available colors
color(red).
color(green).
color(blue).

% Adjacent regions
adjacent(a, b).
adjacent(a, c).
adjacent(b, c).
adjacent(b, d).
adjacent(c, d).

% Two adjacent regions cannot have the same color
different(X, Y) :-
    adjacent(X, Y).
different(X, Y) :-
    adjacent(Y, X).

% Check a coloring
valid(A, B, C, D) :-
    color(A),
    color(B),
    color(C),
    color(D),
    different(a, b),
    A \= B,
    A \= C,
    B \= C,
    B \= D,
    C \= D.
