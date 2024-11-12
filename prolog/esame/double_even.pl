%%% -*- Mode: Prolog -*-
%
%
% double_even/2
%

double_even([], []).

double_even([X | Xs], [N1 | Ys]) :-
   0 is X mod 2,
   N1 is X * 2,
   double_even(Xs, Ys).

double_even([X | Xs], [X | Ys]) :-
   1 is X mod 2,
   double_even(Xs, Ys).

