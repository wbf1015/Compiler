%option noyywrap
%{
    #define YY_NO_UNPUT
    #define YY_NO_INPUT

    #include "parser.h"
    #include "Unit.h"
    #include <ostream>
    #include <fstream>
    using namespace std;
    extern FILE *yyin; 
    extern Unit unit;
    extern FILE *yyout;
    extern bool dump_tokens;

    void DEBUG_FOR_LAB4(std::string s){
        std::string DEBUG_INFO = "[DEBUG LAB4]: \t" + s + "\n";
        fputs(DEBUG_INFO.c_str(), yyout);
    }
%}


HEX (0[xX][0-9a-fA-F]+)
OCT (0[0-7]+)
DECIMIAL_INT ([1-9][0-9]*|0)
ID [[:alpha:]_][[:alpha:][:digit:]_]*
EOL (\r\n|\n|\r)
WHITE [\t ]
COMMENTLINE (\/\/.*)
COMMENTBEGIN "/*"
COMMENTELEMENT (.|\n)
COMMENTEND "*/"
%x BLOCKCOMMENT

%%
{COMMENTLINE} {}
{COMMENTBEGIN} {BEGIN BLOCKCOMMENT;}
<BLOCKCOMMENT>{COMMENTELEMENT} {}
<BLOCKCOMMENT>{COMMENTEND} {BEGIN INITIAL;}
"int" {
    /*
    * Questions: 
    *   Q1: Why we need to return INT in further labs?
    *   Q2: What is "INT" actually?
    */
    if(dump_tokens)
        DEBUG_FOR_LAB4("INT\tint");

    return INT;
}
"void" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("VOID\tvoid");
    
    return VOID;
}
"if" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("IF\tif");
    
    return IF;
};
"else" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("ELSE\telse");
    
    return ELSE;
};
"while" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("WHILE\twhile");
    
    return WHILE;
}
"break" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("BREAK\tbreak");
    
    return BREAK;
}
"continue" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("CONTINUE\tcontinue");
    
    return CONTINUE;
}
"const" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("CONST\tconst");
    
    return CONST;
};
"return" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("RETURN\treturn");
    
    return RETURN;
}
"&&" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("AND\t&&");
    
    return AND;
}
"||" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("OR\t||");
    
    return OR;
}
"==" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("EQUAL\t==");
    
    return EQUAL;
}
"!=" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("NOTEQUAL\t!=");
    
    return NOTEQUAL;
}
"=" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("ASSIGN\t=");
    
    return ASSIGN;
}
"<" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("LESS\t<");
    
    return LESS;
}
"<=" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("LESSEQUAL\t<");
    
    return LESSEQUAL;
}
">" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("GREAT\t<");
    
    return GREAT;
}
">=" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("GREATEQUAL\t<");
    
    return GREATEQUAL;
}
"!" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("NOT\t!");
    
    return NOT;
}
"+" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("ADD\t+");
    
    return ADD;
}
"-" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("SUB\t-");
    
    return SUB;
}
"*" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("MUL\t*");
    
    return MUL;
}
"/" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("DIV\t/");
    
    return DIV;
}
"%" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("MOD\t%");
    
    return MOD;
}
"(" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("LPAREN\t(");
    
    return LPAREN;
}
")" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("RPAREN\t)");
    
    return RPAREN;
}
"{" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("LBRACE\t{");
    
    return LBRACE;
}
"}" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("RBRACE\t}");
    
    return RBRACE;
}
"[" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("LBRACKET\t[");
    
    return LBRACKET;
}
"]" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("RBRACKET\t}");
    
    return RBRACKET;
}
"," {
    if(dump_tokens)
        DEBUG_FOR_LAB4("COMMA\t,");
    
    return COMMA;
}
";" {
    if(dump_tokens)
        DEBUG_FOR_LAB4("SEMICOLON\t;");
    
    return SEMICOLON;
}
{DECIMIAL_INT} {
    if(dump_tokens)
        DEBUG_FOR_LAB4(string("DECIMIAL_INT\t")+string(yytext));
    yylval.itype = atoi(yytext);
    return INTEGER;
}
{OCT} {
    int num;
    sscanf(yytext, "%o", &num);
    if(dump_tokens)
        DEBUG_FOR_LAB4(string("NUMBER\t") + to_string(num));
    yylval.itype = num;
    return INTEGER;
}
{HEX} {
    int num;
    sscanf(yytext, "%x", &num);
    if(dump_tokens)
        DEBUG_FOR_LAB4(string("NUMBER\t") + to_string(num));
    yylval.itype = num;
    return INTEGER;
}
"putint" {
    if(dump_tokens)
        DEBUG_FOR_LAB4(yytext);
    char *lexeme;
    lexeme = new char[strlen(yytext) + 1];
    strcpy(lexeme, yytext);
    yylval.strtype = lexeme;
    std::vector<Type*> vec;
    std::vector<SymbolEntry*> se_vec;
    vec.push_back(TypeSystem::intType);
    Type* funcType = new FunctionType(TypeSystem::voidType, vec,se_vec);
    SymbolTable* st = identifiers;
    while(st->getPrev())
        st = st->getPrev();
    SymbolEntry* se = new IdentifierSymbolEntry(funcType, yytext, st->getLevel(), -1, true);
    if(st->install(yytext, se))
        unit.insertDeclare(se);
    return ID;
}
"getint" {
    if(dump_tokens)
        DEBUG_FOR_LAB4(yytext);
    char *lexeme;
    lexeme = new char[strlen(yytext) + 1];
    strcpy(lexeme, yytext);
    yylval.strtype = lexeme;
    std::vector<Type*> vec;
    std::vector<SymbolEntry*> se_vec;
    Type* funcType = new FunctionType(TypeSystem::intType, vec,se_vec);
    SymbolTable* st = identifiers;
    while(st->getPrev())
        st = st->getPrev();
    SymbolEntry* se = new IdentifierSymbolEntry(funcType, yytext, st->getLevel(), -1, true);
    if(st->install(yytext, se))
        unit.insertDeclare(se);
    return ID;
}
"putch" {
    if(dump_tokens)
        DEBUG_FOR_LAB4(yytext);
    char *lexeme;
    lexeme = new char[strlen(yytext) + 1];
    strcpy(lexeme, yytext);
    yylval.strtype = lexeme;
    std::vector<Type*> vec;
    std::vector<SymbolEntry*> se_vec;
    vec.push_back(TypeSystem::intType);
    Type* funcType = new FunctionType(TypeSystem::voidType, vec,se_vec);
    SymbolTable* st = identifiers;
    while(st->getPrev())
        st = st->getPrev();
    SymbolEntry* se = new IdentifierSymbolEntry(funcType, yytext, st->getLevel(), -1, true);
    if(st->install(yytext, se))
        unit.insertDeclare(se);
    return ID;
}
"getch" {
    if(dump_tokens)
        DEBUG_FOR_LAB4(yytext);
    char *lexeme;
    lexeme = new char[strlen(yytext) + 1];
    strcpy(lexeme, yytext);
    yylval.strtype = lexeme;
    std::vector<Type*> vec;
    std::vector<SymbolEntry*> se_vec;
    Type* funcType = new FunctionType(TypeSystem::intType, vec,se_vec);
    SymbolTable* st = identifiers;
    while(st->getPrev())
        st = st->getPrev();
    SymbolEntry* se = new IdentifierSymbolEntry(funcType, yytext, st->getLevel(), -1, true);
    if(st->install(yytext, se))
        unit.insertDeclare(se);
    return ID;
}

"putarray" {
    if(dump_tokens)
        DEBUG_FOR_LAB4(yytext);
    char *lexeme;
    lexeme = new char[strlen(yytext) + 1];
    strcpy(lexeme, yytext);
    yylval.strtype = lexeme;
    std::vector<Type*> vec;
    std::vector<SymbolEntry*> se_vec;
    vec.push_back(TypeSystem::intType);
    ArrayType* arr = new ArrayType(TypeSystem::intType, -1);
    vec.push_back(arr);
    Type* funcType = new FunctionType(TypeSystem::voidType, vec,se_vec);
    SymbolTable* st = identifiers;
    while(st->getPrev())
        st = st->getPrev();
    SymbolEntry* se = new IdentifierSymbolEntry(funcType, yytext, st->getLevel(), -1, true);
    if(st->install(yytext, se))
        unit.insertDeclare(se);
    return ID;
}

"getarray" {
    if(dump_tokens)
        DEBUG_FOR_LAB4(yytext);
    char *lexeme;
    lexeme = new char[strlen(yytext) + 1];
    strcpy(lexeme, yytext);
    yylval.strtype = lexeme;
    std::vector<Type*> vec;
    std::vector<SymbolEntry*> se_vec;
    ArrayType* arr = new ArrayType(TypeSystem::intType, -1);
    vec.push_back(arr);
    Type* funcType = new FunctionType(TypeSystem::intType, vec,se_vec);
    SymbolTable* st = identifiers;
    while(st->getPrev())
        st = st->getPrev();
    SymbolEntry* se = new IdentifierSymbolEntry(funcType, yytext, st->getLevel(), -1, true);
    if(st->install(yytext, se))
        unit.insertDeclare(se);
    return ID;
}

"putf" {
    if(dump_tokens)
        DEBUG_FOR_LAB4(yytext);
    char *lexeme;
    lexeme = new char[strlen(yytext) + 1];
    strcpy(lexeme, yytext);
    yylval.strtype = lexeme;
    std::vector<Type*> vec;
    std::vector<SymbolEntry*> se_vec;
    StringType* str = new StringType(0);
    vec.push_back(str);
    Type* funcType = new FunctionType(TypeSystem::voidType, vec,se_vec);
    SymbolTable* st = identifiers;
    while(st->getPrev())
        st = st->getPrev();
    SymbolEntry* se = new IdentifierSymbolEntry(funcType, yytext, st->getLevel(), -1, true);
    if(st->install(yytext, se))
        unit.insertDeclare(se);
    return ID;
}
"starttime" {
    if(dump_tokens)
        DEBUG_FOR_LAB4(yytext);
    char *lexeme;
    lexeme = new char[6 + strlen(yytext) + 1];
    char* sysy = (char *)"_sysy_";
    strcpy(lexeme, sysy);
    strcpy(lexeme + 6, yytext);
    yylval.strtype = lexeme;
    std::vector<Type*> vec;
    std::vector<SymbolEntry*> se_vec;
    Type* funcType = new FunctionType(TypeSystem::voidType, vec,se_vec);
    SymbolTable* st = identifiers;
    while(st->getPrev())
        st = st->getPrev();
    char *num = new char[6+strlen(yytext)];
    memcpy(num, lexeme, 6+strlen(yytext));
    SymbolEntry* se = new IdentifierSymbolEntry(funcType, num, st->getLevel(), -1, true);
    if(st->install(yytext, se))
        unit.insertDeclare(se);
    return ID;
}
"stoptime" {
    if(dump_tokens)
        DEBUG_FOR_LAB4(yytext);
    char *lexeme;
    lexeme = new char[6 + strlen(yytext) + 1];
    char* sysy = (char*)"_sysy_";
    strcpy(lexeme, sysy);
    strcpy(lexeme + 6, yytext);
    yylval.strtype = lexeme;
    std::vector<Type*> vec;
    std::vector<SymbolEntry*> se_vec;
    Type* funcType = new FunctionType(TypeSystem::voidType, vec,se_vec);
    SymbolTable* st = identifiers;
    while(st->getPrev())
        st = st->getPrev();
    char *num = new char[6+strlen(yytext)];
    memcpy(num, lexeme, 14);
    SymbolEntry* se = new IdentifierSymbolEntry(funcType, num, st->getLevel(), -1, true);
    if(st->install(yytext, se))
        unit.insertDeclare(se);
    return ID;
}

{ID} {
    if(dump_tokens)
        DEBUG_FOR_LAB4(yytext);
    char *lexeme;
    lexeme = new char[strlen(yytext) + 1];
    strcpy(lexeme, yytext);
    yylval.strtype = lexeme;
    return ID;
}
<*>{EOL} {yylineno++;}
{WHITE}

%%
