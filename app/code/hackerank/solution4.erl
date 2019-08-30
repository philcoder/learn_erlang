% Problem: Filter Positions in a List

-module(solution4).
-export([main/0]).

main() ->
    filterArray(1).

filterArray(Count) ->
    % processa toda linha que vem do IO
    case io:get_line("") of
        Done when Done == eof; Done == "\n" ->
            done;
        Line ->
            {Value, _} = string:to_integer(string:strip(Line, right, $\n)), %get line value
            printData(Count, Value),
            filterArray(Count + 1)
    end.
            
printData(Count, Value) ->
    if
        (Count rem 2) =:= 0 ->
            io:fwrite("~w\n",[Value]);
        true -> 
            done
    end.          