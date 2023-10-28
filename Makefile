# Makefile
all: twoData

twoData: twoData.o
	gcc -g -o $@ $+

twoData.o: twoData.s
	as -g -o $@ $<

clean:
	rm -rf twoData *.o

