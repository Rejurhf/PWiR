-module(zad1).
-export([pole/1]).

pole({kwadrat,X,Y}) ->  X*Y;
pole({kolo,X}) -> 3.14*X*X.
