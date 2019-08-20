# learn erlang

PS: use these commands inside erlang docker runtime...

-- For compile a erlang file (at same directory of file)
erlc <name_file>

e.g.: erlc hello.erl (execute it inside cap1 folder)

-- For execute module
erl -noshell -s <name_file> <start_method> -s init stop

e.g.: erl -noshell -s hello hello_world -s init stop