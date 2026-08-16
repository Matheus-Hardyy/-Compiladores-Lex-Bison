%{
#include <stdio.h>

int lines = 0, words = 0, chars = 0;
int ints = 0, floats = 0, puncts = 0;
%}

%%
\n                    { lines++;   chars += yyleng; }
[0-9]+\.[0-9]+        { floats++;  chars += yyleng; }
[0-9]+                { ints++;    chars += yyleng; }
[a-zA-Z]+             { words++;   chars += yyleng; }
[.,;:!?]              { puncts++;  chars += yyleng; }
.                     { chars += yyleng; }
%%

int yywrap(void) { return 1; }

int main(int argc, char **argv) {
    yylex();
    printf("linhas: %d\n", lines);
    printf("palavras: %d\n", words);
    printf("caracteres: %d\n", chars);
    printf("Nº inteiros: %d\n", ints);
    printf("Nº irracionais: %d\n", floats);
    printf("pontuações: %d\n", puncts);
    return 0;
}