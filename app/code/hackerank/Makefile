# tem que adaptar para os exercicios do hackerank
APP_NAME := lang_features
START_METHOD := main

all: compile run
	
compile: clean
	cp *.erl /tmp/ebin/
	erlc -pa /tmp/ebin/ -o /tmp/ebin/ *.erl

run:
	erl -noshell -pa /tmp/ebin/ -s $(APP_NAME) $(START_METHOD) -s init stop

clean:
	rm -f /tmp/ebin/*.beam
	rm -f erl_crash.dump