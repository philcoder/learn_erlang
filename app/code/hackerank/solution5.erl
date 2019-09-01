% Problem: Array Of N Elements

-module(solution5).
-export([main/0]).

main() ->
    {ok, [N]} = io:fread("", "~d"),
    
    %funcao anonima
    Result = fun GenArrayNum(Max, Max, InternalList) -> InternalList ++ [Max]; %cond de parada, retorna a lista completa
                GenArrayNum(Count, Max, InternalList) -> GenArrayNum(Count + 1, Max, InternalList ++ [Count]) % intera e concat na lista
    end,

    List = Result(1, N, []), %chama a funcao e atribui o resultado de retorno na variavel
    io:format("~w~n", [List]).