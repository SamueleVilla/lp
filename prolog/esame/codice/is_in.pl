%%% -*- Mode: Prolog -*-
%
%
%

member(X, [X | _]).
member(X, [_ | Xs]) :-
    member(X, Xs).

common([], L, []).
common([X | Xs], L, [X | Ys]) :-
     common(Xs, L, Ys),
     member(X, L).
