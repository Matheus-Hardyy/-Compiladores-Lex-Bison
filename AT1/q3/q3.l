%{
#include <stdio.h>
%}

%%
"if"        { printf("IF\n"); }
"else"      { printf("ELSE\n"); }
"while"     { printf("WHILE\n"); }
"return"    { printf("RETURN\n"); }

[a-zA-Z_][a-zA-Z0-9_]*  { printf("ID %s\n", yytext); }
[0-9]+(\.[0-9]+)?       { printf("NUMBER %s\n", yytext); }

"//".*      { /* comentário descartado */ }
[ \t\n]+    { /* ignorar */ }

.           { printf("SIMBOLO %c\n", yytext[0]); }
%%

int yywrap(void) { return 1; }

int main(int argc, char **argv) {
    yylex();
    return 0;
}