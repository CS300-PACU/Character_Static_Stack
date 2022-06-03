#############################################################################
# File name:  Makefile
# Author:     chadd williams
# Date:       Sept 1, 2021
# Class:      CS360
# Assignment: 
# Purpose:    
#############################################################################

all: bin bin/stktester bin/stkdriver

bin:
	mkdir -p bin

bin/stktester: bin bin/stktester.o bin/stk.o
	gcc -o bin/stktester -g -Wall bin/stktester.o bin/stk.o

bin/stktester.o: src/stktester.c include/stk.h
	gcc -c -o bin/stktester.o -g -Wall src/stktester.c

bin/stkdriver: bin bin/stkdriver.o bin/stk.o
	gcc -o bin/stkdriver -g -Wall bin/stkdriver.o bin/stk.o

bin/stkdriver.o: src/stkdriver.c include/stk.h
	gcc -c -o bin/stkdriver.o -g -Wall src/stkdriver.c

bin/stk.o: src/stk.c include/stk.h
	gcc -c -o bin/stk.o -g -Wall src/stk.c

valgrind: bin/stkdriver
	valgrind -v --leak-check=yes --track-origins=yes --leak-check=full --show-leak-kinds=all bin/stkdriver

printAll:
	enscript -C -T 2 -p - -M Letter -Ec --color -fCourier8 src/stk.c  | ps2pdf - bin/stk.pdf
	enscript -C -T 2 -p - -M Letter -Ec --color -fCourier8 src/stkdriver.c  | ps2pdf - bin/stkdriver.pdf
	enscript -C -T 2 -p - -M Letter -Ec --color -fCourier8 src/stktester.c  | ps2pdf - bin/stktester.pdf
	pdfunite bin/stk.pdf bin/stkdriver.pdf bin/stktester.pdf bin/${USER}_stk.pdf
	@echo
	@echo File produced: bin/${USER}_stk.pdf
	@echo
	@ls -l bin/${USER}_stk.pdf
	@echo

clean:
	rm -f bin/main bin/*.o
