%{
#include <stdio.h>
#include <ctype.h>
%}

%%
"/*"([^*]|\*+[^*/])*\*+"/" { /* Ignore comments */ }
"//".*          { /* Ignore single-line comments */ }

[A-Z]          { printf("%c", tolower(yytext[0])); }  // Convert uppercase to lowercase
.              { printf("%s", yytext); }              // Print other characters

%%
int yywrap() {
    return 1;  // Return 1 to indicate the end of input
}

// Main function
int main(int argc, char **argv) {
    yylex();  // Call the lexer
    return 0;
}

