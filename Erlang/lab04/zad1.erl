% Mateusz Ziomek
% 5.11.2018

-module(zad1).
-import(math,[pi/0]).
-export([pole/1, objetosc/1, len/1, amin/1, amax/1, tmin_max/1,
    lmin_max/1, fields/1, desclist/1, temp_conv/2, list_gen/1, list_gen/2]).


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

% Function init go to support function
len(L) -> len(L, 0).
% Support function len
len([_|T],L) -> len(T, L+1);
len([],L) -> L.

% Find min
amin([H|T]) -> amin(T, H);
amin([]) -> 666.

amin([H|T], E) ->
    if H < E ->
            amin(T,H);
        true ->
            amin(T,E)
    end;
amin([], E) -> E.

% Find max
amax([H|T]) -> amax(T, H);
amax([]) -> -666.

amax([H|T], E) ->
    if H > E ->
            amax(T,H);
        true ->
            amax(T,E)
    end;
amax([], E) -> E.

% Find min and max
tmin_max([H|T]) -> tmin_max(T, {H,H});
tmin_max([]) -> {-666,666}.

tmin_max([H|T], {S,B}) ->
    if H > B ->
            tmin_max(T,{S,H});
        H < S ->
            tmin_max(T,{H,B});
        true ->
            tmin_max(T,{S,B})
    end;
tmin_max([], E) -> E.

% Find min and max list
lmin_max([H|T]) -> lmin_max(T, [H,H]);
lmin_max([]) -> [-666,666].

lmin_max([H|T], [S,B]) ->
    if H > B ->
        lmin_max(T,[S,H]);
    H < S ->
        lmin_max(T,[H,B]);
    true ->
        lmin_max(T,[S,B])
    end;
lmin_max([], E) -> E.

% Fields of all the figures from the list
fields(L) -> fields(L,[]).

fields([H|T], L) -> fields(T, [pole(H)|L]);
fields([], L) -> L.

% Descending list
desclist(N) ->
    if N > 0 ->
            desclist(N,[1]);
        true ->
            []
    end.

desclist(N, [H|T]) ->
    if N > H ->
        desclist(N, [H+1|[H|T]]);
    true ->
        [H|T]
    end.

% Temperature converter
temp_conv({c, T}, D) ->
    if D == k ->
        {k, T + 273.15};
    D == f ->
        {f, (9/5 * T) + 32};
    true ->
        {c, T}
    end;
temp_conv({k, T}, D) ->
    if D == c ->
        {c, T - 273.15};
    D == f ->
        temp_conv({c, T - 273.15}, f);
    true ->
        {k, T}
    end;
temp_conv({f, T}, D) ->
    if D == k ->
        temp_conv({c, 5/9 * (T - 32)}, k);
    D == c ->
        {c, 5/9 * (T - 32)};
    true ->
        {f, T}
    end.

% List generator
list_gen(N) ->
    if N > 0 ->
        list_gen(N, 1, []);
    true ->
        []
    end.
list_gen(N, V) ->
    if N > 0 ->
        list_gen(N, V, []);
    true ->
        []
    end.
list_gen(0,_,L) -> L;
list_gen(N,V,L) -> list_gen(N-1,V,[V|L]).
