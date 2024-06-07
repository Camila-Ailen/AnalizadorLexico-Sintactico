package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r,\n]+
%{
    public String lexeme;
%}
%%
programa |
inicio |
fin |
variables |
funcion |
entero |
si |
entonces |
sino |
leer |
escribir |
modulo |
while {lexeme=yytext(); return Reservadas;}
{espacio} {/*Ignore*/}
"\(" {return Parentesis_Abierto;}
")" {return Parentesis_Cerrado;}
";" {return Punto_y_Coma;}
"," {return Coma;}
"=" {return Igual;}
":=" {return Asignacion;}
":" {return Dos_Puntos;}
{L}({L}|{D})* {lexeme=yytext(); return Identificador;}
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}
 . {return ERROR;}