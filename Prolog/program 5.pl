% Student marks
marks(rahul, 90).
marks(amit, 65).
marks(priya, 30).

% Classification rules
result(Name, topper) :-
    marks(Name, M),
    M >= 75.

result(Name, average) :-
    marks(Name, M),
    M >= 40,
    M < 75.

result(Name, fail) :-
    marks(Name, M),
    M < 40.
