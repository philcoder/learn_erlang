# tem que adaptar para os exercicios do hackerank
APP_NAME := solution11
START_METHOD := main

all: compile run
	
compile: clean
	cp *.erl /tmp/ebin/
	erlc -pa /tmp/ebin/ -o /tmp/ebin/ *.erl

run:
	#external input from console
	#printf '3\n1\n2\n3\n4\n' > /tmp/in (solution2)
	#printf '3\n10\n9\n8\n2\n7\n5\n1\n3\n0\n' > /tmp/in (solution3)
	#printf '2\n5\n3\n4\n6\n7\n9\n8\n' > /tmp/in (solution4)
	#printf '10\n' > /tmp/in (solution5)
	#printf '19\n22\n3\n28\n26\n' > /tmp/in (solution6)
	#printf '3\n-2\n-4\n6\n5\n7\n8\n0\n1\n' > /tmp/in (solution7)
	#printf '2\n-4\n3\n-1\n23\n-4\n-54\n' > /tmp/in (solution8)
	#printf '4\n20.0000\n5.0000\n0.5000\n-0.5000\n' > /tmp/in (solution9)
	#printf '1 2 3 4 5\n6 7 8 9 10\n1 4\n' > /tmp/in (solution10)
	printf '2\n3\n1 1\n2 2\n3 3\n4\n1 2\n2 4\n3 6\n4 8\n' > /tmp/in

	#call erlang executation
	cat /tmp/in | erl -noshell -pa /tmp/ebin/ -s $(APP_NAME) $(START_METHOD) -s init stop

clean:
	rm -f /tmp/ebin/*.beam
	rm -f erl_crash.dump