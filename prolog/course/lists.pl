%%% -*- Mode: Prolog -*-
%
% lists.pl
%
% Lists in Prolog
%
%
% [] empty list
% [1, 2, 3]
%             Head  Tail
% [X | Y] ->  X = 1 Y = [2, 3]
%

% The Membership Problem
%
% member/2
% This preticare returns true if the first argument is a member of the
% list (second argument).

member(X, [X | _]).
member(X, [_ | T]) :-
    member(X, T).

% The Length Problem
%
% len/2
% This predicate returns true if the second argument is the length of
% the list (first argument).

len([], 0).
len([_ | Y], N) :-
    len(Y, N1),
    number(N1),
    N is N1 + 1.

% The Sum Problem
%
% sum/2
% This predicate returns true if the second argument is the sum of the
% list (first argument).

sum([], 0).
sum([X | Y], S) :-
    sum(Y, S1),
    number(X),
    number(S1),
    S is S1 + X.

% The Sorted list Problem
%
% sorted_asc/1
% This predicate returns true if the list is sorted in ASC order

sorted_asc([]).  % empty
sorted_asc([_]). % one element
sorted_asc([X, Y | Z]) :-
    X =< Y,
    sorted_asc([Y | Z]).

% sorted_desc/1
% This predicate returns true if the list is sorted in DESC order

sorted_desc([]).
sorted_desc([_]).
sorted_desc([X, Y | Z]) :-
    Y =< X,
    sorted_desc([Y | Z]).

% The Concatenation Problem
%
% concat/3
% This predicate returns true if the third argument (a list) is the
% concatenation of the first and the second argument.
% [a,b] [b,c] abbc
concat([], L, L).
concat([H | T], L, [H | Z]) :-
    concat(T, L, Z).


% lists.pl ends here.
