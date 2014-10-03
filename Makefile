CC=g++
CFLAGS=-c -Wall
LDFLAGS=-lmraa
SOURCES=main.cpp
OBJECTS=$(SOURCES:.cpp=.o)
PWD=$(shell pwd)
DIRNAME=$(shell basename $(PWD))
EDISON=root@192.168.1.132
PASSWORD=mypassword

all: $(SOURCES) $(EXECUTABLE)
	
$(DIRNAME): $(OBJECTS) 
	$(CC) $(LDFLAGS) $(OBJECTS) -o $@

.cpp.o:
	$(CC) $(CFLAGS) $< -o $@

run: $(EXECUTABLE)
	./$(EXECUTABLE)

remote: remote-make remote-run
	

remote-make:
	sshpass -p $(PASSWORD) ssh $(EDISON) mkdir -p $(DIRNAME)
	tar cpf - ./ | sshpass -p $(PASSWORD) ssh $(EDISON) "tar xpf - -C $(DIRNAME)"
	sshpass -p $(PASSWORD) ssh $(EDISON) "cd $(DIRNAME); make

remote-run:
	sshpass -p $(PASSWORD) ssh $(EDISON) "cd $(DIRNAME); make run"
