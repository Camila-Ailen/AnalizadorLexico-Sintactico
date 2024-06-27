package codigo;
import java_cup.runtime.Symbol;
%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char

L=[a-zA-Z_]+
D=[0-9]+
espacio=[ \t\r\n]+
%{
    private Symbol symbol (int type, Object value){
        return new Symbol (type, yyline, yycolumn, value);
    }
    private Symbol symbol (int type){
        return new Symbol (type, yyline, yycolumn);
    }
%}
%%
programa {return new Symbol (sym.Programa, yychar, yyline, yytext());}
inicio {return new Symbol (sym.Inicio, yychar, yyline, yytext());}
fin {return new Symbol (sym.Fin, yychar, yyline, yytext());}
variables {return new Symbol (sym.Variables, yychar, yyline, yytext());}
funcion {return new Symbol (sym.Funcion, yychar, yyline, yytext());}
entero {return new Symbol (sym.Entero, yychar, yyline, yytext());}
si {return new Symbol (sym.Si, yychar, yyline, yytext());}
entonces {return new Symbol (sym.Entonces, yychar, yyline, yytext());}
sino {return new Symbol (sym.Sino, yychar, yyline, yytext());}
modulo {return new Symbol (sym.Modulo, yychar, yyline, yytext());}

"," {return new Symbol (sym.Coma, yychar, yyline, yytext());}
"=" {return new Symbol (sym.Igual, yychar, yyline, yytext());}
":=" {return new Symbol (sym.Asignacion, yychar, yyline, yytext());}
":" {return new Symbol (sym.Dos_Puntos, yychar, yyline, yytext());}
"(" {return new Symbol (sym.Parentesis_Abierto, yychar, yyline, yytext());}
")" {return new Symbol (sym.Parentesis_Cerrado, yychar, yyline, yytext());}
";" {return new Symbol (sym.Punto_y_Coma, yychar, yyline, yytext());}

{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}

{L}({L}|{D})* {return new Symbol (sym.Identificador, yychar, yyline, yytext());}
(-)?{D}+ {return new Symbol (sym.Numero, yychar, yyline, yytext());}

 . {return new Symbol (sym.Error, yychar, yyline, yytext());}
