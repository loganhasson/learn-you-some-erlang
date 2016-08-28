-module(hhfuns).
-compile(export_all).

one() -> 1.
two() -> 2.

add(X,Y) -> X() + Y().

increment([]) -> [];
increment([H|T]) -> [H+1|increment(T)].

decrement([]) -> [];
decrement([H|T]) -> [H-1|decrement(T)].

map(_, []) -> [];
map(F, [H|T]) -> [F(H)|map(F,T)].

incr(X) -> X + 1.
decr(X) -> X - 1.

a() ->
  Secret = "pony",
  fun() -> Secret end.

b(F) ->
  "a/0's password is "++F().

filter(L, Pred) -> lists:reverse(filter(L, Pred, [])).

filter([], _, Acc) -> Acc;
filter([H|T], Pred, Acc) ->
  case Pred(H) of
    true  -> filter(T, Pred, [H|Acc]);
    false -> filter(T, Pred, Acc)
  end.
