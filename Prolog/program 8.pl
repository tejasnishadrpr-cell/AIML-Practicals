% Graph
edge(a, b).
edge(a, c).
edge(b, d).
edge(c, d).
edge(d, e).

% Heuristic values
h(a, 4).
h(b, 3).
h(c, 2).
h(d, 1).
h(e, 0).

% A* Search
astar(Start, Goal, Path) :-
    h(Start, H),
    astar_queue([H-(Start-[Start]-0)], Goal, RevPath),
    reverse(RevPath, Path).

astar_queue([_-(Goal-Path-_)|_], Goal, Path).

astar_queue([_-(Node-Path-G)|Rest], Goal, Result) :-
    findall(F-(Next-[Next|Path]-G1),
        (edge(Node, Next),
         \+ member(Next, Path),
         G1 is G + 1,
         h(Next, H),
         F is G1 + H),
        New),
    append(Rest, New, Queue),
    keysort(Queue, Sorted),
    astar_queue(Sorted, Goal, Result).
