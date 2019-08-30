% training with langague features
-module(lang_features).

% importando de outro aquivo como qualquer modulo...
-import(geometry,[area/1]).
-import(shop,[cost/1,total/1]).

-export([main/0]).

main() -> 
    func4().

func1() ->
    ResultSquare = area({square, 9}),
    io:fwrite("~w\n",[ResultSquare]),
    ResultRectangle = area({rectangle, 6, 10}),
    io:fwrite("~w\n",[ResultRectangle]),

    io:fwrite("~w\n",[test1()]).

% dá para fazer teste simples de funcionamento das funções, sem precisar instalar ferramentas adicionais para isso...
test1() ->
    36 = area({square, 6}),
    110 = area({rectangle, 10,11}),
    78.53975 = area({circle, 5}),
    test1_done.

func2() ->
    Cost = cost(newspaper),
    io:fwrite("~w\n",[Cost]),
    ShopCost = total([{apples,5},{milk,5}]),
    io:fwrite("~w\n",[ShopCost]).

func3() ->
    %essa keyword 'fun' cria funções anonimas para variaveis, veja exemplo abaixo
    %convert C to F e vice-versa
    TempConvert = fun({c,C}) -> {f, 32 + C*9/5};
                     ({f,F}) -> {c, (F-32)*5/9}
                  end,
    io:fwrite("~w\n",[TempConvert({c,100})]),
    io:fwrite("~w\n",[TempConvert({c,10})]),
    {c, Temp} = TempConvert({f,212}),
    io:fwrite("~w C\n",[Temp]).

func4() ->
    Elems = [1,2,3,4,5],

    Res = lists:map(fun(X) -> 3*X end, Elems),
    io:fwrite("~w\n",[Res]),

    Even = fun(E) -> (E rem 2) =:= 0 end, %func anonima para detectar elementos pares
    
    %vai mapear em toda a lista quais os elementos sao verdadeiros
    io:fwrite("~w\n",[lists:map(Even, Elems)]),
    %returna apenas os elementos verdadeiros
    io:fwrite("~w\n",[lists:filter(Even, Elems)]),

    %func anonima com outra func anonima mais interna, relacionado com cada elemento que vai fazer avaliação
    Contains = fun(List) -> (fun(Elem) -> lists:member(Elem, List) end) end,
    %você passa a lista para função anomia mais externa
    IsElem = Contains(Elems),
    io:fwrite("~w\n",[IsElem(5)]), %consulta se um elemento pertence a lista
    io:fwrite("~w\n",[IsElem(6)]),
    io:fwrite("~w\n",[lists:filter(IsElem, [10,4,8,5,6,11])]),

    GenLists = for(1, 10, fun(E) -> E end),
    io:fwrite("~w\n",[GenLists]),

    for(1, 5, fun(E) -> io:fwrite("hello world loop\n") end),

    fend.

%exemplo de loop 'for' em erlang
for(Max, Max, F) -> [F(Max)]; %quando Init == Max ai para a recursão
for(Init, Max, F) -> [F(Init)|for(Init+1, Max, F)].