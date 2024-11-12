
%%%%% -*- Mode: Prolog -*-

% listarelle.pl

% isin/2
% this predicate is true when the first argument can be found in the
% second ine, which must be a list (representing a "set").

isin(Element, [Element|_]). % caso base: l'elemento è in testa alla lista
isin(Element, _|Tail) :- isin(Element, Tail). % caso ricorsivo: controlla la coda della lista

% concat/3
% this predicate is true when the third argument is the concatenation of
% the first and the second argument.
concat([], L, L).
concat([X | Xs], L, [X | Zs]) :-
       concat(Xs, L, Zs).

% lref/3
% True when the third argument is the element in position N (the
% second argument) of the first argument (a list).

lref([X | _], 1, X).
lref([_ | Xs], N, E) :-
    N > 1,
    N1 is N - 1,
    lref(Xs, N1, E).


% listarelle.pl ends here.

