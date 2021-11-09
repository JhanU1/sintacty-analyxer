%{
#include <stdio.h>
#include <string.h>


extern int contLineas;

void yyerror(const char *str)
{
    fprintf(stderr, "error: %s, %d\n", str, contLineas);
}

int yywrap()
{
    return 1;
}

int main(int argc, char* argv[])
{
    extern FILE *yyin, *yyout;
  
    yyin = fopen("entrada.java", "r");
  
    yyout = fopen("salida.txt","w");

    while(!feof(yyin)){
    yyparse();
    }
}
%}


%token  COMA CTEREALSIGNO CTEREALSINSIGNO CTEENTSIGNO  CTEENTSINSIGNO CTECADENA PUNTOYCOMA ELSE IF FOR WHILE 
%token DOUBLE INT STRING CHAR NEW PUBLIC CLASS STATIC VOID  ID 
%token COMENTARIOSIMPLE COMENTARIOCOMPLETO OPMULT OPSUM OPSUS OPDIV 
%token OPASIGN OPMOD OPMASMAS OPMENOSMENOS OPPORASIGN OPDIVASIGN OPSUMASIGN 
%token OPSUSASIGN LLAVEA LLAVEC PARENTA PARENTC CORCHETEA CORCHETEC IGUAL ARRAY
%token OPMENORIGUAL OPMAYORIGUAL OPDIFERENTE OPMAYOR OPMENOR OPY OPO OPNO VACIO
%%

clase: 
    PUBLIC CLASS ID LLAVEA clase2
    | error {yyerrok;yyclearin;}
    ;
    clase2: metodomain LLAVEC
    | LLAVEC
    ; 

    metodomain: 
        PUBLIC STATIC VOID ID PARENTA parametro PARENTC LLAVEA cerrarbloque
        | error {yyerrok;yyclearin;}
        ;       
        cerrarbloque: bloque LLAVEC
        | LLAVEC
        ;
        
        parametro: tipo ID
        | tipovector ID
        ;

            tipo: STRING
                | CHAR
                | INT
                | DOUBLE
                ;


                tipovector: STRING dimensionparam
                | CHAR dimensionparam
                | INT dimensionparam
                | DOUBLE dimensionparam
                ;
                    dimensionval: CORCHETEA ID CORCHETEC
                        | CORCHETEA CTEENTSIGNO CORCHETEC
                        | CORCHETEA CTEENTSINSIGNO CORCHETEC
                        | dimensionval CORCHETEA CTEENTSIGNO CORCHETEC
                        | dimensionval CORCHETEA CTEENTSINSIGNO CORCHETEC
                        | dimensionval CORCHETEA ID CORCHETEC
                        ;
                    
                    dimensionparam: CORCHETEA  CORCHETEC
                        | dimensionparam CORCHETEA  CORCHETEC
                        ;

        bloque: declaracion 
        | structfor
        | structwhile
        | strucif
        | bloque declaracion
        | bloque structfor
        | bloque structwhile
        | bloque strucif
        | error {yyerrok;yyclearin;}
        ;

            declaracion: tipo ID PUNTOYCOMA
                | tipovector ID PUNTOYCOMA
                | tipovector asignacion PUNTOYCOMA
                | tipo asignacion PUNTOYCOMA
                | tipo ID declaracion2 PUNTOYCOMA
                | tipovector ID declaracion2 PUNTOYCOMA
                | tipo asignacion declaracion2 PUNTOYCOMA
                | tipovector asignacion declaracion2 PUNTOYCOMA
                | asignacion PUNTOYCOMA

                ;
                declaracion2: COMA asignacion
                | declaracion2 COMA asignacion;
                
                asignacion: valorasigarit 
                | ID OPASIGN CTECADENA
                | valorvector
                ;

                valorvector: NEW tipo dimensionval;


                valorasigarit: ID operadoresaritasig
                    | ID OPMASMAS 
                    | ID OPASIGN operacion
                    | ID OPMENOSMENOS
                    ;
                    
                    operadoresaritasig: OPPORASIGN operacion
                        | OPSUMASIGN operacion  
                        | OPSUSASIGN operacion
                        | OPDIVASIGN operacion
                        ;
                
                    operacion: PARENTA operacion PARENTC
                        | valoroperacion
                        | constsconsignoarit
                        | operacion operadoresarit PARENTA operacion PARENTC 
                        | operacion operadoressumasus PARENTA operacion PARENTC 
                        | operacion operadoresarit valoroperacion 
                        | operacion operadoresarit constsconsignoarit
                        | operacion constsconsignoarit
                        ;

                        valoroperacion: constssinsignoarit
                            | ID
                            ;
                        
                            constssinsignoarit: CTEENTSINSIGNO
                                | CTEREALSINSIGNO
                                ;

                            constsconsignoarit: CTEREALSIGNO
                                | CTEENTSIGNO
                                ;
                       operadoressumasus:OPSUM
                            | OPSUS
                            ;
                        operadoresarit: OPMULT
                            | OPDIV
                            | OPMOD
                            ;

        condicion: condicion operadoreslogconcat verificacion | verificacion;

            verificacion: ID operadoreslogarit operacion
            | ID operadoreslogcompa CTECADENA
            | ID operadoreslogcompa operacion
            | ID operadoreslogconcat ID
            | PARENTA verificacion PARENTC
            | OPNO PARENTA verificacion PARENTC
            ;

            operadoreslogconcat: OPY
            | OPO
            ;

            operadoreslogcompa: OPDIFERENTE
            | IGUAL
            ;

            operadoreslogarit: OPMENORIGUAL
            | OPMENOR
            | OPMAYOR
            | OPMAYORIGUAL
            ;

        structfor: FOR PARENTA tipo asignacion PUNTOYCOMA for2
            | FOR PARENTA asignacion PUNTOYCOMA for2
            ;
            for2: condicion PUNTOYCOMA valorasigarit PARENTC LLAVEA for3
            ;
                for3: bloque LLAVEC
                    | LLAVEC;

        structwhile: WHILE PARENTA condicion PARENTC LLAVEA cerrarbloque
        | WHILE PARENTA ID PARENTC LLAVEA cerrarbloque
        ;

        strucif: IF PARENTA condicion PARENTC LLAVEA cerrarbloque
        | IF PARENTA ID PARENTC LLAVEA cerrarbloque
        | strucif strucifelse
        ;

        strucifelse: ELSE LLAVEA cerrarbloque;



