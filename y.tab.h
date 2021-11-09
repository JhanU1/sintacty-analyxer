#ifndef YY_parse_h_included
#define YY_parse_h_included
/*#define YY_USE_CLASS 
*/
#line 1 "/usr/share/bison++/bison.h"
/* before anything */
#ifdef c_plusplus
 #ifndef __cplusplus
  #define __cplusplus
 #endif
#endif


 #line 8 "/usr/share/bison++/bison.h"

#line 21 "/usr/share/bison++/bison.h"
 /* %{ and %header{ and %union, during decl */
#ifndef YY_parse_COMPATIBILITY
 #ifndef YY_USE_CLASS
  #define  YY_parse_COMPATIBILITY 1
 #else
  #define  YY_parse_COMPATIBILITY 0
 #endif
#endif

#if YY_parse_COMPATIBILITY != 0
/* backward compatibility */
 #ifdef YYLTYPE
  #ifndef YY_parse_LTYPE
   #define YY_parse_LTYPE YYLTYPE
/* WARNING obsolete !!! user defined YYLTYPE not reported into generated header */
/* use %define LTYPE */
  #endif
 #endif
/*#ifdef YYSTYPE*/
  #ifndef YY_parse_STYPE
   #define YY_parse_STYPE YYSTYPE
  /* WARNING obsolete !!! user defined YYSTYPE not reported into generated header */
   /* use %define STYPE */
  #endif
/*#endif*/
 #ifdef YYDEBUG
  #ifndef YY_parse_DEBUG
   #define  YY_parse_DEBUG YYDEBUG
   /* WARNING obsolete !!! user defined YYDEBUG not reported into generated header */
   /* use %define DEBUG */
  #endif
 #endif 
 /* use goto to be compatible */
 #ifndef YY_parse_USE_GOTO
  #define YY_parse_USE_GOTO 1
 #endif
#endif

/* use no goto to be clean in C++ */
#ifndef YY_parse_USE_GOTO
 #define YY_parse_USE_GOTO 0
#endif

#ifndef YY_parse_PURE

 #line 65 "/usr/share/bison++/bison.h"

#line 65 "/usr/share/bison++/bison.h"
/* YY_parse_PURE */
#endif


 #line 68 "/usr/share/bison++/bison.h"
#ifndef YY_USE_CLASS
# ifndef YYSTYPE
#  define YYSTYPE int
#  define YYSTYPE_IS_TRIVIAL 1
# endif
#endif

#line 68 "/usr/share/bison++/bison.h"
/* prefix */

#ifndef YY_parse_DEBUG

 #line 71 "/usr/share/bison++/bison.h"

#line 71 "/usr/share/bison++/bison.h"
/* YY_parse_DEBUG */
#endif

#ifndef YY_parse_LSP_NEEDED

 #line 75 "/usr/share/bison++/bison.h"

#line 75 "/usr/share/bison++/bison.h"
 /* YY_parse_LSP_NEEDED*/
#endif

/* DEFAULT LTYPE*/
#ifdef YY_parse_LSP_NEEDED
 #ifndef YY_parse_LTYPE
  #ifndef BISON_YYLTYPE_ISDECLARED
   #define BISON_YYLTYPE_ISDECLARED
typedef
  struct yyltype
    {
      int timestamp;
      int first_line;
      int first_column;
      int last_line;
      int last_column;
      char *text;
   }
  yyltype;
  #endif

  #define YY_parse_LTYPE yyltype
 #endif
#endif

/* DEFAULT STYPE*/
#ifndef YY_parse_STYPE
 #define YY_parse_STYPE int
#endif

/* DEFAULT MISCELANEOUS */
#ifndef YY_parse_PARSE
 #define YY_parse_PARSE yyparse
#endif

#ifndef YY_parse_LEX
 #define YY_parse_LEX yylex
#endif

#ifndef YY_parse_LVAL
 #define YY_parse_LVAL yylval
#endif

#ifndef YY_parse_LLOC
 #define YY_parse_LLOC yylloc
#endif

#ifndef YY_parse_CHAR
 #define YY_parse_CHAR yychar
#endif

#ifndef YY_parse_NERRS
 #define YY_parse_NERRS yynerrs
#endif

#ifndef YY_parse_DEBUG_FLAG
 #define YY_parse_DEBUG_FLAG yydebug
#endif

#ifndef YY_parse_ERROR
 #define YY_parse_ERROR yyerror
#endif

#ifndef YY_parse_PARSE_PARAM
 #ifndef __STDC__
  #ifndef __cplusplus
   #ifndef YY_USE_CLASS
    #define YY_parse_PARSE_PARAM
    #ifndef YY_parse_PARSE_PARAM_DEF
     #define YY_parse_PARSE_PARAM_DEF
    #endif
   #endif
  #endif
 #endif
 #ifndef YY_parse_PARSE_PARAM
  #define YY_parse_PARSE_PARAM void
 #endif
#endif

/* TOKEN C */
#ifndef YY_USE_CLASS

 #ifndef YY_parse_PURE
  #ifndef yylval
   extern YY_parse_STYPE YY_parse_LVAL;
  #else
   #if yylval != YY_parse_LVAL
    extern YY_parse_STYPE YY_parse_LVAL;
   #else
    #warning "Namespace conflict, disabling some functionality (bison++ only)"
   #endif
  #endif
 #endif


 #line 169 "/usr/share/bison++/bison.h"
#define	COMA	258
#define	CTEREALSIGNO	259
#define	CTEREALSINSIGNO	260
#define	CTEENTSIGNO	261
#define	CTEENTSINSIGNO	262
#define	CTECADENA	263
#define	PUNTOYCOMA	264
#define	ELSE	265
#define	IF	266
#define	FOR	267
#define	WHILE	268
#define	DOUBLE	269
#define	INT	270
#define	STRING	271
#define	CHAR	272
#define	NEW	273
#define	PUBLIC	274
#define	CLASS	275
#define	STATIC	276
#define	VOID	277
#define	ID	278
#define	COMENTARIOSIMPLE	279
#define	COMENTARIOCOMPLETO	280
#define	OPMULT	281
#define	OPSUM	282
#define	OPSUS	283
#define	OPDIV	284
#define	OPASIGN	285
#define	OPMOD	286
#define	OPMASMAS	287
#define	OPMENOSMENOS	288
#define	OPPORASIGN	289
#define	OPDIVASIGN	290
#define	OPSUMASIGN	291
#define	OPSUSASIGN	292
#define	LLAVEA	293
#define	LLAVEC	294
#define	PARENTA	295
#define	PARENTC	296
#define	CORCHETEA	297
#define	CORCHETEC	298
#define	IGUAL	299
#define	ARRAY	300
#define	OPMENORIGUAL	301
#define	OPMAYORIGUAL	302
#define	OPDIFERENTE	303
#define	OPMAYOR	304
#define	OPMENOR	305
#define	OPY	306
#define	OPO	307
#define	OPNO	308
#define	VACIO	309


#line 169 "/usr/share/bison++/bison.h"
 /* #defines token */
/* after #define tokens, before const tokens S5*/
#else
 #ifndef YY_parse_CLASS
  #define YY_parse_CLASS parse
 #endif

 #ifndef YY_parse_INHERIT
  #define YY_parse_INHERIT
 #endif

 #ifndef YY_parse_MEMBERS
  #define YY_parse_MEMBERS 
 #endif

 #ifndef YY_parse_LEX_BODY
  #define YY_parse_LEX_BODY  
 #endif

 #ifndef YY_parse_ERROR_BODY
  #define YY_parse_ERROR_BODY  
 #endif

 #ifndef YY_parse_CONSTRUCTOR_PARAM
  #define YY_parse_CONSTRUCTOR_PARAM
 #endif
 /* choose between enum and const */
 #ifndef YY_parse_USE_CONST_TOKEN
  #define YY_parse_USE_CONST_TOKEN 0
  /* yes enum is more compatible with flex,  */
  /* so by default we use it */ 
 #endif
 #if YY_parse_USE_CONST_TOKEN != 0
  #ifndef YY_parse_ENUM_TOKEN
   #define YY_parse_ENUM_TOKEN yy_parse_enum_token
  #endif
 #endif

class YY_parse_CLASS YY_parse_INHERIT
{
public: 
 #if YY_parse_USE_CONST_TOKEN != 0
  /* static const int token ... */
  
 #line 212 "/usr/share/bison++/bison.h"
static const int COMA;
static const int CTEREALSIGNO;
static const int CTEREALSINSIGNO;
static const int CTEENTSIGNO;
static const int CTEENTSINSIGNO;
static const int CTECADENA;
static const int PUNTOYCOMA;
static const int ELSE;
static const int IF;
static const int FOR;
static const int WHILE;
static const int DOUBLE;
static const int INT;
static const int STRING;
static const int CHAR;
static const int NEW;
static const int PUBLIC;
static const int CLASS;
static const int STATIC;
static const int VOID;
static const int ID;
static const int COMENTARIOSIMPLE;
static const int COMENTARIOCOMPLETO;
static const int OPMULT;
static const int OPSUM;
static const int OPSUS;
static const int OPDIV;
static const int OPASIGN;
static const int OPMOD;
static const int OPMASMAS;
static const int OPMENOSMENOS;
static const int OPPORASIGN;
static const int OPDIVASIGN;
static const int OPSUMASIGN;
static const int OPSUSASIGN;
static const int LLAVEA;
static const int LLAVEC;
static const int PARENTA;
static const int PARENTC;
static const int CORCHETEA;
static const int CORCHETEC;
static const int IGUAL;
static const int ARRAY;
static const int OPMENORIGUAL;
static const int OPMAYORIGUAL;
static const int OPDIFERENTE;
static const int OPMAYOR;
static const int OPMENOR;
static const int OPY;
static const int OPO;
static const int OPNO;
static const int VACIO;


#line 212 "/usr/share/bison++/bison.h"
 /* decl const */
 #else
  enum YY_parse_ENUM_TOKEN { YY_parse_NULL_TOKEN=0
  
 #line 215 "/usr/share/bison++/bison.h"
	,COMA=258
	,CTEREALSIGNO=259
	,CTEREALSINSIGNO=260
	,CTEENTSIGNO=261
	,CTEENTSINSIGNO=262
	,CTECADENA=263
	,PUNTOYCOMA=264
	,ELSE=265
	,IF=266
	,FOR=267
	,WHILE=268
	,DOUBLE=269
	,INT=270
	,STRING=271
	,CHAR=272
	,NEW=273
	,PUBLIC=274
	,CLASS=275
	,STATIC=276
	,VOID=277
	,ID=278
	,COMENTARIOSIMPLE=279
	,COMENTARIOCOMPLETO=280
	,OPMULT=281
	,OPSUM=282
	,OPSUS=283
	,OPDIV=284
	,OPASIGN=285
	,OPMOD=286
	,OPMASMAS=287
	,OPMENOSMENOS=288
	,OPPORASIGN=289
	,OPDIVASIGN=290
	,OPSUMASIGN=291
	,OPSUSASIGN=292
	,LLAVEA=293
	,LLAVEC=294
	,PARENTA=295
	,PARENTC=296
	,CORCHETEA=297
	,CORCHETEC=298
	,IGUAL=299
	,ARRAY=300
	,OPMENORIGUAL=301
	,OPMAYORIGUAL=302
	,OPDIFERENTE=303
	,OPMAYOR=304
	,OPMENOR=305
	,OPY=306
	,OPO=307
	,OPNO=308
	,VACIO=309


#line 215 "/usr/share/bison++/bison.h"
 /* enum token */
     }; /* end of enum declaration */
 #endif
public:
 int YY_parse_PARSE(YY_parse_PARSE_PARAM);
 virtual void YY_parse_ERROR(char *msg) YY_parse_ERROR_BODY;
 #ifdef YY_parse_PURE
  #ifdef YY_parse_LSP_NEEDED
   virtual int  YY_parse_LEX(YY_parse_STYPE *YY_parse_LVAL,YY_parse_LTYPE *YY_parse_LLOC) YY_parse_LEX_BODY;
  #else
   virtual int  YY_parse_LEX(YY_parse_STYPE *YY_parse_LVAL) YY_parse_LEX_BODY;
  #endif
 #else
  virtual int YY_parse_LEX() YY_parse_LEX_BODY;
  YY_parse_STYPE YY_parse_LVAL;
  #ifdef YY_parse_LSP_NEEDED
   YY_parse_LTYPE YY_parse_LLOC;
  #endif
  int YY_parse_NERRS;
  int YY_parse_CHAR;
 #endif
 #if YY_parse_DEBUG != 0
  public:
   int YY_parse_DEBUG_FLAG;	/*  nonzero means print parse trace	*/
 #endif
public:
 YY_parse_CLASS(YY_parse_CONSTRUCTOR_PARAM);
public:
 YY_parse_MEMBERS 
};
/* other declare folow */
#endif


#if YY_parse_COMPATIBILITY != 0
 /* backward compatibility */
 /* Removed due to bison problems
 /#ifndef YYSTYPE
 / #define YYSTYPE YY_parse_STYPE
 /#endif*/

 #ifndef YYLTYPE
  #define YYLTYPE YY_parse_LTYPE
 #endif
 #ifndef YYDEBUG
  #ifdef YY_parse_DEBUG 
   #define YYDEBUG YY_parse_DEBUG
  #endif
 #endif

#endif
/* END */

 #line 267 "/usr/share/bison++/bison.h"
#endif
