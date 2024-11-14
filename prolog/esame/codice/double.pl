%%% -*- Mode: Prolog -*-
%
%
% double/2

double([X], [X, X]).
double([X | Xs], [X, X | Ys]) :- double(Xs, Ys).


mult2([], []).
mult2([X | Xs], [X2 | Ys]) :-
    mult2(Xs, Ys),
    X2 is X * 2.

