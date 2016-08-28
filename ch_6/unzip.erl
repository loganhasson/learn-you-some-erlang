-module(unzip).
-export([unzip/1]).

%%This is like a zillion iterations/reversals too many, but finally.
acc_from_list([H|_]) ->
  [[] || _ <- tuple_to_list(H)].

unzip(List) when is_list(List) -> unzip(List, acc_from_list(List)).

unzip([], Acc) -> Acc;
unzip([Tuple|Rest], Acc) when is_tuple(Tuple) ->
  unzip(Rest, combine(tuple_to_list(Tuple), Acc)).

combine(X, Y) -> lists:reverse(combine(X, Y, [])).

combine([], [], Acc) -> Acc;
combine([X|Xs], [Y|Ys], Acc) -> combine(Xs, Ys, [lists:reverse([X|Y])|Acc]).
