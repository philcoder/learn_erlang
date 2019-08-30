# tem que adaptar para os exercicios do hackerank
APP_NAME := solution4
START_METHOD := main

all: compile run
	
compile: clean
	cp *.erl /tmp/ebin/
	erlc -pa /tmp/ebin/ -o /tmp/ebin/ *.erl

run:
	#external input from console
	#printf '3\n1\n2\n3\n4\n' > /tmp/in (solution2)
	#printf '3\n10\n9\n8\n2\n7\n5\n1\n3\n0\n' > /tmp/in (solution3)
	printf '2\n5\n3\n4\n6\n7\n9\n8\n' > /tmp/in

	#call erlang executation
	cat /tmp/in | erl -noshell -pa /tmp/ebin/ -s $(APP_NAME) $(START_METHOD) -s init stop

clean:
	rm -f /tmp/ebin/*.beam
	rm -f erl_crash.dump