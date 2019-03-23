%{
#include<stdio.h>

#define INTEGER 257
#define REAL 258
#define WORD 259
#define RWORD 260
#define VARIABLE 261
#define CONSTANT 262

int lines = 0, chars = 0;

void resolve(int token);
void show(char* lexName);
    
%}

digit       [0-9]
integer     \-?{digit}+
real        {integer}\.{digit}+
word        [a-zA-Z]+[^r]
rword       {word}r
identifier  [A-Za-z0-9]+
variable    V{identifier}
constant    C{identifier}
line        \n
%%

{integer}       { resolve(INTEGER); }
{real}          { resolve(REAL); }
{variable}      { resolve(VARIABLE); }
{constant}      { resolve(CONSTANT); }
{word}          { resolve(WORD); }
{rword}         { resolve(RWORD); }
{line}          { chars++; lines++; }
.               { chars++; }
%%
int main() {
    yylex();

    printf("\nTotal de líneas: %d\nTotal de caracteres: %d\n",
        lines, chars);

    return 0;
}

void resolve(int token) {
    chars += yyleng;
    switch(token) {
        case INTEGER:       show("el entero");              break;
        case REAL:          show("el real");                break;
/* word is used to discard constant/variables who have no nunbers */
        case WORD:          ;                               break;
        case RWORD:         show("la palabra reservada");   break;
        case CONSTANT:      show("la constante");           break;
        case VARIABLE:      show("la variable");            break;
    }
}

void show(char* lexName) {
    printf("se encontró %s %s\n", lexName, yytext);
}
