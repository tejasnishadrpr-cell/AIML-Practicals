% Graph
edge(a, b).
edge(a, c).
edge(b, d).
edge(c, d).
edge(d, e).

% Heuristic values
h(a, 5).
h(b, 3).
h(c, 2).
h(d, 1).
h(e, 0).

% Greedy Best-First Search
greedy(Start, Goal, Path) :-
    greedy_queue([Start-[Start]], Goal, RevPath),
    reverse(RevPath, Path).

greedy_queue([Goal-Path|_], Goal, Path).

greedy_queue([Node-Path|Rest], Goal, Result) :-
    findall(H-[Next|Path],
        (edge(Node, Next),
         \+ member(Next, Path),
         h(Next, H)),
        New),
    append(Rest, New, Queue),
    keysort(Queue, Sorted),
    greedy_queue(Sorted, Goal, Result).
