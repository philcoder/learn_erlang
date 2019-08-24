% Problem: Hello World N Times

-module(solution1).
-export([main/0]).

main() ->
    % {N, _} = string:to_integer(string:chomp(io:get_line(""))),
    N = 5,
    printhello(N - 1).

printhello(Times) ->
    if
        Times /= 0 ->
            io:fwrite("Hello World\n"),
            printhello(Times - 1); %é obrigatorio ter esse ';' na ultima linha do primeiro bloco do 'if'
        true -> %no caso do if é obrigatorio ter os dois blocos e esse bloco aqui é quando o de cima der falso esse aqui está disponivel com true.
            io:fwrite("Hello World\n")
    end.