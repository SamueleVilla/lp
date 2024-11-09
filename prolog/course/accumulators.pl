%%% -*- Mode: Prolog -*-
%
% accumulators.pl
%
% Accumulators in Prolog
%
% Accumulators store accumulate result
%

% Length of the list without accumulators

listlen([], 0).
listlen([_ | T], N) :-
    listlen(T, N1),
    N is N1 + 1.

% Length of the list with accumulators

listlen1(L, N) :- listacc(L, 0, N).
listacc([], A, A).
listacc([_|T], A, N) :- A1 is A+1, listacc(T, A1, N).


% accumulators.pl ends here.
