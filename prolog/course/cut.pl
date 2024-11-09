%%% -*- Mode: Prolog -*-
%
% cut.pl

% example
% output
% X = john, Y = alisha
% X = john Y = mary
% X = harr, Y = alisha
% X = harry Y = mary
boy(john).
boy(harry).
girl(alisha).
girl(mary).

possible_path(X, Y) :-
    boy(X),
    !,
    girl(Y).

% is_integer/1
%
is_integer(0).
is_integer(X) :- is_integer(Y),  X is Y + 1.


% cut.pl ends here.
