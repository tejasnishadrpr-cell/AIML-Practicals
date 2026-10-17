% Graph connections
edge(a, b).
edge(a, c).
edge(b, d).
edge(c, d).
edge(d, e).

% BFS
bfs(Start, Goal, Path) :-
    bfs_queue([[Start]], Goal, RevPath),
    reverse(RevPath, Path).

bfs_queue([[Goal|T]|_], Goal, [Goal|T]).

bfs_queue([[Current|Path]|Rest], Goal, Result) :-
    findall([Next,Current|Path],
            (edge(Current, Next),
             \+ member(Next, [Current|Path])),
            NewPaths),
    append(Rest, NewPaths, Queue),
    bfs_queue(Queue, Goal, Result).
