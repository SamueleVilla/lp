%%% -*- Mode: Prolog -*-
%
%
% subset/2

isin(X, [X | _]).
isin(X, [_ | Ys]) :- isin(X, Ys).

subset([], L).
subset([X | Xs], L) :- isin(X, L), subset(Xs, L).

