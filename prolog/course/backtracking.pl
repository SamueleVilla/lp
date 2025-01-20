%%% -*- Mode: Prolog -*-
%
% backtracking.pl

boy(john).
boy(harry).
girl(alisha).
girl(mary).

possible_path(X, Y) :-
    boy(X),
    girl(Y).

% backtracking.pl ends here.
