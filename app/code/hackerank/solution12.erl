% Problem: Fibonacci Numbers

-module(solution12).
-export([main/0]).

main() ->
    {Value, _} = string:to_integer(string:strip(io:get_line(""), right, $\n)),
    io:fwrite("~w\n",[fibonacci(Value)]),
    main_end.

fibonacci(Num) -> fibonacci(Num - 1, 0, 1).
fibonacci(Num, A, B) when Num > 0 -> fibonacci(Num - 1, B, A + B);
fibonacci(0, A, _) -> A.