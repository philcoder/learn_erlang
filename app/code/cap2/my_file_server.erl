-module(my_file_server).
-export([main/1, loop/1]).

% um detalhe em erlang uma variavel SEMPRE começa com maiusculo e depois de atribuido um valor a ela, NÃO pode ser mudado...
main(Dir) -> spawn(my_file_server, loop, [Dir]).

%esse é um exemplo de um loop infinito (usando recursão) desenvolvido em erlang
loop(Dir) -> 
    %espera duas mensagens de fora, no caso dos clientes desse server
    %list_dir e get_file
    receive
        %variavel Client tem um pid para quem se devolve uma resposta...
        {Client, list_dir} ->
            %funcao 'self()' é para quando responder uma mensagem passar o pid do servidor para o cliente
            Client ! {self(), file:list_dir(Dir)};
        {Client, {get_file, File}} ->
            Full = filename:join(Dir, File), %variavel Full é imutavel
            Client ! {self(), file:read_file(Full)}
    end,
    loop(Dir). %chama denolvo a função para entrar em espera de comandos.