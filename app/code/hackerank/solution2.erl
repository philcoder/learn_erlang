% Problem: List Replication

-module(solution2).
-export([main/0]).

main() ->
    {ok, [Rep]} = io:fread("", "~d"),
    % io:fwrite("~w\n",[Rep]).
    replicationList(Rep).

replicationList(Repetion) ->
    case io:get_line("") of
        Done when Done == eof; Done == "\n" ->
            done; %usa um atomic para parar a recursao
        Line ->
            {Val, _} = string:to_integer(string:strip(Line, right, $\n)), %get line value
            printData(Repetion, Val),
            replicationList(Repetion)
    end.
            
printData(Times, Value) ->
    if
        Times /= 0 ->
            io:fwrite("~w\n",[Value]),
            printData(Times - 1, Value);
        true -> 
            done
    end.          