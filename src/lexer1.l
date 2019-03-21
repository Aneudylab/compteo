%{
#include<stdio.h>

#define INTEGER 257
#define REAL 258
#define WORD 259
#define IDENTIFIER 260

int integers = 0,
    reals = 0,
    words = 0,
    identifiers = 0;

void resolve(int token);
void show(char* lexName, int total);
    
%}

digit       [0-9]
integer     \-?{digit}+
real        {integer}\.{digit}+
word        [a-zA-Z]+
identifier  [A-Z][A-Z0-9]*
%%

{integer}       { resolve(INTEGER); }
{real}          { resolve(REAL); }
{word}          { resolve(WORD); }
{identifier}    { resolve(IDENTIFIER); }
.               { ; }
%%
int main() {
    yylex();

    printf("enteros : %d\nreales: %d\npalabras: %d\nidentificadores: %d\n",
          integers, reals, words, identifiers);

    return 0;
}

void resolve(int token) {
    switch(token) {
        case INTEGER:       show("el entero", ++integers);           break;
        case REAL:          show("el real", ++reals);                break;
        case WORD:          show("la palabra", ++words);             break;
        case IDENTIFIER:    show("el identificador", ++identifiers); break;
    }
}

void show(char* lexName, int total) {
    printf("se encontró %s %s, total: %d\n", lexName, yytext,  total);
}
