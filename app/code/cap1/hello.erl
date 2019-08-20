% http://erlang.org/faq/getting_started.html
% https://www.tutorialspoint.com/erlang/erlang_basic_syntax.htm
% https://www.thegeekstuff.com/2010/05/erlang-hello-world-example/

% The module name has same filename without .erl
-module(hello).

% import the io module and for use function 'fwrite'
-import(io,[fwrite/1]).

% this works likes headers on C for export functions for anothers modules OR public functions
% hello_world/0 (method with name 'hello_world' with zero arguments
-export([hello_world/0]).

hello_world() -> fwrite("hello, world!!!\nI am run erlang inside docker modafocas!!!\n").