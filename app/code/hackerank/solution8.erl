% Problem: Update List

-module(solution8).
-export([main/0]).

main() ->
    InputArray = input([]),
    lists:foreach(
        fun(Elem) -> 
            io:format("~w~n",[abs(Elem)]) 
        end, 
    InputArray),
    main_end.

input(InputArray) ->
    case io:get_line("") of
        Done when Done == eof; Done == "\n" ->
            lists:reverse(InputArray); %return o array
        Line ->
            {Value, _} = string:to_integer(string:strip(Line, right, $\n)),
            input([Value|InputArray]) %concat list
    end.      
