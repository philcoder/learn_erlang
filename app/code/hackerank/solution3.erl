% Problem: Filter Array

-module(solution3).
-export([main/0]).

main() ->
    {ok, [Delimiter]} = io:fread("", "~d"),
    filterArray(Delimiter).

filterArray(Delimiter) ->
    % processa toda linha que vem do IO
    case io:get_line("") of
        Done when Done == eof; Done == "\n" ->
            done;
        Line ->
            {Value, _} = string:to_integer(string:strip(Line, right, $\n)), %get line value
            printData(Delimiter, Value),
            filterArray(Delimiter)
    end.
            
printData(Delimiter, Value) ->
    if
        Value < Delimiter ->
            io:fwrite("~w\n",[Value]);
        true -> 
            done
    end.          