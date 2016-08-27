-module(recursive).
-export([fac/1, tail_fac/1, len/1, tail_len/1, duplicate/2, tail_duplicate/2]).

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
