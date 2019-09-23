Learning Erlang
====================================================================

This guide will provide you all the steps to run Erlang language inside docker image.


### System Requeriments:

1. Components docker and docker-compose already installed on developer machine

### Start/Stop Docker services

For startup all services
```
docker-compose -f docker-compose.yml up -d --build
```

For stop all services
```
docker-compose -f docker-compose.yml down
```

For stop and cleanup volumes 
```
docker-compose -f docker-compose.yml down --volumes
```

Join inside docker image
```
docker exec -it app bash
```

### Inside Docker image for execute erlang code

-- For compile a erlang file (at same directory of file)
erlc <name_file>

e.g.: erlc hello.erl (execute it inside cap1 folder)

-- For execute module
erl -noshell -s <name_file> <start_method> -s init stop

e.g.: erl -noshell -s hello hello_world -s init stop


<b>PS: use for speedup that process use command</b>
```
make all
```
<b>Inside Makefile change "main" script to call as you wish</b>