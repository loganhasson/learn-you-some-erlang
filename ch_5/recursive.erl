-module(recursive).
-export([fac/1, tail_fac/1, len/1, tail_len/1]).

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
