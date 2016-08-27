-module(recursive).
-export([fac/1, tail_fac/1, len/1, tail_len/1, duplicate/2,
         tail_duplicate/2, reverse/1, tail_reverse/1, sublist/2,
         tail_sublist/2]).

fac(1) -> 1;
fac(N) -> N*fac(N-1).

tail_fac(N) -> tail_fac(N, 1).
tail_fac(1, Tot) -> Tot;
tail_fac(N, Tot) -> tail_fac(N-1, N*Tot).

len([]) -> 0;
len([_|T]) -> 1 + len(T).

tail_len(L) -> tail_len(L, 0).

tail_len([], Len) -> Len;
tail_len([_|T], Len) -> tail_len(T, Len + 1).

duplicate(0, _) -> [];
duplicate(N, Term) when N > 0 ->
  [Term|duplicate(N-1, Term)].

tail_duplicate(N, Term) -> tail_duplicate(N, Term, []).

tail_duplicate(0, _, Acc) -> Acc;
tail_duplicate(N, Term, Acc) when N > 0 ->
  tail_duplicate(N-1, Term, [Term|Acc]).

reverse([]) -> [];
reverse([H|T]) -> reverse(T)++[H].

tail_reverse(L) -> tail_reverse(L, []).

tail_reverse([], Acc) -> Acc;
tail_reverse([H|T], Acc) -> tail_reverse(T, [H|Acc]).

sublist(_, 0) -> [];
sublist([], _) -> [];
sublist([H|T], N) -> [H|sublist(T,N-1)].

tail_sublist(L, N) -> tail_reverse(tail_sublist(L, N, [])). % Could use lists:reverse/1 here.

tail_sublist(_, 0, Acc) -> Acc;
tail_sublist([], _, Acc) -> Acc;
tail_sublist([H|T], N, Acc) -> tail_sublist(T, N-1, [H|Acc]).
