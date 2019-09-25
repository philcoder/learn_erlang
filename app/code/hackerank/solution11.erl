% Problem: Functions or Not

-module(solution11).
-export([main/0]).

main() ->
    {Value, _} = string:to_integer(string:strip(io:get_line(""), right, $\n)),
    inputTestCase(Value),
    main_end.

inputTestCase(Num) when Num > 0 ->
    {Value, _} = string:to_integer(string:strip(io:get_line(""), right, $\n)),
    PairList = inputPair(Value, []),
    analysePair(PairList, []),
    inputTestCase(Num - 1);

inputTestCase(0) -> fend.

inputPair(Num, PairList) when Num > 0 ->
    {X, Y} = list_to_tuple(string:tokens(string:strip(io:get_line(""), right, $\n), " ")),
    inputPair(Num - 1, [{X, Y} | PairList]);

inputPair(0, PairList) -> PairList.

analysePair([H | T], ListX) ->
    %element(1,H) get first elem from tuple {X, Y}
    Result = lists:member(element(1, H), ListX),
    if
        %find X on list
        Result ->
            io:fwrite("NO\n");
        true -> 
            analysePair(T, [element(1, H) | ListX])
    end;

analysePair([], _) -> 
    io:fwrite("YES\n"),
    fend.