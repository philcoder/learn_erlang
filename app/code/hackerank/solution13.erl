% Problem: Computing the GCD

-module(solution13).
-export([main/0]).

main() ->
    {X, Y} = list_to_tuple(string:tokens(string:strip(io:get_line(""), right, $\n), " ")),
    {ValueX, _} = string:to_integer(X),
    {ValueY, _} = string:to_integer(Y),
    io:fwrite("~w\n",[greatCommonDivisor(ValueX, ValueY)]),
    main_end.

greatCommonDivisor(X, Y) ->
    K = max(X, Y),
    M = min(X, Y),
    loopInvariant(K, M).

loopInvariant(K, M) when M =/= 0 -> 
    Remainder = K rem M,
    loopInvariant(M, Remainder);
loopInvariant(K, 0) -> K.

max(X, Y) when X > Y -> X;
max(X, Y) -> Y.
min(X, Y) when X < Y -> X;
min(X, Y) -> Y.