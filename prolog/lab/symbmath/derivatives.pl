%%%% -*- Mode: Prolog -*-

% derivatives.pl

% der/3
% True when the derivative of the first argument (an expression)
% respect the second argument (an expression) is the third argument (an
% expression)

der(X, X, 1) :- !.

der(e^X, X, e^X) :- !.

der(ln(X), X, 1/X) :- !.
der(lg(X), X, 1/X) :- !.

der(sin(X), X, cos(X)) :- !.
der(cos(X), X, -sin(X)) :- !.

der(FGX, X, DGX * DFGX) :-
    FGX =.. [_, GX],
    !,
    der(GX, X, DGX),
    der(FGX, GX, DFGX).

% derivatives.pl ends here.

