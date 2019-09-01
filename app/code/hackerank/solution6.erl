% Problem: Reverse a List

-module(solution6).
-export([main/0]).

main() ->
    input([]).

input(InputArray) ->
    % processa toda linha que vem do IO
    case io:get_line("") of
        Done when Done == eof; Done == "\n" ->
            %percorre os elementos da lista e imprime
            lists:foreach(fun(Elem) ->
                            io:fwrite("~w\n",[Elem])
                          end, InputArray),
            done;
        Line ->
            {Value, _} = string:to_integer(string:strip(Line, right, $\n)),
            input([Value] ++ InputArray) %insere sempre na frente da lista
    end.      