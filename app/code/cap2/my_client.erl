-module(my_client).

% a missao desse cliente eh abstrair as interções de mensagem com servidor trabalhando em nivel mais alto.
% apenas compile esse modulo e chame os metodos conforme desejar...
-export([ls/1, get_file/2]).

%variavel que recebe o pid do servidor
ls(Server) ->
    %envia o comando com pid do cliente e o comando remoto para servidor
    Server ! {self(), list_dir},
    receive
        %mostra o conteudo da lista de arquivos
        {Server, FileList} ->
            FileList
    end.

get_file(Server, File) ->
    Server ! {self(), {get_file, File}},
    receive
        {Server, Content} ->
            Content
    end.