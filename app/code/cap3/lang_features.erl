% training with langague features
-module(lang_features).
-export([main/0]).

main() -> 
    func6().

%func1 eh uma funcao interna vista apenas dentro desse modulo
func1() ->
    X = 40, %eh obrigatorio usar virgula para cada linha, por ser uma ling funcional
    Y = 50, %variavel depois de atribuida não pode ser re-atribuida, ou seja, as variaveis são 'final'
    Result = (X * Y) + 19,
    io:fwrite("~w\n",[Result]),
    io:fwrite("X cubic: ~w\n",[X * X * X]).

func2() ->
    X = 3 + 5, % o scopo das variaveis eh apenas dentro da função que ela está do lado de fora não consigo ver dentro da func
    Y = 4,
    io:fwrite("~w\n",[X]),
    % isso aqui eh permitido porque atribuicao aqui no Erlang é uma avalicao de regex usando '=' 
    % e como o valor nao mudou com relacao essa expressao (continua 8) então essa atribuição é permitida
    X = 8, 
    io:fwrite("~w\n",[X]).

func3() ->
    X = 5 / 3, % divisao com a fracao
    Y = 5 div 3, % parte inteira da divisao
    Z = 5 rem 3, % resto da divisao
    io:fwrite("X = ~w\n",[X]),
    io:fwrite("Y = ~w\n",[Y]),
    io:fwrite("Z = ~w\n",[Z]),

    %essas variaveis que começam com 'minusculo' sao 'atom' (constantes) e o valor é o que se escreve nelas
    segunda,
    quarta,
    quinta,
    io:fwrite("atom = ~w\n",[segunda]),
    io:fwrite("atom = ~w\n",[quinta]).

func4() ->
    % por convenção usamos um atom (no caso 'stock') no inicio de uma tupla apenas para melhorar identificar do que se trata essa tupla
    T = {stock, "PETR3", 1000, 26.66},
    io:fwrite("Tupla = ~w\n",[T]),

    % também pode haver encadiamento de tuplas
    Person = {person, {name, "Phil"}, {age, 66}, {eyecolour, black}},
    io:fwrite("Tupla Encad = ~w\n",[Person]),

    % extraindo valores de uma tupla
    % OBS: o type dessa tupla tem que ser igual para poder dá match durante o processo de atribuição
    {stock, Ticket, Quant, Price} = T,
    io:fwrite("Ticket = ~w\n",[Ticket]),
    io:fwrite("Quant = ~w\n",[Quant]),
    io:fwrite("Price = ~w\n",[Price]),

    % outra forma de extrair dados
    {_,_,{_,Age},_} = Person,
    io:fwrite("Person Age = ~w\n",[Age]).

func5() ->
    %se define listas dessa forma, ela pode ser de elementos simples ou de tuplas
    Drawing = [{square,{10,10},10}, {triangle,{15,10},{25,10},{30,40}}],
    ArbitaryElems = [1-7, philokura, {stock, "PETR3", 26.66}, 666],
    
    io:fwrite("Drawing = ~w\n",[Drawing]),
    io:fwrite("ArbitaryElems = ~w\n",[ArbitaryElems]),

    Portf1 = [{petr3, 1000}, {vale3, 2000}],
    PortfTotal = [{ugpa3, 500}, {itub3, 3000}|Portf1], % uma forma de contatenar duas listas
    io:fwrite("PortfTotal = ~w\n",[PortfTotal]),

    %obtem o primeiro item da lista e o resto da lista sem o primeiro item da lista
    [Head|RemainElements] = PortfTotal,
    io:fwrite("Mostra o head da lista = ~w\n",[Head]),
    io:fwrite("Mostra o resto sem o head da lista = ~w\n",[RemainElements]),

    % retira os dois primeiros elementos da lista e mantem o resto na variavel 'RemainElem'
    [Stock1,Stock2|RemainElem] = RemainElements,
    io:fwrite("Stock 1 = ~w\n",[Stock1]),
    io:fwrite("Stock 2 = ~w\n",[Stock2]).

% apos o termino desse modulo, vá para os arquivos: X,Y e Z, onde tem exercicios do hackerank feito em erlang