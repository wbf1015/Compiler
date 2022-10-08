%{
#include <stdio.h>
#include <stdlib.h>
#ifndef YYSTYPE
#define YYSTYPE double
#endif
int yylex();
extern int yyparse();
FILE* yyin ;
void yyerror(const char* s );
%}


%token ADD
%token SUB
%token MUL
%token DIV
%token L_Pare
%token R_Pare

%token NUMBER


%left ADD SUB
%left MUL DIV
%right UMINUS

%%
lines : lines expr ';' { printf("%f\n", $2); }
        | lines ';'
        |
        ;

expr : expr ADD expr { $$ = $1 + $3; }
        | expr SUB expr { $$ = $1 - $3; }
        | expr MUL expr { $$ = $1 * $3; }
        | expr DIV expr { $$ = $1 / $3; }
        | L_Pare expr R_Pare { $$ = $2; }
        | SUB expr %prec UMINUS { $$ = -$2; }
        | NUMBER { $$ = $1; }
        ;

%%

bool isdigit(int c){
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