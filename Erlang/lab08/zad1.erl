% Rejurhf
% 2.12.2018

-module(zad1).
-export([start/0,posrednik/0,producent/0,konsument/0]).

producent() ->
  receive
    {create,Posr} ->
      io:format("Zaczynam produkcje ~n"),
      Posr ! {random, self(), rand:uniform(100)},
      producent();
    {ok} ->
      io:format("Konsument odebral produkt ~n");
    {stop} ->
      io:format("Producent konczy prace ~n");
    _ ->
      io:format("Nieznany komunikat ~n")
  end.

posrednik() ->
  receive
    {random,Od,Num} ->
      Konsument = spawn(zad1,konsument,[]),
      io:format("Odbieram produkt od producentai ~p ~n", [Num]),
      Od ! {ok},
      io:format("Przekazuje produkt konsumentowi ~p ~n", [Num]),
      Konsument ! {random,self(),Num},
      posrednik();
    {ok} ->
      io:format("Konsument otrzymal produkt ~n"),
      posrednik();
    {stop} ->
      io:format("Pośrednik kończy prace ~n");
    _ ->
      io:format("Nieznany komunikat ~n")
  end.

konsument() ->
  receive
    {random,Od,Num} ->
      io:format("Konsumuje produkt ~p ~n", [Num]),
      Od ! {ok}
  end.

start() ->
  PID1 = spawn(zad1,producent,[]),
  PID2 = spawn(zad1,posrednik,[]),
  PID1 ! {create,PID2},
  PID1 ! {create,PID2},
  PID1 ! {create,PID2},
  PID1 ! {create,PID2}.
