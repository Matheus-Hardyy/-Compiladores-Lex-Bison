%{
#include <stdio.h>
%}

%%
"+"         { printf("PLUS\n"); }
"-"         { printf("MINUS\n"); }
"*"         { printf("TIMES\n"); }
"/"         { printf("DIVIDE\n"); }
"|"         { printf("ABS\n"); }
[0-9]+      { printf("NUMBER %s\n", yytext); }
\n          { printf("NEWLINE\n"); }
[ \t]+      { /* ignorar */ }

"("         { printf("LPAREN\n"); }
")"         { printf("RPAREN\n"); }
"%"         { printf("MOD\n"); }
"^"         { printf("POWER\n"); }

"<="        { printf("REL_OP <=\n"); }
">="        { printf("REL_OP >=\n"); }
"=="        { printf("REL_OP ==\n"); }
"!="        { printf("REL_OP !=\n"); }
"<"         { printf("REL_OP <\n"); }
">"         { printf("REL_OP >\n"); }

.           { printf("Mystery character %c\n", yytext[0]); }
%%

int yywrap(void) { return 1; }

int main(int argc, char **argv) {
    yylex();
    return 0;
}