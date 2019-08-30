-module(shop).
-export([total/1,cost/1]).

cost(oranges) -> 5;
cost(newspaper) -> 10;
cost(apples) -> 3;
cost(pears) -> 9;
cost(milk) -> 7.

%head da lista | tail (o resto dos elementos)
total([{What, N}|T]) -> (cost(What) * N) + total(T);
total([]) -> 0. %quando for vazio retorna 0 (condição de parada da recursão)