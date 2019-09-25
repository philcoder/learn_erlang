% Problem: Area Under Curves and Volume of Revolving a Curve

-module(solution10).
-export([main/0]).

main() ->
    ListA = string:tokens(string:strip(io:get_line(""), right, $\n), " "),
    ListB = string:tokens(string:strip(io:get_line(""), right, $\n), " "),
    {LimitL, LimitR} = list_to_tuple(string:tokens(string:strip(io:get_line(""), right, $\n), " ")),

    {ValueLimitL, _} = string:to_integer(LimitL),
    {ValueLimitR, _} = string:to_integer(LimitR),
    AreaResult = summationIntegral(ListA, ListB, ValueLimitL, ValueLimitR, fun computeAreaPoint/1),
    VolumeResult = summationIntegral(ListA, ListB, ValueLimitL, ValueLimitR, fun computeVolumePoint/1),

    io:format("~.1f~n",[AreaResult]),
    io:format("~.1f~n",[VolumeResult]),

    main_end.


summationIntegral(ListA, ListB, LimitL, LimitR, ExternalFunc) -> summationIntegral(ListA, ListB, LimitL, 0.001, LimitR, 0, ExternalFunc).
summationIntegral(ListA, ListB, LimitL, Increment, Acc, Sum, ExternalFunc) when Acc > LimitL -> 
    summationIntegral(ListA, ListB, LimitL, Increment, Acc - Increment, Sum + calculeIntegral(ListA, ListB, Acc, ExternalFunc), ExternalFunc);
summationIntegral(_, _, _, _, _, Sum, _) -> 0.001 * Sum.


calculeIntegral(ListA, ListB, Point, ExternalFunc) -> calculeIntegral(ListA, ListB, Point, 0, ExternalFunc).
% LaH = ListA Head, LaT = ListA Tail
calculeIntegral([LaH|LaT], [LbH|LbT], Point, Sum, ExternalFunc) -> 
    calculeIntegral(LaT, LbT, Point, Sum + computePoint(LaH, LbH, Point), ExternalFunc);
calculeIntegral([], [], _, Sum, ExternalFunc) ->  ExternalFunc(Sum).

computePoint(A, B, Point) -> 
    {ValueA, _} = string:to_integer(A),
    {ValueB, _} = string:to_integer(B),
    ValueA * math:pow(Point, ValueB).

computeAreaPoint(Sum) -> Sum.
computeVolumePoint(Sum) -> math:pi() * math:pow(Sum, 2).