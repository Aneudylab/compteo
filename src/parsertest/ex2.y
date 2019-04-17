%{
#include <stdio.h>
int yylex (void);
void yyerror (char const *);
%}

%union{
int valInt;
}

%token tRadianes tGrado tParalelogramo tTriangulo
%token <valInt> tAngulo
%type <valInt> CONVERCION ANGULO SUMATORIA_ANGULO 
%start S


%%
S : SUMATORIA_ANGULO {printf("Sumatoria de los angulos de los Paralelogramos: %f Grados\n", $1); }
;

SUMATORIA_ANGULO : SUMATORIA_ANGULO ANGULO {if ($2 < 100) {$$ = $1 + $2;}}
           |ANGULO {$$ = $1;};

;

ANGULO : tParalelogramo CONVERCION {$$=$2; 
    printf("Angulo del Paralelogramo: %f Grados\n", $$);}
    | tTriangulo CONVERCION {$$=0;}
    
;

CONVERCION: tAngulo tGrado {$$=$1;}
        |tAngulo tRadianes {$$=($1*57.29);}
;

%%

int main() {
yyparse();
return 0;
}

void yyerror (char const * s) {
	printf("\n\nun puto error de sintaxis  %\n", s);
        }
