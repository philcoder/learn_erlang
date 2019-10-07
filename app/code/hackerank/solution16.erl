% Problem: Compute the Area of a Polygon

-module(solution16).
-export([main/0]).

main() ->
    {Value, _} = string:to_integer(string:strip(io:get_line(""), right, $\n)),
    PointList = inputPoint(Value, []),

    %append head on the list for make a virtual circular list
    [H|T] = PointList,
    [Head|Tail] = appendList(PointList, H),

    Result = calculePolygonArea(Head, Tail, 0, 0),
    io:format("~w~n",[Result]),
    main_end.

inputPoint(Num, PointList) when Num > 0 ->
    {X, Y} = list_to_tuple(string:tokens(string:strip(io:get_line(""), right, $\n), " ")),
    inputPoint(Num - 1, [{X, Y} | PointList]);
inputPoint(0, PointList) -> PointList.

appendList(List, Elem) -> appendList(List, [], Elem).
appendList([H|T], ResultList, Elem) -> appendList(T, [H|ResultList], Elem);
appendList([], ResultList, Elem) -> lists:reverse([Elem|ResultList]).

calculePolygonArea(HeadElem, [H | T], AccX, AccY) -> calculePolygonArea(H, T, AccX + calculePyMulPx(HeadElem, H), AccY + calculePxMulPy(HeadElem, H));
calculePolygonArea(HeadElem, [], AccX, AccY) -> (AccX - AccY) / 2.

calculePxMulPy({Px, Py}, {Zx, Zy}) ->
    {PointX1, _} = string:to_integer(Px),
    {PointY2, _} = string:to_integer(Zy),
    PointX1 * PointY2.

calculePyMulPx({Px, Py}, {Zx, Zy}) ->
    {PointY1, _} = string:to_integer(Py),
    {PointX2, _} = string:to_integer(Zx),
    PointY1 * PointX2.