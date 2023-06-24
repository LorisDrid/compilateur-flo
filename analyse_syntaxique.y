%{
#include <stdlib.h>
#include <stdio.h>
#include "arbre_abstrait.h"
#include "analyse_lexicale.h"


//n_programme* yyparse();
int yylex();
int yyerror(const char *s);
n_programme* arbre_abstrait;
%}

%union {
    int entier;
    n_programme* prog;
    n_l_instructions* l_inst;
    n_instruction* inst;
    n_exp* exp;
}


%define parse.error detailed
%define parse.lac full
//Symboles terminaux qui seront fournis par yylex(), ordre non important


//Ce qu'on a de base
%token PLUS
%token FOIS
%token PARENTHESE_OUVRANTE
%token PARENTHESE_FERMANTE
%token POINT_VIRGULE
%token <entier> ENTIER
%token ECRIRE
%token FIN 0

//Opérations arithmétiques
%token DIVISION
%token MOINS
%token EGAL
%token DIFFERENT
%token INFERIEUR
%token SUPERIEUR
%token SUPERIEUR_OU_EGAL
%token INFERIEUR_OU_EGAL

//Mots clés et symboles spécifiques
%token SI
%token SINON
%token VRAI
%token FAUX
%token TANTQUE
%token OU
%token NON
%token LIRE
%token MODULO
%token VIRGULE
%token ACCOLADE_OUVRANTE
%token ACCOLADE_FERMANTE
%token ET
%token RETOURNER


//booléen ou entier 
%token <type> TYPE
//identifiant
%token <identifiant> IDENTIFIANT

//Types de noeuds de l'arbre abstrait
%type <prog> prog
%type <l_inst> listeInstructions
%type <inst> instruction
%type <inst> ecrire
%type <exp> expr 
%type <exp> facteur
%type <exp> produit





%%

//	Partie 1

// Grammaire de base jusqu'a écrire


prog: listeInstructions {
arbre_abstrait =creer_n_programme($1);
} 

listeInstructions: instruction {
$$ =creer_n_l_instructions($1 ,NULL);
} 

listeInstructions: instruction listeInstructions {
$$ =creer_n_l_instructions($1 ,$2);
} 

instruction: ecrire {
	$$ =$1;
}

// Ecrire 

ecrire: ECRIRE PARENTHESE_OUVRANTE expr PARENTHESE_FERMANTE POINT_VIRGULE {
	
	$$ =creer_n_ecrire($3);
}


//	Partie 2 : Opérations


// Facteur

facteur: ENTIER {
	$$ = creer_n_entier($1);
}

facteur: MOINS ENTIER {
	$$ = creer_n_operation('-',$2, NULL);
}

facteur: PARENTHESE_OUVRANTE expr PARENTHESE_FERMANTE {
	$$ =$2 ;
}

// Produit

produit: facteur {
	$$ = $1;
}

produit: produit FOIS facteur{
	$$ = creer_n_operation('*', $1 , $3);
}
produit: produit DIVISION facteur{
	$$ = creer_n_operation('/', $1, $3);
	}
	
produit: produit MODULO facteur{
	$$ = creer_n_operation('/', $1, $3);
	}


// Expression

expr: expr PLUS produit{
	$$ =creer_n_operation('+', $1, $3);
}


expr: produit {
	$$ = $1;
}


// Erreur

%%

int yyerror(const char *s) {
    printf("yyerror : %s\n",s);
    return 0;
}

