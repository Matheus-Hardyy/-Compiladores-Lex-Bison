%{
#include <stdio.h>
#include <stdlib.h>
%}

%%
"if"        { printf("IF\n"); }
"else"      { printf("ELSE\n"); }
"while"     { printf("WHILE\n"); }
"return"    { printf("RETURN\n"); }

[a-zA-Z_][a-zA-Z0-9_]*  { printf("ID %s\n", yytext); }
[0-9]+(\.[0-9]+)?       { printf("NUMBER %s\n", yytext); }

"//".*      { /* descartar */ }
[ \t\n]+    { /* ignorar */ }

.           { printf("SIMBOLO %c\n", yytext[0]); }
%%

int yywrap(void) { return 1; }

int main(int argc, char **argv) {
    if (argc < 2) {
        printf("Erro: nenhum arquivo especificado.\n");
        return 1;
    }

    FILE *f = fopen(argv[1], "r");
    if (!f) {
        printf("Erro: não foi possível abrir o arquivo %s.\n", argv[1]);
        return 1;
    }

    yyin = f;
    yylex();
    fclose(f);
    return 0;
}