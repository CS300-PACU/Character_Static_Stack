#############################################################################
# File name:  Makefile
# Author:     chadd williams
# Date:       Sept 1, 2021
# Class:      CS360
# Assignment: 
# Purpose:    
#############################################################################

# variables
CC=clang-16
CFLAGS=-g -Wall
VALGRIND_FLAGS=-v --leak-check=yes --track-origins=yes --leak-check=full \
--show-leak-kinds=all
ENSCRIPT_FLAGS=-C -T 2 -p - -M Letter --color -fCourier8
TARGETS=bin/stk.o

all: bin ${TARGETS}

bin:
	mkdir -p bin

bin/stk.o: src/stk.c include/stk.h
	${CC} -c -o bin/stk.o ${CFLAGS}  src/stk.c

printAll:
	enscript ${ENSCRIPT_FLAGS} -Ec src/stk.c  | ps2pdf - bin/stk.pdf
	enscript ${ENSCRIPT_FLAGS} -Ecpp test/UnitTests.cpp  | ps2pdf - bin/UnitTests.pdf
	pdfunite bin/stk.pdf bin/UnitTests.pdf bin/${USER}_stk.pdf
	@echo
	@echo File produced: bin/${USER}_stk.pdf
	@echo
	@ls -l bin/${USER}_stk.pdf
	@echo

clean:
	rm -f ${TARGETS} bin/*.o bin/*.pdf
