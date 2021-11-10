
/*** Definition Section has one variable
which can be accessed inside yylex()
and main() 
***/
%{
#include <stdio.h>
#include <string.h>
#include "y.tab.h"
int contLineas=1;

int addLinea(){
    contLineas=contLineas+1;
}


%}
 
/*** Rule Section has three rules, first rule
matches with capital letters, second rule
matches with any character except newline and
third rule does not take input after the enter
***/

/*Definiciones regulares */
digito [0-9]
letra [A-Za-z]
alfanum {digito}|{letra}
id {letra}({alfanum}|_+{alfanum})*
dimension "\["[{digito}|{id}]"\]"
parte-decimal \.({digito})+
signo ("+"|"-")
exponente ("e"|"E"){Cte-ent-signo}
coma "," 

/*Palabras Claves*/
palabras-claves {{else}|{public}|{if}|{else}|{for}|{while}|{int}|{string}|{char}|{new}|{class}|{static}|{void}}
else "else"
if "if"
for "for"
while "while"
double "double"
int "int"
string "String"
char "char"
new "new"
public "public"
class "class"
static "static"
void "void"

/*Operadores Aritmeticos*/
op-mult "*"
op-sum "+"
op-sus "-"
op-div "/"
op-asign "="
op-mod "%"
op-MasMas "++"
op-MenosMenos "--"
Op-PorAsig "*="
Op-DivAsig "/="
Op-SumAsig "+="
Op-SusAsig "-="

/*Operadores logicos*/
Igual "=="
Menor-igual "<="
Mayor-igual ">="
Diferente "!="
Mayor ">"
Menor "<"
op-y "&&"
op-o "||"
op-no "!"

/*Simbolos*/
llave-a "{"
llave-c "}"
punto-y-coma ;
parent-a "("
parent-c ")"
corchete-a "["
corchete-c "]"

/*Comentarios*/
comen-simple "//"(.)*
comen-completo "/*"(.|{espacios-saltos})*"*/"

/*Espacios y saltos de lineas*/ 
espacios-saltos [ \t\r\f]
vacio ""
salto-linea "\n"

/*Constantes*/
Cte-ent-sin-signo {digito}+
Cte-ent-signo {signo}{digito}+

Cte-cadena \"(\\\")*[^(\")]+(\\\")*\"


Cte-real-signo {Cte-ent-signo}{parte-decimal}({exponente})?
Cte-real-sin-signo {Cte-ent-sin-signo}{parte-decimal}({exponente})?
Vector {id}{dimension}+
/*error*/
error-id {Cte-ent-sin-signo}{alfanum}+?|{Cte-ent-signo}{alfanum}+?




%%
{Cte-real-signo}  return CTEREALSIGNO;
{Cte-real-sin-signo} return CTEREALSINSIGNO;
{Cte-ent-signo} return CTEENTSIGNO;
{Cte-ent-sin-signo} return CTEENTSINSIGNO;
{Cte-cadena} return CTECADENA;
{punto-y-coma} return PUNTOYCOMA;
{else} return ELSE;
{if} return IF;
{for} return FOR;
{while} return WHILE;
{double} return DOUBLE;
{int} return INT;
{string} return STRING;
{char} return CHAR;
{new} return NEW;
{public} return PUBLIC;
{class} return CLASS;
{static} return STATIC;
{void} return VOID;
{id} return  ID;
{comen-simple} return COMENTARIOSIMPLE;
{comen-completo} return COMENTARIOCOMPLETO;
{op-mult} return OPMULT;
{op-sum} return OPSUM;
{op-sus} return OPSUS;
{op-div} return OPDIV;
{op-asign} return OPASIGN;
{op-mod} return OPMOD;
{op-MasMas} return OPMASMAS;
{op-MenosMenos} return OPMENOSMENOS;
{Op-PorAsig} return OPPORASIGN;
{Op-DivAsig} return OPDIVASIGN;
{Op-SumAsig} return OPSUMASIGN;
{Op-SusAsig} return OPSUSASIGN;
{llave-a} return LLAVEA;
{llave-c} return LLAVEC;
{parent-a} return PARENTA;
{parent-c} return PARENTC;
{corchete-a} return CORCHETEA;
{corchete-c} return CORCHETEC;
{Igual} return IGUAL;
{Menor-igual} return OPMENORIGUAL;
{Mayor-igual} return OPMAYORIGUAL;
{Diferente} return OPDIFERENTE;
{Mayor} return OPMAYOR;
{Menor} return OPMENOR;
{op-y} return OPY;
{op-o} return OPO;
{op-no} return OPNO;
{coma} return COMA;
{espacios-saltos} ;
{vacio} return VACIO;
{salto-linea} {addLinea();}

%%