

package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ \t\r]+
%{
    public String lexeme;
%}
%%

/* Palabras reservadas */
( programa ) {lexeme=yytext(); return Programa;}
( variables ) {lexeme=yytext(); return Variables;}
( funcion ) {lexeme=yytext(); return Funcion;}
( si ) {lexeme=yytext(); return Si;}
( sino ) {lexeme=yytext(); return Sino;}
( inicio ) {lexeme=yytext(); return Inicio;}
( entonces ) {lexeme=yytext(); return Entonces;}
( fin ) {lexeme=yytext(); return Fin;}
( modulo ) {lexeme=yytext(); return Modulo;}
( entero ) {lexeme=yytext(); return Entero;}


/* simbolos */
( "(" ) {lexeme=yytext(); return Parentesis_Abierto;}
( ")" ) {lexeme=yytext(); return Parentesis_Cerrado;}
( ":" ) {lexeme=yytext(); return Dos_Puntos;}
( ";" ) {lexeme=yytext(); return Punto_y_Coma;}
( "=" ) {lexeme=yytext(); return Igual;}
( "," ) {lexeme=yytext(); return Coma;}
( ":=" ) {lexeme=yytext(); return Asignacion;}

/* Espacios en blanco */
{espacio} {/*Ignore*/}

/* Comentarios */
( "//"(.)* ) {/*Ignore*/}

/* Salto de linea */
( "\n" ) {lexeme=yytext(); return Linea;}

/* Identificador */
{L}({L}|{D})* {lexeme=yytext(); return Identificador;}

/* Numero */
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}

/* Error de analisis */
 . {return ERROR;}