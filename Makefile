.PHONY: all clean

all: fb3-2 fb3-1

# Rules for fb3-2
fb3-2: fb3-2.tab.c fb3-2.lex.c fb3-2func.c
	gcc -o $@ fb3-2.tab.c fb3-2.lex.c fb3-2func.c -lm

fb3-2.tab.c fb3-2.tab.h: fb3-2.y
	bison -d fb3-2.y

fb3-2.lex.c: fb3-2.l fb3-2.tab.h
	flex -o fb3-2.lex.c fb3-2.l

# Rules for fb3-1
fb3-1: fb3-1.tab.c fb3-1.lex.c fb3-1.funcs.c
	gcc -o $@ fb3-1.tab.c fb3-1.lex.c fb3-1.funcs.c -lm

fb3-1.tab.c fb3-1.tab.h: fb3-1.y
	bison -d fb3-1.y

fb3-1.lex.c: fb3-1.l fb3-1.tab.h
	flex -o fb3-1.lex.c fb3-1.l

clean:
	for file in fb3-2.tab.c fb3-2.tab.h fb3-2.lex.c fb3-2 fb3-1.tab.c fb3-1.tab.h fb3-1.lex.c fb3-1; do \
	if [ -e $$file ]; then rm $$file; fi; \
	done

