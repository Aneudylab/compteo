create_dir = mkdir -p

.PHONY: clean create_build_dir create_tmp_dir

lexer2: create_build_dir tmp/lexer2.c
	gcc -o build/lexer2 tmp/lexer2.c -lfl

tmp/lexer2.c: create_tmp_dir
	flex -o tmp/lexer2.c src/lexer2/lexer2.l

lexer1: create_build_dir tmp/lexer1.c
	gcc -o build/lexer1 tmp/lexer1.c -lfl

tmp/lexer1.c: create_tmp_dir
	flex -o tmp/lexer1.c src/lexer1/lexer1.l

create_tmp_dir:
	$(create_dir) tmp

create_build_dir:
	$(create_dir) build

clean:
	rm -r build tmp
