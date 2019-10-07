% Problem: Pascal's Triangle

-module(solution15).
-export([main/0]).

main() ->
    {Value, _} = string:to_integer(string:strip(io:get_line(""), right, $\n)),
    pascalTriangle(Value, 0, 0),
    main_end.

pascalTriangle(InputValue, RowValue, ColunmValue) ->
    if
        InputValue == RowValue ->
            done; %stop condition for generation triangle
        RowValue == ColunmValue ->
            io:fwrite("~w\n",[elementCalcule(RowValue, ColunmValue)]),
            pascalTriangle(InputValue, RowValue + 1, 0);
        RowValue > ColunmValue ->
            io:fwrite("~w ",[elementCalcule(RowValue, ColunmValue)]),
            pascalTriangle(InputValue, RowValue, ColunmValue + 1);
        true -> 
            done
    end.

%truc = remove point float from number...
elementCalcule(RowValue, ColunmValue) -> trunc(factorial(RowValue) / (factorial(ColunmValue) * factorial(RowValue - ColunmValue))).

factorial(Value) -> factorial(Value, 1).
factorial(Value, Acc) when Value > 1 -> factorial(Value - 1, Value * Acc);
factorial(Value, Acc) -> Acc.