%{
#include <stdlib.h>
#include "y.tab.h"
%}
entero  [0-9]
%%
"T"               {return tTriangulo;}
"P"               {return tParalelogramo;}
"R"               {return tRadianes;}
"G"               {return tGrado;}
{entero}          {yylval.valInt = atoi(yytext); return tAngulo;}
.               ;
\n              ;
%%
