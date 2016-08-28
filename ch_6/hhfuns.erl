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

max([H|T]) -> max2(T, H).

%% Need to call it max2 because max/2 is an auto-imported BIF.
max2([], Max) -> Max;
max2([H|T], Max) when H > Max -> max2(T, H);
max2([_|T], Max) -> max2(T, Max).

min([H|T]) -> min2(T, H).

%% Need to call it min2 because min/2 is an auto-imported BIF.
min2([], Min) -> Min;
min2([H|T], Min) when H < Min -> min2(T, H);
min2([_|T], Min) -> min2(T, Min).

sum(L) -> sum(L, 0).

sum([], Sum) -> Sum;
sum([H|T], Sum) -> sum(T, Sum + H).

fold([], Start, _) -> Start;
fold([H|T], Start, Fun) -> fold(T, Fun(H, Start), Fun).

reverse(L) ->
  fold(L, [], fun(X,Acc) -> [X|Acc] end).

map2(L, F) ->
  reverse(fold(L, [], fun(X,Acc) -> [F(X)|Acc] end)).

filter2(L, Pred) ->
  F = fun(X,Acc) ->
          case Pred(X) of
            true  -> [X|Acc];
            false -> Acc
          end
      end,
  reverse(fold(L, [], F)).
