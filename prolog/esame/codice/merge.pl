%%% -*. Mode: Prolog -*-
%
% merge/3
% This predicate merge two ordered lists

merge([], Ys, Ys) :- !.
merge(Xs, [], Xs) :- !.

merge([X | Xs], [Y | Ys], [X | Zs]) :-
    X < Y,
    !,
    merge(Xs, [Y | Ys], Zs).

merge([X | Xs], [Y | Ys], [X, Y | Zs]) :-
    X = Y,
    !,
    merge(Xs, Ys, Zs).

merge([X | Xs], [Y | Ys], [Y | Zs]) :-
    X > Y,
    !,
    merge([X | Xs], Ys, Zs).

% minimum/3
%
minimum(X, Y, X) :- X =< Y, !.
minimum(X, Y, Y) :- Y < X, !.
