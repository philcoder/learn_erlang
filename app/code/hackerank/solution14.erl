% Problem: Compute the Perimeter of a Polygon

-module(solution14).
-export([main/0]).

main() ->
    {Value, _} = string:to_integer(string:strip(io:get_line(""), right, $\n)),
    PointList = inputPoint(Value, []),

    %append head on the list for make a virtual circular list
    [H|T] = PointList,
    [Head|Tail] = appendList(PointList, H),

    Result = calculePolygonPerimeter(Head, Tail, 0),
    io:format("~w~n",[Result]),
    main_end.

inputPoint(Num, PointList) when Num > 0 ->
    {X, Y} = list_to_tuple(string:tokens(string:strip(io:get_line(""), right, $\n), " ")),
    inputPoint(Num - 1, [{X, Y} | PointList]);
inputPoint(0, PointList) -> PointList.

appendList(List, Elem) -> appendList(List, [], Elem).
appendList([H|T], ResultList, Elem) -> appendList(T, [H|ResultList], Elem);
appendList([], ResultList, Elem) -> lists:reverse([Elem|ResultList]).

calculePolygonPerimeter(HeadElem, [H | T], Acc) -> calculePolygonPerimeter(H, T, Acc + calculeDistance(HeadElem, H));
calculePolygonPerimeter(HeadElem, [], Acc) -> Acc.

calculeDistance({Px, Py}, {Zx, Zy}) ->
    {PointX1, _} = string:to_integer(Px),
    {PointY1, _} = string:to_integer(Py),
    {PointX2, _} = string:to_integer(Zx),
    {PointY2, _} = string:to_integer(Zy),

    math:sqrt(math:pow(PointX1 - PointX2, 2) + math:pow(PointY1 - PointY2, 2)).