%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <string>
#include <iostream>
using namespace std;
struct ss{
       int label;
       string name;
       string code;
};
#ifndef YYSTYPE
#define YYSTYPE ss*
#endif
string idStr;
string numStr;
int yylex();
extern int yyparse();
FILE* yyin;
void yyerror(const char* s );
static int count=0;

%}

%token NUMBER
%token ID
%token ADD
%token SUB
%token MUL
%token DIV
%token L_PARE
%token R_PARE

%left ADD SUB
%left MUL DIV


%%


lines   :  lines expr';' { cout<<($2->code); }
        |  lines ';'
        |
        ;

expr    : expr ADD expr{$$=new ss;$$->label=count++;$$->name="%";$$->name.append(to_string($$->label));$$->code=$1->code;$$->code.append("\n");$$->code.append($3->code);$$->code.append("MOV EAX ");$$->code.append($1->name);$$->code.append("\n");$$->code.append("MOV EBX ");$$->code.append($3->name);$$->code.append("\n");$$->code.append("ADD EAX EBX");$$->code.append("\n");$$->code.append("MOV ");$$->code.append($$->name);$$->code.append(" EAX");$$->code.append(" \n");}
        | expr SUB expr{$$=new ss;$$->label=count++;$$->name="%";$$->name.append(to_string($$->label));$$->code=$1->code;$$->code.append("\n");$$->code.append($3->code);$$->code.append("MOV EAX ");$$->code.append($1->name);$$->code.append("\n");$$->code.append("MOV EBX ");$$->code.append($3->name);$$->code.append("\n");$$->code.append("SUB EAX EBX");$$->code.append("\n");$$->code.append("MOV ");$$->code.append($$->name);$$->code.append(" EAX");$$->code.append(" \n");}
        | expr MUL expr{$$=new ss;$$->label=count++;$$->name="%";$$->name.append(to_string($$->label));$$->code=$1->code;$$->code.append("\n");$$->code.append($3->code);$$->code.append("MOV EAX ");$$->code.append($1->name);$$->code.append("\n");$$->code.append("MOV EBX ");$$->code.append($3->name);$$->code.append("\n");$$->code.append("MUL EAX EBX");$$->code.append("\n");$$->code.append("MOV ");$$->code.append($$->name);$$->code.append(" EAX");$$->code.append(" \n");}
        | expr DIV expr{$$=new ss;$$->label=count++;$$->name="%";$$->name.append(to_string($$->label));$$->code=$1->code;$$->code.append("\n");$$->code.append($3->code);$$->code.append("MOV EAX ");$$->code.append($1->name);$$->code.append("\n");$$->code.append("MOV EBX ");$$->code.append($3->name);$$->code.append("\n");$$->code.append("DIV EAX EBX");$$->code.append("\n");$$->code.append("MOV ");$$->code.append($$->name);$$->code.append(" EAX");$$->code.append(" \n");}
        | L_PARE expr R_PARE {$$ = new ss;$$->label=$2->label;$$->name="%";$$->name.append(to_string($$->label));$$->code=$2->code;}
        | NUMBER{$$=new ss;$$->name=$1->name;$$->code="";}
        | ID{$$=new ss;$$->name=$1->name;$$->code="";}



%%

       int yylex()
       {
              int t ;
              while (1)
              {
                     t = getchar ();
                     if(t == ' '||t == '\t'||t == '\n')
                     {;}
                     else if(t >= '0' && t <= '9')
                     {
                            numStr="";
                            while(t >= '0' && t <= '9')
                            {
                                   string temp(1,t);
                                   numStr.append(temp);
                                   t=getchar();
                            }
                            string temp(1,'\0');
                            numStr.append(temp);
                            yylval = new ss;
                            yylval->name=numStr;
                            ungetc(t, stdin);
                            return NUMBER;
                     }
                     else if((t >= 'a' && t <='z') || (t >= 'A' && t <= 'Z') || (t == '_'))
                     {
                            idStr="";
                            while((t >= 'a' && t <='z') || (t >= 'A' && t <= 'Z') || (t == '_') || (t >= '0' && t <= '9'))
                            {      
                                   string temp(1,t);
                                   idStr.append(temp);
                                   t=getchar();
                            }
                            string temp(1,'\0');
                            idStr.append(temp);
                            yylval = new ss;
                            yylval->name=idStr;
                            ungetc(t, stdin);
                            return ID;
                     }
                     else if(t == '+')
                     {
                            return ADD;
                     }
                     else if(t == '-')
                     {
                            return SUB;
                     }
                     else if(t == '*')
                     {
                            return MUL;
                     }
                     else if(t == '/')
                     {
                            return DIV;
                     }
                     else if(t == '(')
                     {
                            return L_PARE;
                     }
                     else if(t == ')')
                     {
                            return R_PARE;
                     }
                     else
                     {
                            return t;
                     }
              }
       }

       int main()
       {
              yyin = stdin ;
              do 
              {
                     yyparse();
              } 
                     while (!feof(yyin));
              return 0;
       }

       void yyerror(const char* s) 
       {
              fprintf (stderr , "Parse error : %s\n", s );
              exit (1);
       }