%%% -*- Mode: Prolog -*-
%
% operators.pl
%
% Arithmetic Operators in Prolog
%

% X =:= Y  Equal
% X =\= Y  Not Equal
% X < Y    Less than
% X > Y    Grather than
% X =< Y   Less than or equal
% X >= Y   Greather than or equal
%
% X + Y    Sum
% X - Y    Difference
% X * Y    Product
% X / Y    Quotient
% X // Y   Integer Quotient
% X mod Y  Reminder
%

% person/2 name and age
person(john, 23).
person(mary, 15).
person(foo, 18).

square(X, R) :-
    R is X * X.

triangle_area(X, H, R) :-
    R is X * H / 2.


adult(X) :-
    person(X, Y),
    Y >= 18.

is_even(X) :-
    number(X),
    X mod 2 =:= 0.

is_odd(X) :-
    number(X),
    X mod 2 =\= 0.

% operators.pl ends here.
