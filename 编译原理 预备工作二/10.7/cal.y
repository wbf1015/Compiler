%{
#include <stdio.h>
#include <stdlib.h>
#include <map>
#include <string>
#include <iostream>
using namespace std;

#ifndef YYSTYPE
#define YYSTYPE double
#endif

string idStr(50,'\0');
int yylex();
extern int yyparse();
FILE* yyin ;
void yyerror(const char* s );

map<string,double> mp;
int count=0;
double IDListNum[100]{};
%}


%token ADD
%token SUB
%token MUL
%token DIV
%token L_Pare
%token R_Pare
%token EQUAL
%token IDENT

%token NUMBER


%left ADD SUB
%left MUL DIV
%right UMINUS

%%
lines : lines expr ';' { printf("%f\n", $2); }
	| lines statement ';' {printf("%f\n",$2); }
        | lines ';'
        |
        ;

statement : IDENT EQUAL expr {$$=IDListNum[int($1)]=$3; }
	

expr : expr ADD expr { $$ = $1 + $3; }
        | expr SUB expr { $$ = $1 - $3; }
        | expr MUL expr { $$ = $1 * $3; }
        | expr DIV expr { $$ = $1 / $3; }
        | L_Pare expr R_Pare { $$ = $2; }
        | SUB expr %prec UMINUS { $$ = -$2; }
        | NUMBER { $$ = $1; }
        | IDENT {$$ = IDListNum[int($1)]; }
        ;

%%

int isdigit(int c){
    return c<='9'&&c>='0';
}


int yylex(){

    while(1){
        int c=getchar();
        
        if(c==' '||c=='\t'||c=='\n')
            continue;

        //判断操作符
        switch(c){
        case '+':
            return ADD;
            
        case '-':
            return SUB;
        
        case '*':
            return MUL;

        case '/':
            return DIV;
        
        case '(':
            return L_Pare;
        
        case ')':
            return R_Pare;
        
        case '=':
            return EQUAL;
        }
        
        if(isdigit(c)){
            yylval=0;
            while(isdigit(c)){
                yylval=yylval*10+c-'0';
                c=getchar();
            }
            ungetc(c,stdin);
            return NUMBER;
        }

        if((c>='a'&&c<='z')||(c>='A'&&c<='Z')||c=='_'){
            int ti=0;
            while (( c >='a' && c <='z') || ( c >= 'A' && c<='Z' )|| ( c == '_') || ( c >= '0' && c <= '9')) {
                idStr[ti]=c;
                ti++;
                c=getchar();
            }
            idStr[ti]='\0';
            ungetc(c,stdin);
            if(mp.find(idStr)==mp.end()){
                mp.insert(pair<string,int>(idStr,count));
                IDListNum[count]=0;
                yylval=count++;
                return IDENT;
            }
            yylval=mp[idStr];
            return IDENT;
            
        }

        return c;
    }
    
}

int main(){
    yyin=stdin;
    do{
        yyparse();
    }while(!feof(yyin));
    return 0;
}
void yyerror(const char*s){
    fprintf(stderr,"Parse error:%s\n",s);
    exit(1);
}