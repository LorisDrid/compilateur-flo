/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_SYMBOLES_H_INCLUDED
# define YY_YY_SYMBOLES_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    FIN = 0,                       /* FIN  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    PLUS = 258,                    /* PLUS  */
    FOIS = 259,                    /* FOIS  */
    PARENTHESE_OUVRANTE = 260,     /* PARENTHESE_OUVRANTE  */
    PARENTHESE_FERMANTE = 261,     /* PARENTHESE_FERMANTE  */
    POINT_VIRGULE = 262,           /* POINT_VIRGULE  */
    ENTIER = 263,                  /* ENTIER  */
    ECRIRE = 264,                  /* ECRIRE  */
    DIVISION = 265,                /* DIVISION  */
    MOINS = 266,                   /* MOINS  */
    EGAL = 267,                    /* EGAL  */
    DIFFERENT = 268,               /* DIFFERENT  */
    INFERIEUR = 269,               /* INFERIEUR  */
    SUPERIEUR = 270,               /* SUPERIEUR  */
    SUPERIEUR_OU_EGAL = 271,       /* SUPERIEUR_OU_EGAL  */
    INFERIEUR_OU_EGAL = 272,       /* INFERIEUR_OU_EGAL  */
    SI = 273,                      /* SI  */
    SINON = 274,                   /* SINON  */
    VRAI = 275,                    /* VRAI  */
    FAUX = 276,                    /* FAUX  */
    TANTQUE = 277,                 /* TANTQUE  */
    OU = 278,                      /* OU  */
    NON = 279,                     /* NON  */
    LIRE = 280,                    /* LIRE  */
    MODULO = 281,                  /* MODULO  */
    VIRGULE = 282,                 /* VIRGULE  */
    ACCOLADE_OUVRANTE = 283,       /* ACCOLADE_OUVRANTE  */
    ACCOLADE_FERMANTE = 284,       /* ACCOLADE_FERMANTE  */
    ET = 285,                      /* ET  */
    RETOURNER = 286,               /* RETOURNER  */
    TYPE = 287,                    /* TYPE  */
    IDENTIFIANT = 288              /* IDENTIFIANT  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 14 "analyse_syntaxique.y"

    int entier;
    n_programme* prog;
    n_l_instructions* l_inst;
    n_instruction* inst;
    n_exp* exp;

#line 105 "symboles.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_SYMBOLES_H_INCLUDED  */
