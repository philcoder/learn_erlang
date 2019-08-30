-module(geometry).
-export([area/1]).

%OBS: o retorno do valor está implicito sem a necessidade de uma keyword 'return' é o valor da ultima expressão no corpo da função
area({rectangle, Width, Height}) -> 
    Width * Height;

%OBS: sobrecarga de metodo é permitida pois a assinatura representa tuplas diferentes.
area({square, Side}) -> 
    Side * Side;

%uma função com calculo jah existente chamando outra...
area({circle, Radius}) -> 
    3.14159 * area({square, Radius}).