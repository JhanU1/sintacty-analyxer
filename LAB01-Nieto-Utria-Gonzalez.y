%{
#include <stdio.h>
#include <string.h>


extern int contLineas;

int ant=-1;


void yyerror(const char *str)
{
    if(ant!=contLineas){
        fprintf(stderr, "error: %s, %d\n", str, contLineas);
        ant=contLineas;
    }
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
    | error CLASS ID LLAVEA clase2
    | error ID LLAVEA clase2
    | error LLAVEA clase2
    | error clase2
    ;

    clase2: metodomain LLAVEC
    | LLAVEC
    ; 

    metodomain: 
        PUBLIC STATIC VOID ID PARENTA parametro PARENTC LLAVEA cerrarbloque
        | error STATIC VOID ID PARENTA parametro PARENTC LLAVEA cerrarbloque
        | error VOID ID PARENTA parametro PARENTC LLAVEA cerrarbloque
        | error  ID PARENTA parametro PARENTC LLAVEA cerrarbloque
        | error  PARENTA parametro PARENTC LLAVEA cerrarbloque
        | error  parametro PARENTC LLAVEA cerrarbloque 
        | error  PARENTC LLAVEA cerrarbloque
        | error  cerrarbloque
        

        ;       
        cerrarbloque: bloque LLAVEC
        | LLAVEC
        ;
        
        parametro: tipo ID
        | tipovector ID
        | error ID
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
        ;

            declaracion: tipo ID PUNTOYCOMA
                | tipovector ID PUNTOYCOMA
                | tipovector ID OPASIGN valorvector PUNTOYCOMA
                | tipo asignacion PUNTOYCOMA
                | tipo ID declaracion2 PUNTOYCOMA
                | tipovector ID declaracion2 PUNTOYCOMA
                | tipo asignacion declaracion2 PUNTOYCOMA
                | tipovector asignacion declaracion2 PUNTOYCOMA
                | asignacion PUNTOYCOMA
                | ID OPASIGN valorvector PUNTOYCOMA
                | error PUNTOYCOMA
                ;
                declaracion2: COMA asignacion
                | declaracion2 COMA asignacion;
                
                asignacion: valorasigarit 
                | ID OPASIGN CTECADENA
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

        condicion: condicion operadoreslogconcat verificacion 
                | verificacion 
                ;

            verificacion: ID OPNO CTECADENA
            | ID OPY CTECADENA
            | ID operadoreslogconcat ID
            | operacion operadoreslogarit operacion
            | operacion operadoreslogcompa operacion
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

        structfor: FOR PARENTA tipo asignacion for2
            | FOR PARENTA asignacion for2
            | error LLAVEA cerrarbloque
            ;
                for2: PUNTOYCOMA  condicion PUNTOYCOMA valorasigarit PARENTC LLAVEA cerrarbloque
                    | error cerrarbloque
                    ;

        structwhile: WHILE PARENTA  structwhile2
        | WHILE PARENTA ID PARENTC LLAVEA cerrarbloque
        | error PARENTA PARENTC LLAVEA cerrarbloque
        ;
            structwhile2: condicion PARENTC LLAVEA cerrarbloque
             | error PARENTC LLAVEA cerrarbloque
            ;

        strucif: IF PARENTA strucif2
        | strucif  strucifelse
        ;
            strucif2: condicion PARENTC LLAVEA cerrarbloque
                | ID PARENTC LLAVEA cerrarbloque
                | error LLAVEA cerrarbloque
                ;

        strucifelse: ELSE LLAVEA cerrarbloque
        ;



