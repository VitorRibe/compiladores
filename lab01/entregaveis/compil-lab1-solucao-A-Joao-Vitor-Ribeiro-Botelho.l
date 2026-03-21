%{
/* Nome: Joao Vitor Ribeiro Botelho */
/* Disciplina: Compiladores - Lab 01 */
#include <stdio.h>
%}

DIGITO      [0-9]
LETRA       [a-zA-Z_]
ID          {LETRA}({LETRA}|{DIGITO})*
NUM_DEC     (({DIGITO}*\.{DIGITO}+)|({DIGITO}+\.{DIGITO}*))([eE][-+]?{DIGITO}+)?
NUM_INT     {DIGITO}+
ESPACO      [ \t\r]+
NOVA_LINHA  \n
STRING      \"([^\"\\\n]|\\.)*\"

%%

"/*"([^*]|\*+[^*/])*\*+"/" { /* Ignora comentarios */ }

"int"|"double"|"struct"|"typedef"|"if"|"else"|"return"|"for"|"while"|"void"|"printf" { printf("KEYWORD %s\n", yytext); }

{ID}        { printf("ID %s\n", yytext); }
{NUM_DEC}   { printf("NUM_DEC %s\n", yytext); }
{NUM_INT}   { printf("NUM_INT %s\n", yytext); }
{STRING}    { printf("STRING %s\n", yytext); }

"=="|"!="|"<="|">="|">"|"<"|"&&"|"||"|"!" { printf("OP_LOG_REL %s\n", yytext); }
"="|"+="|"-=" { printf("OP_ASSIGN %s\n", yytext); }
"++"|"--"|"+"|"-"|"*"|"/"|"%" { printf("OP_ARITH %s\n", yytext); }

";"|","|"."|"("|")"|"{"|"}"|"["|"]"|"#"|":" { printf("PUNCT %s\n", yytext); }

{ESPACO}    { /* ignora */ }
{NOVA_LINHA} { /* ignora */ }

.           { printf("UNKNOWN %s\n", yytext); }

%%

int main(int argc, char **argv) {
    if (argc > 1) {
        FILE *file = fopen(argv[1], "r");
        if (!file) {
            fprintf(stderr, "Erro ao abrir %s\n", argv[1]);
            return 1;
        }
        yyin = file;
    }
    yylex();
    return 0;
}

int yywrap() { return 1; }