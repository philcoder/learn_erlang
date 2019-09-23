% training with langague features
-module(lang_features).

% importando de outro aquivo como qualquer modulo...
-import(geometry,[area/1]).
-import(shop,[cost/1,total/1]).

-export([main/0]).

main() -> 
    func8().

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

func5() ->
    Elems = [1,2,3,4,5],
    %funcao anonima
    Sum = fun AnnoFuncSum([H|T]) -> H + AnnoFuncSum(T); %onde percorre a list pela recursao
            AnnoFuncSum([]) -> 0  %cond de parada
    end,
    io:fwrite("~w\n",[Sum(Elems)]),

    Map = fun AnnoFuncMap(_, []) -> [];
            AnnoFuncMap(Func, [H|T]) -> [Func(H) | AnnoFuncMap(Func, T)]
    end,
    ResultMap = Map(fun(E) -> E * 3 end, Elems),
    io:fwrite("~w\n",[ResultMap]),

    %uma funcao dentro da outra
    Total = Sum(Map(fun(E) -> E * 5 end, Elems)),
    io:fwrite("~w\n",[Total]),

    fend.

func6() ->
    Elems = [1,2,3,4,5],

    %map usando a lib do erlang
    ResultMap = lists:map(fun(E) -> E * 2 end, Elems),
    io:fwrite("~w\n",[ResultMap]),

    %uma forma de realizar um 'map' de forma mais simples
    %o nome desse processo é 'list comprehensions'
    ResultMapCompact = [E * 3 || E <- Elems],
    io:fwrite("~w\n",[ResultMapCompact]),

    %usando com elementos mais complexos
    BuyList=[{oranges,4},{newspaper,1},{apples,10},{pears,6},{milk,3}],
    ResultComplexElems = [{Name, 3*Quantity} || {Name, Quantity} <- BuyList],
    io:fwrite("~w\n",[ResultComplexElems]),

    PriceElems = [cost(Name) || {Name, Quantity} <- BuyList],
    io:fwrite("~w\n",[PriceElems]),

    Total = lists:sum([cost(Name) * Quantity || {Name, Quantity} <- BuyList]),
    io:fwrite("Total Elements: ~w\n",[Total]),

    %exemplo de filter usando tuplas no caso elem 'a'
    Result = [ X || {a, X} <- [{a,1},{b,2},{c,3},{a,4},hello,"wow"]],
    io:fwrite("Filter Tuples 'a' content: ~w\n",[Result]),

    fend.

func7() ->
    Elems = [23,6,2,-9,27,400,78,-45,61,82,14],

    %exemplo elegante de quicksort
    %essa linha que tem "++ [Pivot] ++" concat o elemento na lista
    
    %esse algoritmo pega o pivot = 23 e seleciona todos os elementos menores que ele e todos os maiores
    %ordena esses elementos e na volta da recursão vai concat todos os elementos em ordem crescente...
    QSort = fun QuickSort([]) -> [];
            QuickSort([Pivot|Tail]) -> QuickSort([X || X <- Tail, X < Pivot])
            ++ [Pivot] ++
            QuickSort([X || X <- Tail, X >= Pivot]) %condição de filtro da 'list comprehensions'
    end,

    Result = QSort(Elems),
    io:fwrite("Original list: ~w\n",[Elems]),
    io:fwrite("Ordered list: ~w\n",[Result]),

    fend.

func8() ->
    %Pythagorean triplets are sets of integers {A,B,C} where A^2 + B^2 = C^2 and where the sum of the sides is less than or equal to N .
    Pythag = fun Pythagorean(Num) ->
        [
            {A ,B, C} ||
            A <- lists:seq(1,Num), %cria uma lista de todos os numeros de 1 até N
            B <- lists:seq(1,Num), 
            C <- lists:seq(1,Num),
            A + B + C =< Num, % condição do filtro
            A*A + B*B =:= C*C % 'e' condição do filtro
        ]
    end,

    io:fwrite("Original list: ~w\n",[Pythag(16)]),

    fend.


%exemplo de loop 'for' em erlang
for(Max, Max, F) -> [F(Max)]; %quando Init == Max ai para a recursão
for(Init, Max, F) -> [F(Init)|for(Init+1, Max, F)].