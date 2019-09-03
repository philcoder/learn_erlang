% Problem: Sum of Odd Elements

-module(solution7).
-export([main/0]).

main() ->
    InputArray = input([]),
    
    Result = lists:sum(lists:filter(fun(Elem) -> Elem rem 2 /= 0 end, InputArray)),
    io:fwrite("~w\n",[Result]),
    main_end.

input(InputArray) ->
    case io:get_line("") of
        Done when Done == eof; Done == "\n" ->
            InputArray; %return o array
        Line ->
            {Value, _} = string:to_integer(string:strip(Line, right, $\n)),
            input(InputArray ++ [Value]) %concat o valeu na lista
    end.      

