-module(tree).
-export([empty/0, insert/2, lookup/2, randtree/1]).

empty() -> {node, 'nil'}.
insert(Val, {node, 'nil'}) ->
   {node, {Val, {node, 'nil'}, {node, 'nil'}}};
insert(NewVal, {node, {Val, Smaller, Larger}}) when NewVal < Val ->
   {node, {Val, insert(NewVal, Smaller), Larger}};
insert(NewVal, {node, {Val, Smaller, Larger}}) when NewVal >= Val ->
   {node, {Val, Smaller, insert(NewVal, Larger)}}.

lookup(_, {node, 'nil'}) -> undefined;
lookup(Val, {node, {Val, _, _}}) -> {ok, Val};
lookup(Val, {node, {NodeVal, Smaller, _}}) when Val < NodeVal ->
   lookup(Val, Smaller);
lookup(Val, {node, {_, _, Larger}}) -> lookup(Val, Larger).


randtree(1) -> insert(random:uniform(99), empty());
randtree(N) -> insert(random:uniform(99), randtree(N-1)).
