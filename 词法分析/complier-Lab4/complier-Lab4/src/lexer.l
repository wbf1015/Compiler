%option noyywrap
%option yylineno
%{
    /*
    * You will need to comment this line in lab5.
    */
    #define ONLY_FOR_LEX
    
    #ifdef ONLY_FOR_LEX
    #else
    #define YYSTYPE void *
    #include "parser.h"
    #endif

    #define YY_NO_UNPUT
    #define YY_NO_INPUT
    #include <string>
    #include <vector>

    #ifdef ONLY_FOR_LEX
    #include <ostream>
    #include <fstream>
    #include <iostream>
    #include <cmath>
    #include <stdio.h>
    #include <map>
    #include <string>
    using namespace std;
    extern FILE *yyin; 
    extern FILE *yyout;
    int columnno=0;

    void DEBUG_FOR_LAB4(string s){
        string DEBUG_INFO = "[DEBUG LAB4]: \t" + s + "\n";
        fputs(DEBUG_INFO.c_str(), yyout);
    }
    float changeStr2Num(string s,string type){
        if(strcmp(type.c_str(),"OCT")==0){
            int oct=0;
            sscanf(s.c_str(),"%o",&oct);
            return oct;
        }
        if(strcmp(type.c_str(),"HEX")==0){
            int hex=0;
            sscanf(s.c_str(),"%x",&hex);
            return hex;
        }
        if(strcmp(type.c_str(),"NUM")==0){
            float num=0;
            sscanf(s.c_str(),"%f",&num);
            return num;
        }
        return 0;
    }

    class SymbolTable;

    class Symbol
    {
    private:
        /* data */
        int type;
        SymbolTable* inTable;
    public:
        Symbol(SymbolTable* addr,int type=0){
            this->inTable=addr;
            this->type=type;
        }
        ~Symbol();

        void setInTable(SymbolTable* addr){
            this->inTable=addr;
        }
    };

    class SymbolTable
    {
    private:
        map<string,Symbol*>symbolTable;
        SymbolTable* prevTable;
    public:
        SymbolTable(SymbolTable* prev=nullptr){
            this->prevTable=prev;
        }

        Symbol* lookUpSymbol(string symbolName){
            if(symbolTable.find(symbolName)!=symbolTable.end()){
                return symbolTable[symbolName];
            }
            return nullptr;
        }
        void addSymbol(string symbolName,Symbol* symbol){
            symbolTable.insert(pair<string,Symbol*>(symbolName,symbol));
        }
        SymbolTable*getPrev(){
            return prevTable;
        }
    };

    SymbolTable* currentTable=new SymbolTable();
    #endif
%}

HEX (0[xX][0-9a-fA-F]+)
OCT (0[0-7]+)
DECIMIAL_INT ([1-9][0-9]*|0)
DECIMIAL_FLOAT ([1-9][0-9]*\.[0-9]+([eE][+-]?[0-9]+)?)
ID [[:alpha:]_][[:alpha:][:digit:]_]*
EOL (\r\n|\n|\r)
WHITE [\t ]
commentLine (\/\/.*)
commentBegin "/*"
commentElement (.|\n)
commentEnd "*/"
%x BLOCKCOMMENT

%%
{commentLine} {
    #ifdef ONLY_FOR_LEX
        columnno+=2;
        string comment=yytext;
        DEBUG_FOR_LAB4("COMMENTLINE\t\t"+comment+"\t"+to_string(yylineno)+"\t"+to_string(columnno-2));
    #else
        return COMMENTLINE;
    #endif
}
{commentBegin} {
    #ifdef ONLY_FOR_LEX
        columnno+=2;
        BEGIN BLOCKCOMMENT;
        DEBUG_FOR_LAB4("COMMENTBEGIN\t\t/*\t"+to_string(yylineno)+"\t"+to_string(columnno-2));
    #else
        return COMMENTBEGIN;
    #endif
}
<BLOCKCOMMENT>{commentEnd} {
    #ifdef ONLY_FOR_LEX
        columnno+=2;
        DEBUG_FOR_LAB4("COMMENTEND\t\t*/\t"+to_string(yylineno)+"\t"+to_string(columnno-2));
        BEGIN INITIAL;
    #else
        return COMMENTEND;
    #endif
}
<BLOCKCOMMENT>{commentElement} {
    #ifdef ONLY_FOR_LEX
        columnno=0;
    #else
        return COMMENTELEMENT;
    #endif
}
"int" {
    /*
    * Questions: 
    *   Q1: Why we need to return INT in further labs?
    *   Q2: What is "INT" actually?
    */
    #ifdef ONLY_FOR_LEX
        columnno+=3;
        DEBUG_FOR_LAB4("INT\t\tint\t"+to_string(yylineno)+"\t"+to_string(columnno-3));
    #else
        return INT;
    #endif
}
"float" {
    #ifdef ONLY_FOR_LEX
    columnno+=5;
        DEBUG_FOR_LAB4("FLOAT\t\tchar\t"+to_string(yylineno)+"\t"+to_string(columnno-5));
    #else
        return FLOAT;
    #endif 
}
"void" {
    #ifdef ONLY_FOR_LEX
        columnno+=4;
        DEBUG_FOR_LAB4("VOID\t\tvoid\t"+to_string(yylineno)+"\t"+to_string(columnno-4));
    #else
        return VOID;
    #endif 
}
"if" {
    #ifdef ONLY_FOR_LEX
        columnno+=2;
        DEBUG_FOR_LAB4("IF\t\tif\t"+to_string(yylineno)+"\t"+to_string(columnno-2));
    #else
        return IF;
    #endif
}
"else" {
    #ifdef ONLY_FOR_LEX
        columnno+=4;
        DEBUG_FOR_LAB4("ELSE\t\telse\t"+to_string(yylineno)+"\t"+to_string(columnno-4));
    #else
        return ELSE;
    #endif
}
"while" {
    #ifdef ONLY_FOR_LEX
        columnno+=5;
        DEBUG_FOR_LAB4("WHILE\t\twhile\t"+to_string(yylineno)+"\t"+to_string(columnno-5));
    #else
        return WHILE;
    #endif
}
"return" {
    #ifdef ONLY_FOR_LEX
        columnno+=6;
        DEBUG_FOR_LAB4("RETURN\t\treturn\t"+to_string(yylineno)+"\t"+to_string(columnno-6));
    #else
        return RETURN;
    #endif
}
"break" {
    #ifdef ONLY_FOR_LEX
        columnno+=5;
        DEBUG_FOR_LAB4("BREAK\t\tbreak\t"+to_string(yylineno)+"\t"+to_string(columnno-5));
    #else
        return BREAK;
    #endif
}
"continue" {
    #ifdef ONLY_FOR_LEX
        columnno+=8;
        DEBUG_FOR_LAB4("CONTINUE\t\tcontinue\t"+to_string(yylineno)+"\t"+to_string(columnno-8));
    #else
        return CONTINUE;
    #endif
}
"const" {
    #ifdef ONLY_FOR_LEX
        columnno+=5;
        DEBUG_FOR_LAB4("CONST\t\tconst\t"+to_string(yylineno)+"\t"+to_string(columnno-5));
    #else
        return const;
    #endif
}

"==" {
    #ifdef ONLY_FOR_LEX
        columnno+=2;
        DEBUG_FOR_LAB4("EQUAL\t\t==\t"+to_string(yylineno)+"\t"+to_string(columnno-2));
    #else
        return EQUAL;
    #endif 
}

"<=" {
    #ifdef ONLY_FOR_LEX
        columnno+=2;
        DEBUG_FOR_LAB4("LESSOREQUAL\t\t<=\t"+to_string(yylineno)+"\t"+to_string(columnno-2));
    #else
        return LESSOREQUAL;
    #endif 
}
">=" {
    #ifdef ONLY_FOR_LEX
        columnno+=2;
        DEBUG_FOR_LAB4("MOREOREQUALE\t\t>=\t"+to_string(yylineno)+"\t"+to_string(columnno-2));
    #else
        return MOREOREQUALE;
    #endif 
}
"!=" {
    #ifdef ONLY_FOR_LEX
        columnno+=2;
        DEBUG_FOR_LAB4("UNEQUAL\t\t!=\t"+to_string(yylineno)+"\t"+to_string(columnno-2));
    #else
        return UNEQUAL;
    #endif 
}
"=" {
    #ifdef ONLY_FOR_LEX
        columnno+=1;
        DEBUG_FOR_LAB4("ASSIGN\t\t=\t"+to_string(yylineno)+"\t"+to_string(columnno-1));
    #else
        return ASSIGN;
    #endif
}
"!" {
    #ifdef ONLY_FOR_LEX
        columnno+=1;
        DEBUG_FOR_LAB4("AGAINST\t\t!\t"+to_string(yylineno)+"\t"+to_string(columnno-1));
    #else
        return AGAINST;
    #endif 
}

"<" {
    #ifdef ONLY_FOR_LEX
        columnno+=1;
        DEBUG_FOR_LAB4("LESS\t\t<\t"+to_string(yylineno)+"\t"+to_string(columnno-1));
    #else
        return LESS;
    #endif
}
">" {
    #ifdef ONLY_FOR_LEX
        columnno+=1;
        DEBUG_FOR_LAB4("MORE\t\t>\t"+to_string(yylineno)+"\t"+to_string(columnno-1));
    #else
        return MORE;
    #endif 
}
"+" {
    #ifdef ONLY_FOR_LEX
        columnno+=1;
        DEBUG_FOR_LAB4("ADD\t\t+\t"+to_string(yylineno)+"\t"+to_string(columnno-1));
    #else
        return ADD;
    #endif
}
"-" {
    #ifdef ONLY_FOR_LEX
        columnno+=1;
        DEBUG_FOR_LAB4("SUB\t\t-\t"+to_string(yylineno)+"\t"+to_string(columnno-1));
    #else
        return SUB;
    #endif
}
"*" {
    #ifdef ONLY_FOR_LEX
        columnno+=1;
        DEBUG_FOR_LAB4("MUL\t\t*\t"+to_string(yylineno)+"\t"+to_string(columnno-1));
    #else
        return MUL;
    #endif
}
"/" {
    #ifdef ONLY_FOR_LEX
        columnno+=1;
        DEBUG_FOR_LAB4("DIV\t\t/\t"+to_string(yylineno)+"\t"+to_string(columnno-1));
    #else
        return DIV;
    #endif
}
"%" {
    #ifdef ONLY_FOR_LEX
        columnno+=1;
        DEBUG_FOR_LAB4("MOD\t\t%\t"+to_string(yylineno)+"\t"+to_string(columnno-1));
    #else
        return MOD;
    #endif
}
"||" {
    #ifdef ONLY_FOR_LEX
        columnno+=2;
        DEBUG_FOR_LAB4("OR\t\t||\t"+to_string(yylineno)+"\t"+to_string(columnno-2));
    #else
        return OR;
    #endif
}
"&&" {
    #ifdef ONLY_FOR_LEX
        columnno+=2;
        DEBUG_FOR_LAB4("AND\t\t&&\t"+to_string(yylineno)+"\t"+to_string(columnno-2));
    #else
        return AND;
    #endif
}
"|" {
    #ifdef ONLY_FOR_LEX
        columnno+=1;
        DEBUG_FOR_LAB4("LOGIC_OR\t\t|\t"+to_string(yylineno)+"\t"+to_string(columnno-1));
    #else
        return LOGIC_OR;
    #endif
}
"&" {
    #ifdef ONLY_FOR_LEX
        columnno+=1;
        DEBUG_FOR_LAB4("LOGIC_AND\t\t&\t"+to_string(yylineno)+"\t"+to_string(columnno-1));
    #else
        return LOGIC_AND;
    #endif
}
";" {
    #ifdef ONLY_FOR_LEX
        columnno+=1;
        DEBUG_FOR_LAB4("SEMICOLON\t\t;\t"+to_string(yylineno)+"\t"+to_string(columnno-1));
    #else
        return SEMICOLON;
    #endif
}
"(" {
    #ifdef ONLY_FOR_LEX
        columnno+=1;
        DEBUG_FOR_LAB4("LPAREN\t\t(\t"+to_string(yylineno)+"\t"+to_string(columnno-1));
    #else
        return LPAREN;
    #endif
}
")" {
    #ifdef ONLY_FOR_LEX
        columnno+=1;
        DEBUG_FOR_LAB4("RPAREN\t\t)\t"+to_string(yylineno)+"\t"+to_string(columnno-1));
    #else
    return RPAREN;
    #endif
}
"{" {
    #ifdef ONLY_FOR_LEX
        columnno+=1;
        DEBUG_FOR_LAB4("LBRACE\t\t{\t"+to_string(yylineno)+"\t"+to_string(columnno-1));
        SymbolTable* newTable=new SymbolTable(currentTable);
        currentTable=newTable;
    #else
        return LBRACE;
    #endif
}
"}" {
    #ifdef ONLY_FOR_LEX
        columnno+=1;
        DEBUG_FOR_LAB4("RBRACE\t\t}\t"+to_string(yylineno)+"\t"+to_string(columnno-1));
        currentTable=currentTable->getPrev();
    #else
        return RBRACE;
    #endif
}
"[" {
    #ifdef ONLY_FOR_LEX
        string temp = "LSQUARE\t\t[\t" + to_string(yylineno)+"\t"+to_string(columnno);
        columnno+=1;
        DEBUG_FOR_LAB4(temp);
    #else
        return LSQUARE;
    #endif
}
"]" {
    #ifdef ONLY_FOR_LEX
        string temp = "RSQUARE\t\t]\t" + to_string(yylineno)+"\t"+to_string(columnno);
        columnno+=1;
        DEBUG_FOR_LAB4(temp);
    #else
        return RSQUARE;
    #endif
}

{EOL} {
    #ifdef ONLY_FOR_LEX
        columnno=0;
    #else
    #endif
}
{WHITE} {
    #ifdef ONLY_FOR_LEX
        columnno++;
    #else
    #endif
}
{HEX} {
    #ifdef ONLY_FOR_LEX
        string s=yytext;
        string temp="HEX\t\t"+s+"\t"+to_string(yylineno)+"\t"+to_string(columnno)+"\t"+to_string(changeStr2Num(s,"HEX"));
        columnno+=strlen(yytext);
        DEBUG_FOR_LAB4(temp);
    #else
        return HEX;
    #endif
}
{OCT} {
    #ifdef ONLY_FOR_LEX
        string s=yytext;
        string temp="OCT\t\t"+s+"\t"+to_string(yylineno)+"\t"+to_string(columnno)+"\t"+to_string(changeStr2Num(s,"OCT"));
        columnno+=strlen(yytext);
        DEBUG_FOR_LAB4(temp);
    #else
        return OCT;
    #endif
}
{DECIMIAL_INT} {
    #ifdef ONLY_FOR_LEX
        string a = yytext;
        string temp = "DECIMIAL_INT\t\t" + a + "\t" + to_string(yylineno)+"\t"+to_string(columnno)+"\t"+to_string(changeStr2Num(a,"NUM"));
        columnno+=strlen(yytext);
        DEBUG_FOR_LAB4(temp);
        //cout<<a<<" to num is:"<<changeStr2Num(a,"NUM")<<endl;
    #else 
        return DECIMIAL_INT;
    #endif
}
{DECIMIAL_FLOAT} {
    #ifdef ONLY_FOR_LEX
        string a = yytext;
        string temp = "DECIMIAL_FLOAT\t\t" + a + "\t" + to_string(yylineno)+"\t"+to_string(columnno)+"\t"+to_string(changeStr2Num(a,"NUM"));
        columnno+=strlen(yytext);
        DEBUG_FOR_LAB4(temp);
        //cout<<a<<" to num is:"<<changeStr2Num(a,"NUM")<<endl;
    #else 
        return DECIMIAL_FLOAT;
    #endif
}

{ID} {
    #ifdef ONLY_FOR_LEX
        string s=yytext;
        string temp;
        Symbol* addr;
        if(currentTable->lookUpSymbol(s)==nullptr)
            currentTable->addSymbol(s,new Symbol(currentTable));
        
        addr=currentTable->lookUpSymbol(s);
        temp="ID\t\t"+s+"\t"+to_string(yylineno)+"\t"+to_string(columnno)+"\t"+to_string(long((void*)addr));
        columnno+=strlen(yytext);
        DEBUG_FOR_LAB4(temp);
    #else
        return ID;
    #endif
}
%%

#ifdef ONLY_FOR_LEX
int main(int argc, char **argv){
    if(argc != 5){
        fprintf(stderr, "Argument Not Enough");
        exit(EXIT_FAILURE);
    }

    if(!(yyin = fopen(argv[1], "r"))){
        fprintf(stderr, "No such file or directory: %s", argv[1]);
        exit(EXIT_FAILURE);
    }

    if(!(yyout = fopen(argv[3], "w"))){
        fprintf(stderr, "No such file or directory: %s", argv[3]);
        exit(EXIT_FAILURE);
    }
    yylineno=1;
    yylex();
    return 0;
}

#endif
