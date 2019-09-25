% Problem: Evaluating e^x

-module(solution9).
-export([main/0]).

main() ->
    string:to_integer(string:strip(io:get_line(""), right, $\n)),

    InputArray = input([]),
    lists:foreach(
        fun(Elem) -> 
            io:format("~.4f~n",[evalute(Elem)]) 
        end, 
    InputArray),

    main_end.

input(InputArray) ->
    case io:get_line("") of
        Done when Done == eof; Done == "\n" ->
            lists:reverse(InputArray); %return o array
        Line ->
            {Value, _} = string:to_float(string:strip(Line, right, $\n)),
            input([Value|InputArray]) %concat list
    end.      

evalute(Value) -> evalute(Value, 9, 0).
evalute(Value, Count, Sum) when Count > 0 -> evalute(Value, Count - 1, Sum + math:pow(Value, Count) / factorial(Count));
evalute(Value, 0, Sum) -> 1 + Sum.

factorial(Value) -> factorial(Value, 1).
factorial(Value, Acc) when Value > 1 -> factorial(Value - 1, Value * Acc);
factorial(Value, Acc) -> Acc.
