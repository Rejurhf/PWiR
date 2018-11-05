-module(zad1).
-import(math,[pi/0]).
-export([pole/1, objetosc/1, len/1]).

pole({kwadrat,X,Y}) ->  X*Y;
pole({trojkat,A,H}) ->  A*H/2;
pole({trapez,A,B,H}) ->  (A+B)*H/2;
pole({kolo,X}) -> X*X*pi();
pole({kula,R}) -> 4*R*R*pi();
pole({szescian,A}) ->  6*A*A;
pole({stozek,R,L}) ->  (R+L)*R*pi().

objetosc({kula,R}) -> 4/3*R*R*R*pi();
objetosc({szescian,A}) ->  A*A*A;
objetosc({stozek,R,H}) ->  1/3*R*H*pi().

% function init go to support function
len(L) -> len(L, 0).
% support function len
len([_|T],L) -> len(T, L+1);
len([],L) -> L.
