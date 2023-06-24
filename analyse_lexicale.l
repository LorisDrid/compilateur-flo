/*
 * Analyseur lexical du compilateur L en FLEX
 */
 
%{
#include "arbre_abstrait.h"
#include "symboles.h"
%}
%option yylineno
%option nounput
%option noinput

entier               ([1-9][0-9]*|0)
chiffre              [0-9]
lettre               [a-zA-Z]
alphanum             ({lettre}|{chiffre})
espace               [ \t\r\n]

%%
"#".*                { /* Ignorer commentaires */  }
{espace}+            { /* Ignorer espaces */       }
"+"                  { return PLUS;                }
"-"                  { return MOINS;               }
"*"                  { return FOIS;                }
"/"                  { return DIVISER;             }
"%"                  { return MODULO;              }
"="                  { return EGAL;                }
"!="                 { return DIFFERENT;           }
"<"                  { return INFERIEUR;           }
">"                  { return SUPERIEUR;           }
"<="                 { return INFERIEUR_OU_EGAL;   }
">="                 { return SUPERIEUR_OU_EGAL;   } 
"si"                 { return SI;                  }
"et"                 { return ET;                  }
"ou"                 { return OU;                  }
"non"                { return NON;                 }
"!"                  { return NON;                 }
"sinon"              { return SINON;               }
"tantque"            { return TANTQUE;             }
"booleen"            { yylval.entier=0; return TYPE;  }
"Vrai"               { return VRAI;                }
"Faux"               { return FAUX;                }
"entier"             { yylval.entier=1; return TYPE;  }
"retourner"          { return RETOURNER;           }
"("                  { return PARENTHESE_OUVRANTE; }
")"                  { return PARENTHESE_FERMANTE; }
"{"                  { return ACCOLADE_OUVRANTE;   }
"}"                  { return ACCOLADE_FERMANTE;   }
"lire"               { return LIRE;                }
"ecrire"             { return ECRIRE;              }
","                  { return VIRGULE;             }
";"                  { return POINT_VIRGULE;       }
{entier}             { yylval.entier=atoi(yytext); return ENTIER;}
{lettre}{alphanum}*  { return IDENTIFIANT;         }
<<EOF>>              { return FIN; }  /* Fin de fichier */
.                    {                                /* Erreur, autre caractètre quelconque */
                       fprintf( stderr, "Ligne %d: caractère invalide: %s\n", yylineno,yytext ); \
                       exit(-1); 
                     } 
%%
int yywrap(){
  return 1;
}

/*******************************************************************************
 * Fonction auxiliaire qui donne le nom des différents tokens
 ******************************************************************************/

int token_fermes[] = {PLUS, MOINS, FOIS, DIVISER, MODULO, EGAL, DIFFERENT, INFERIEUR, SUPERIEUR, INFERIEUR_OU_EGAL, SUPERIEUR_OU_EGAL, SI, ET, OU, NON, SINON, TANTQUE, TYPE, VRAI, FAUX, LIRE, RETOURNER, PARENTHESE_OUVRANTE, PARENTHESE_FERMANTE, ACCOLADE_OUVRANTE, ACCOLADE_FERMANTE, ECRIRE, VIRGULE, POINT_VIRGULE, ENTIER, IDENTIFIANT};
char *str_token[] = {"+", "-", "*", "/", "%", "=", "!=", "<", ">", "<=", ">=", "si", "et", "ou", "non", "sinon", "tantque", "booleen", "Vrai", "Faux", "lire", "(", ")", "{", "}", "ecrire", ",", ";", "ENTIER", "IDENTIFIANT"};


int nbMotsClefs = 30;

void nom_token( int token, char *nom, char *valeur ) {   

  for(int i = 0; i < nbMotsClefs;i++){
  	if(token == token_fermes[i]){
  	  strcpy( nom, "symbole" );
  	  strcpy( valeur, str_token[i]);
  	  return;
  	}
  }
  
  if( token == ENTIER ) {
    strcpy( nom, "entier" );
    strcpy( valeur, yytext );
  }
  else if( token == IDENTIFIANT ) {
    strcpy( nom, "identifiant" );  
    strcpy( valeur, yytext );      
  }
  else if( token == TYPE ) {
    strcpy( nom, "type" );  
    strcpy( valeur, yytext );      
  }
}

/*******************************************************************************
 * Fonction auxiliaire appelée par le compilateur en mode -l pour tester l'analyse
 * lexicale. Le fichier source doit être indiqué dans la variable globale yyin.
 * Cette fonction imprime le résultat de l'analyse lexicale sur la sortie standard.
 ******************************************************************************/
void afficher_analyse_lexicale() {
  int uniteCourante;
  char nom[100];
  char valeur[100]; 
    uniteCourante = yylex();  
  while (uniteCourante != FIN) {
    nom_token( uniteCourante, nom, valeur );
    printf("%s\t%s\t%s\n", yytext, nom, valeur);
    uniteCourante = yylex(); 
  } 
}
