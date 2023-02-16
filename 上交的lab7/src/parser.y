%code top{
    #include <iostream>
    #include <assert.h>
    #include <string>
    #include <stack>
    #include <cstring>
    #include "parser.h"
    extern Ast ast;
    int yylex();
    int yyerror(char const*);

    ArrayType* curArrayType;
    int idx;
    int* arrayValue;
    std::stack<ArrayInitList*> arrayStack;
    std::stack<StmtNode*> whileStack;
    ArrayInitList* top;
    int leftCnt = 0;
    int whileCnt = 0;
    int paramNo = 0;
}

%code requires {
    #include "Ast.h"
    #include "SymbolTable.h"
    #include "Type.h"
}

%union {
    int itype;
    char* strtype;
    StmtNode* stmttype;
    ExprNode* exprtype;
    Type* type;
    SymbolEntry* se;
}

%start Program
%token <strtype> ID
%token <itype> INTEGER
%token IF ELSE WHILE
%token INT VOID
%token LPAREN RPAREN LBRACE RBRACE LBRACKET RBRACKET COMMA  SEMICOLON 
%token ADD SUB MUL DIV MOD 
%token OR AND LESS LESSEQUAL GREAT GREATEQUAL ASSIGN EQUAL NOTEQUAL NOT
%token CONST
%token RETURN CONTINUE BREAK

%type<stmttype> Stmts Stmt AssignStmt ExprStmt BlockStmt IfStmt WhileStmt BreakStmt ContinueStmt ReturnStmt DeclStmt FuncDef ConstDeclStmt VarDeclStmt ConstDefList VarDef ConstDef VarDefList FuncFParam FuncFParams EmptyStmt
%type<exprtype> Exp AddExp Cond LOrExp PrimaryExp LVal RelExp LAndExp MulExp ConstExp EqExp UnaryExp InitVal ConstInitVal InitValList ConstInitValList FuncArrayIndices FuncRParams ArrayIndices
%type<type> Type

%precedence THEN
%precedence ELSE
%%
Program
    : Stmts {
        ast.setRoot($1);
    }
    ;
Stmts
    : Stmt {$$=$1;}
    | Stmts Stmt{
        $$ = new SeqNode($1, $2);
    }
    ;
// 语句也分很多种 赋值语句、表达式语句、语句块、if语句、while语句、break语句、continue语句、return语句、声明语句、函数语句
Stmt
    : AssignStmt {$$=$1;}
    | ExprStmt {$$ = $1;}
    | BlockStmt {$$=$1;}
    | EmptyStmt {$$ = $1;}
    | IfStmt {$$ = $1;}
    | WhileStmt {$$ = $1;}
    | BreakStmt {$$=$1;}
    | ContinueStmt {$$=$1;}
    | ReturnStmt {$$ = $1;}
    | DeclStmt {$$ = $1;}
    | FuncDef {$$ = $1;}
    ;
//左值表达式，暂时只包括id
LVal
    : ID {
        SymbolEntry* se;
        se = identifiers->lookup($1);
        if(se == nullptr)
            fprintf(stderr, "identifier \"%s\" is undefined\n", (char*)$1);
        Id *id= new Id(se);
        $$ = id;
        delete []$1;
    }
    | ID ArrayIndices{
        SymbolEntry* se;
        se = identifiers->lookup($1);
        if(se == nullptr)
            fprintf(stderr, "identifier \"%s\" is undefined\n", (char*)$1);
        Id *id= new Id(se, $2);
        $$ = id;
        delete []$1;
    }
    ; 
//赋值语句（给id赋值）
AssignStmt
    : LVal ASSIGN Exp SEMICOLON {
        $$ = new AssignStmt($1, $3);
    }
    ;
//表达式语句
ExprStmt
    : Exp SEMICOLON {
        $$ = new ExprStmt($1);
    }
    ;
//空语句
EmptyStmt
    : SEMICOLON {
        $$ = new EmptyStmt();
    }
    ;
//语句块 建立新的符号表
BlockStmt
    : LBRACE {
        identifiers = new SymbolTable(identifiers);
    } 
      Stmts RBRACE {
        $$ = new CompoundStmt($3);
        SymbolTable *currentSymbolTable = identifiers;
        identifiers = identifiers->getPrev();
        delete currentSymbolTable;
    }
    | LBRACE RBRACE {
        $$ = new CompoundStmt(nullptr);
    }
    ;
IfStmt
    : IF LPAREN Cond RPAREN Stmt %prec THEN {
        $$ = new IfStmt($3, $5);
    }
    | IF LPAREN Cond RPAREN Stmt ELSE Stmt {
        $$ = new IfElseStmt($3, $5, $7);
    }
    ;
WhileStmt
    : WHILE LPAREN Cond RPAREN {
        WhileStmt *whileStmt = new WhileStmt($3, nullptr);
        $<stmttype>$ = whileStmt;
        whileStack.push(whileStmt);
    }
    Stmt {
        StmtNode *whileStmt = $<stmttype>5; 
        ((WhileStmt*)whileStmt)->setStmt($6);
        $$=whileStmt;
        whileStack.pop();
    }
    ;
BreakStmt
    : BREAK SEMICOLON {
        if(whileStack.empty()){
            fprintf(stderr,"break stmt is not in a while stmt\n");
            assert(!whileStack.empty());
        }
        $$ = new BreakStmt(whileStack.top());
    }
    ;
ContinueStmt
    : CONTINUE SEMICOLON {
         if(whileStack.empty()){
            fprintf(stderr,"continue stmt is not in a while stmt\n");
            assert(!whileStack.empty());
        }
        $$ = new ContinueStmt(whileStack.top());
    }
    ;
ReturnStmt
    : RETURN SEMICOLON {
        $$ = new ReturnStmt();
    }
    | RETURN Exp SEMICOLON {
        $$ = new ReturnStmt($2);
    }
    ;
Exp
    :
    AddExp {$$ = $1;}
    ;
Cond
    :
    LOrExp {$$ = $1;}
    ;
PrimaryExp
    : LPAREN Exp RPAREN {
        $$ = $2;
    }
    | LVal {
        $$ = $1;
    }
    | INTEGER {
        SymbolEntry* se = new ConstantSymbolEntry(TypeSystem::intType, $1);
        $$ = new Constant(se);
    }
    ;
UnaryExp 
    : PrimaryExp {$$ = $1;}
    | ID LPAREN FuncRParams RPAREN {
        SymbolEntry* se;
        se = identifiers->lookup($1);
        if(se == nullptr)
        {
            fprintf(stderr, "function \"%s\" is undefined\n", (char*)$1);
            delete [](char*)$1;
            assert(se != nullptr);
        }

        //检查函数重命名
        /*
        std::vector<Type*> paramsType = ((FunctionType*)(se->getType()))->getParamsType();
        ExprNode* callParamsType = $3;
        int paramCount = 0;
        
        while(callParamsType){
            paramCount++;
            callParamsType = (ExprNode*)callParamsType->getNext();
        }
        
        while(se){
            if(((FunctionType*)(se->getType()))->getParamsType().size() == paramCount){
                break;
            }
            se = se->getNext();
        }
        if(se == nullptr){
            fprintf(stderr, "function \"%s\" having %d params, is undefined\n", (char*)$1, paramCount);
            delete [](char*)$1;
            assert(se != nullptr);
        }

        callParamsType = $3;

        for(auto &params:paramsType){
            if(params != callParamsType->getSymbolEntry()->getType()){
                 if(callParamsType->getSymbolEntry()->getType()->isArray() && params->isArray()){
                    callParamsType = (ExprNode*)callParamsType->getNext();
                    continue;
                }
                fprintf(stderr, "your param TYPE should be %s, but when you call func you use %s\n",
                        params->toStr().c_str(),callParamsType->getSymbolEntry()->getType()->toStr().c_str());
            }
            callParamsType = (ExprNode*)callParamsType->getNext();
        }
        */
        $$ = new FuncExpr(se, $3);
    }
    | ID LPAREN RPAREN {
        SymbolEntry* se;
        se = identifiers->lookup($1);
        if(se == nullptr)
        {
            fprintf(stderr, "function \"%s\" is undefined\n", (char*)$1);
            delete [](char*)$1;
            assert(se != nullptr);
        }
        $$ = new FuncExpr(se);
    }
    | ADD UnaryExp {
        $$ = $2;
    }
    | SUB UnaryExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new UnaryExpr(se, UnaryExpr::SUB, $2);
    }
    | NOT UnaryExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        $$ = new UnaryExpr(se, UnaryExpr::NOT, $2);
    }
    ;
AddExp
    : MulExp {
        $$ = $1;
    }
    | AddExp ADD MulExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::ADD, $1, $3);
    }
    | AddExp SUB MulExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::SUB, $1, $3);
    }
    ;
MulExp
    : UnaryExp {
        $$ = $1;
    }
    | MulExp MUL UnaryExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::MUL, $1, $3);
    }
    | MulExp DIV UnaryExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::DIV, $1, $3);
    }
    | MulExp MOD UnaryExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::MOD, $1, $3);
    }
    ;
RelExp
    : AddExp {
        $$ = $1;
    }
    | RelExp LESS AddExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::LESS, $1, $3);
    }
    | RelExp LESSEQUAL AddExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::LESSEQUAL, $1, $3);
    }
    | RelExp GREAT AddExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::GREAT, $1, $3);
    }
    | RelExp GREATEQUAL AddExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::GREATEQUAL, $1, $3);
    }
    ;
EqExp
    : RelExp {
        $$ = $1;
    }
    | EqExp EQUAL RelExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::EQUAL, $1, $3);
    }
    | EqExp NOTEQUAL RelExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::NOTEQUAL, $1, $3);
    }
    ;
LAndExp
    : EqExp {
        $$ = $1;
    }
    | LAndExp AND EqExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::AND, $1, $3);
    }
    ;
LOrExp
    : LAndExp {
        $$ = $1;
    }
    | LOrExp OR LAndExp {
        SymbolEntry* se = new TemporarySymbolEntry(TypeSystem::boolType, SymbolTable::getLabel());
        $$ = new BinaryExpr(se, BinaryExpr::OR, $1, $3);
    }
    ;
ConstExp
    : AddExp {
        $$ = $1;
    }
    ;
FuncRParams 
    : Exp {
        $$ = $1;
    }
    | FuncRParams COMMA Exp {
        $$ = $1;
        $$->setNext($3);
    }
Type
    : INT {
        $$ = TypeSystem::intType;
    }
    | VOID {
        $$ = TypeSystem::voidType;
    }
    ;
DeclStmt
    : ConstDeclStmt {$$ = $1;}
    | VarDeclStmt {$$ = $1;}
    ;
VarDeclStmt
    : Type VarDefList SEMICOLON {$$ = $2;}
    ;
ConstDeclStmt
    : CONST Type ConstDefList SEMICOLON {
        $$ = $3;
    }
    ;
VarDefList
    : VarDefList COMMA VarDef {
        $$ = $1;
        $1->setNext($3);
    } 
    | VarDef {$$ = $1;}
    ;
ConstDefList
    : ConstDefList COMMA ConstDef {
        $$ = $1;
        $1->setNext($3);
    }
    | ConstDef {$$ = $1;}
    ;
VarDef
    : ID {
        SymbolEntry* se;
        se = new IdentifierSymbolEntry(TypeSystem::intType, $1, identifiers->getLevel());
        if (!identifiers->install($1, se)){
            fprintf(stderr, "identifier \"%s\" is already defined\n", (char*)$1);
            assert(false);
        }
        $$ = new DeclStmt(new Id(se));
        delete []$1;
    }
    | ID ASSIGN InitVal {
        SymbolEntry* se = new IdentifierSymbolEntry(TypeSystem::intType, $1, identifiers->getLevel());
        if (!identifiers->install($1, se)){
            fprintf(stderr, "identifier \"%s\" is already defined\n", (char*)$1);
            assert(false);
        }
        //要setValue因为id可能是const的，看test案例有这种情况
        ((IdentifierSymbolEntry*)se)->setValue($3->getValue());
        $$ = new DeclStmt(new Id(se), $3);
        delete []$1;
    }
    | ID ArrayIndices {
        std::vector<int> dims;
        ExprNode* ary = $2;
        //计算出数组的维度
        while(ary){
            dims.push_back(ary->getValue());
            ary = (ExprNode*)(ary->getNext());
        }
        //得到正确的数组Type
        Type *type = TypeSystem::intType;
        Type* temp;
        while(!dims.empty()){
            temp = new ArrayType(type, dims.back());
            if(type->isArray())
                ((ArrayType*)type)->setArrayType(temp);
            type = temp;
            dims.pop_back();
        }
        curArrayType = (ArrayType*)type;
        
        SymbolEntry* se = new IdentifierSymbolEntry(type, $1, identifiers->getLevel());

        //因为没有初始化，让其初始值为all zero
        ((IdentifierSymbolEntry*)se)->setAllZero();
        int *p = new int[type->getSize()];
        ((IdentifierSymbolEntry*)se)->setArrayValue(p);

        if (!identifiers->install($1, se)){
            fprintf(stderr, "identifier \"%s\" is already defined\n", (char*)$1);
            assert(false);
        }
        $$ = new DeclStmt(new Id(se));
        delete []$1;
    }
    | ID ArrayIndices ASSIGN {
        std::vector<int> dims;
        ExprNode* ary = $2;
        //计算出数组的维度
        while(ary){
            dims.push_back(ary->getValue());
            ary = (ExprNode*)(ary->getNext());
        }

        //得到正确的数组Type
        Type* type = TypeSystem::intType;
        Type* temp;
        //我不知道这么写为什么不对
        // for(unsigned long int i=dims.size();i>=0;i--){
        //     temp = new ArrayType(type,dims[i]);
        //     if(type->isArray()){
        //         ((ArrayType*)type)->setArrayType(temp);
        //         type = temp;
        //     }else{
        //         type = temp;
        //     }
        // }
        // curArrayType = (ArrayType*)type;

        for(auto it = dims.rbegin(); it != dims.rend(); it++) {
            temp = new ArrayType(type, *it);
            if(type->isArray()){
                ((ArrayType*)type)->setArrayType(temp);
                type = temp;
            }else{
                type = temp;
            }
        }
        curArrayType = (ArrayType*)type;

        //计算偏移量，初始化
        idx = 0;
        while(!arrayStack.empty()){
            arrayStack.pop();
        }
        SymbolEntry* se = new IdentifierSymbolEntry(type, $1, identifiers->getLevel());
        $<se>$ = se;
        arrayValue = new int[curArrayType->getSize()];
    }
      InitVal {
         if(((ArrayInitList*)$5)->isEmpty())
            ((IdentifierSymbolEntry*)$<se>4)->setAllZero();

        ((IdentifierSymbolEntry*)$<se>4)->setArrayValue(arrayValue);
        if(!identifiers->install($1, $<se>4)){
            fprintf(stderr, "identifier \"%s\" is already defined\n", (char*)$1);
            assert(false);
        }
        $$ = new DeclStmt(new Id($<se>4), $5);
        delete []$1;
    }
    ;
ConstDef
    : ID ASSIGN ConstInitVal {
        SymbolEntry* se = new IdentifierSymbolEntry(TypeSystem::constIntType, $1, identifiers->getLevel());
        ((IdentifierSymbolEntry*)se)->setConst();
        if(!identifiers->install($1, se)){
            fprintf(stderr, "identifier \"%s\" is already defined\n", (char*)$1);
            assert(false);
        }
        ((IdentifierSymbolEntry*)se)->setValue($3->getValue());
        $$ = new DeclStmt(new Id(se), $3);
        delete []$1;
    }
    | ID ArrayIndices ASSIGN  {
        std::vector<int> dims;
        ExprNode* ary = $2;
        //计算出数组的维度
        while(ary){
            dims.push_back(ary->getValue());
            ary = (ExprNode*)(ary->getNext());
        }

        //得到正确的数组Type
        Type* type = TypeSystem::intType;
        Type* temp;
        for(auto it=dims.rbegin(); it != dims.rend(); it++) {
            temp = new ArrayType(type, *it);
            if(type->isArray()){
                ((ArrayType*)type)->setArrayType(temp);
                type = temp;
            }else{
                type = temp;
            }
        }
        curArrayType = (ArrayType*)type;

        //计算偏移量，初始化
        idx = 0;
        while(!arrayStack.empty()){
            arrayStack.pop();
        }
        SymbolEntry* se = new IdentifierSymbolEntry(type, $1, identifiers->getLevel());
        ((IdentifierSymbolEntry*)se)->setConst();
        $<se>$ = se;
        arrayValue = new int[curArrayType->getSize()];
    }
      ConstInitVal {
        ((IdentifierSymbolEntry*)$<se>4)->setArrayValue(arrayValue);
        if(!identifiers->install($1, $<se>4)){
            fprintf(stderr, "identifier \"%s\" is already defined\n", (char*)$1);
            assert(false);
        }
        $$ = new DeclStmt(new Id($<se>4), $5);
        delete []$1;
    } 
    ;
FuncArrayIndices 
    : LBRACKET RBRACKET {
        //函数里的数组参数，最后一维，一定是空
        $$ = new ExprNode(nullptr);
    }
    | FuncArrayIndices LBRACKET Exp RBRACKET {
        $$ = $1;
        $$->setNext($3);
    }
    ;
ArrayIndices
    : LBRACKET ConstExp RBRACKET {
        //一般的数组，括号里一定有数值
        $$ = $2;
    }
    | ArrayIndices LBRACKET ConstExp RBRACKET {
        $$ = $1;
        $1->setNext($3);
    }
    ;
InitValList
    : InitVal {
        $$ = $1;
    }
    | InitValList COMMA InitVal {
        $$ = $1;
    }
    ;
ConstInitValList
    : ConstInitVal {
        $$ = $1;
    }
    | ConstInitValList COMMA ConstInitVal {
        $$ = $1;
    }
    ;
InitVal 
    : Exp {
        $$ = $1;
        //数组初始化
        if(!arrayStack.empty()){
            arrayValue[idx++] = $1->getValue();
            Type* tempArr = arrayStack.top()->getSymbolEntry()->getType();
            if(tempArr == TypeSystem::intType || tempArr == TypeSystem::constIntType)
                arrayStack.top()->addChildExpr($1);
            else
                while(tempArr){
                    if(((ArrayType*)tempArr)->getElementType() != TypeSystem::intType && ((ArrayType*)tempArr)->getElementType() != TypeSystem::constIntType){
                        //数组套数组
                        tempArr = ((ArrayType*)tempArr)->getElementType();
                        SymbolEntry* se = new ConstantSymbolEntry(tempArr);
                        ArrayInitList* list = new ArrayInitList(se);
                        arrayStack.top()->addChildExpr(list);
                        arrayStack.push(list);
                    }else{
                        //里面是int,则pop到高一维的数组上
                        arrayStack.top()->addChildExpr($1);
                        while(arrayStack.top()->isFull() && arrayStack.size() != (long unsigned int)leftCnt){
                            tempArr = ((ArrayType*)tempArr)->getArrayType();
                            arrayStack.pop();
                        }
                        break;
                    }
                }
        }         
    }
    | LBRACE RBRACE {
        SymbolEntry* se;
        ExprNode* list;
        if(arrayStack.empty()){
            //直接全0
            memset(arrayValue, 0, curArrayType->getSize());
            //拿到数组的长度
            int len = curArrayType->getSize() / TypeSystem::intType->getSize();
            idx += len;
            //把数组添加到符号表
            se = new ConstantSymbolEntry(curArrayType);
            //list直接new出来一个数组类型然后将符号表项放进去
            list = new ArrayInitList(se);
        }else{
            //有初始化
            Type* type = ((ArrayType*)(arrayStack.top()->getSymbolEntry()->getType()))->getElementType();
            //同样也是把数组的长度拿到
            int len = type->getSize() / TypeSystem::intType->getSize();

            //有一些中间是0
            memset(arrayValue + idx, 0, type->getSize());
            idx += len;
            //因为只实现了int，所以就是int类型
            se = new ConstantSymbolEntry(type);
            //同理一个新类
            list = new ArrayInitList(se);
            //直接插入到语法树
            arrayStack.top()->addChildExpr(list);
            //如果说一层已经满了，就把他pop掉
            while(arrayStack.top()->isFull() && arrayStack.size() != (long unsigned int)leftCnt){
                arrayStack.pop();
            }
        }
        $$ = list;
    }
    | LBRACE {
        SymbolEntry* se;
        if(!arrayStack.empty())
            curArrayType = (ArrayType*)(((ArrayType*)(arrayStack.top()->getSymbolEntry()->getType()))->getElementType());
        se = new ConstantSymbolEntry(curArrayType);
        if(curArrayType->getElementType() != TypeSystem::intType){
            curArrayType = (ArrayType*)(curArrayType->getElementType());
        }
        ArrayInitList* expr = new ArrayInitList(se);
        if(!arrayStack.empty())
            arrayStack.top()->addChildExpr(expr);
        arrayStack.push(expr);
        $<exprtype>$ = expr;
        leftCnt++;
    } 
      InitValList RBRACE {
        leftCnt--;
        while(arrayStack.top() != $<exprtype>2 && arrayStack.size() > (long unsigned int)(leftCnt + 1))
            arrayStack.pop();
        if(arrayStack.top() == $<exprtype>2)
            arrayStack.pop();
        $$ = $<exprtype>2;
        if(!arrayStack.empty())
            while(arrayStack.top()->isFull() && arrayStack.size() != (long unsigned int)leftCnt){
                arrayStack.pop();
            }
        int size = ((ArrayType*)($$->getSymbolEntry()->getType()))->getSize()/ TypeSystem::intType->getSize();
        while(idx % size != 0)
            arrayValue[idx++] = 0;
        if(!arrayStack.empty())
            curArrayType = (ArrayType*)(((ArrayType*)(arrayStack.top()->getSymbolEntry()->getType()))->getElementType());
    }
    ;

ConstInitVal
    : ConstExp {
        $$ = $1;
        if(!arrayStack.empty()){
            arrayValue[idx++] = $1->getValue();
            Type* tempArr = arrayStack.top()->getSymbolEntry()->getType();
            if(tempArr == TypeSystem::constIntType)
                arrayStack.top()->addChildExpr($1);
            else
                while(tempArr){
                    if(((ArrayType*)tempArr)->getElementType() != TypeSystem::constIntType){
                        tempArr = ((ArrayType*)tempArr)->getElementType();
                        SymbolEntry* se = new ConstantSymbolEntry(tempArr);
                        ArrayInitList* list = new ArrayInitList(se);
                        arrayStack.top()->addChildExpr(list);
                        arrayStack.push(list);
                    }else{
                        arrayStack.top()->addChildExpr($1);
                        while(arrayStack.top()->isFull() && arrayStack.size() != (long unsigned int)leftCnt){
                            tempArr = ((ArrayType*)tempArr)->getArrayType();
                            arrayStack.pop();
                        }
                        break;
                    }
                }
        }
    }
    | LBRACE RBRACE {
        SymbolEntry* se;
        ExprNode* list;
        if(arrayStack.empty()){
            memset(arrayValue, 0, curArrayType->getSize());
            idx += curArrayType->getSize() / TypeSystem::constIntType->getSize();
            se = new ConstantSymbolEntry(curArrayType);
            list = new ArrayInitList(se);
        }else{
            Type* type = ((ArrayType*)(arrayStack.top()->getSymbolEntry()->getType()))->getElementType();
            int len = type->getSize() / TypeSystem::constIntType->getSize();
            memset(arrayValue + idx, 0, type->getSize());
            idx += len;
            se = new ConstantSymbolEntry(type);
            list = new ArrayInitList(se);
            arrayStack.top()->addChildExpr(list);
            while(arrayStack.top()->isFull() && arrayStack.size() != (long unsigned int)leftCnt){
                arrayStack.pop();
            }
        }
        $$ = list;
    }
    | LBRACE {
        SymbolEntry* se;
        if(!arrayStack.empty())
            curArrayType = (ArrayType*)(((ArrayType*)(arrayStack.top()->getSymbolEntry()->getType()))->getElementType());
        se = new ConstantSymbolEntry(curArrayType);
        if(curArrayType->getElementType() != TypeSystem::intType){
            curArrayType = (ArrayType*)(curArrayType->getElementType());
        }
        ArrayInitList* expr = new ArrayInitList(se);
        if(!arrayStack.empty())
            arrayStack.top()->addChildExpr(expr);
        arrayStack.push(expr);
        $<exprtype>$ = expr;
        leftCnt++;
    } 
      ConstInitValList RBRACE {
        leftCnt--;
        while(arrayStack.top() != $<exprtype>2 && arrayStack.size() > (long unsigned int)(leftCnt + 1))
            arrayStack.pop();
        if(arrayStack.top() == $<exprtype>2)
            arrayStack.pop();
        $$ = $<exprtype>2;
        if(!arrayStack.empty())
            while(arrayStack.top()->isFull() && arrayStack.size() != (long unsigned int)leftCnt){
                arrayStack.pop();
            }
        while(idx % (((ArrayType*)($$->getSymbolEntry()->getType()))->getSize()/ sizeof(int)) !=0 )
            arrayValue[idx++] = 0;
        if(!arrayStack.empty())
            curArrayType = (ArrayType*)(((ArrayType*)(arrayStack.top()->getSymbolEntry()->getType()))->getElementType());
    }
    ;

FuncDef
    :
    Type ID {
        //new func, new symbol table
        identifiers = new SymbolTable(identifiers);
        paramNo = 0;
    }
    LPAREN FuncFParams RPAREN {
        Type* funcType;
        std::vector<Type*> vec;
        std::vector<SymbolEntry*> se_vec;
        DeclStmt* temp = (DeclStmt*)$5;
        while(temp){
            vec.push_back(temp->getId()->getSymbolEntry()->getType());
            se_vec.push_back(temp->getId()->getSymbolEntry());
            temp = (DeclStmt*)(temp->getNext());
        }
        funcType = new FunctionType($1, vec, se_vec);
        SymbolEntry* se = new IdentifierSymbolEntry(funcType, $2, identifiers->getPrev()->getLevel());
        //在前一个symboltable里插入
        if(!identifiers->getPrev()->install($2, se)){
            fprintf(stderr, "redefinition func of \'%s %s\'\n", $2, se->getType()->toStr().c_str());
        }
        $<se>$ = se; 
    } 
    BlockStmt {
        $$ = new FunctionDef($<se>7, (DeclStmt*)$5, $8);
        SymbolTable* top = identifiers;
        identifiers = identifiers->getPrev();
        delete top;
        delete []$2;
    }
    ;
FuncFParams
    : FuncFParams COMMA FuncFParam {
        $$ = $1;
        $$->setNext($3);
    }
    | FuncFParam {
        $$ = $1;
    }
    | %empty {$$=nullptr;}
    ;
FuncFParam
    : Type ID {
        SymbolEntry* se;
        se = new IdentifierSymbolEntry($1, $2, identifiers->getLevel(), paramNo++);
        identifiers->install($2, se);
        ((IdentifierSymbolEntry*)se)->setLabel();
        ((IdentifierSymbolEntry*)se)->setAddr(new Operand(se));
        $$ = new DeclStmt(new Id(se));
        delete []$2;
    }
    | Type ID FuncArrayIndices {

        ExprNode* t=$3;
        std::vector<int> v;
        while(t!=nullptr){
            v.push_back(t->getValue());
            t=(ExprNode*)(t->getNext());
        }
        //数组基础数据类型
        Type*type=TypeSystem::intType;
        Type*temp;
        while(!v.empty()){
            //te用来接受最新的数组
            temp=new ArrayType(type,v.back());
            if(type->isArray()){
                //赋值给前一个数组
                ((ArrayType*)type)->setArrayType(temp);
            }
            type=temp;
            v.pop_back();
        }

        SymbolEntry* se = new IdentifierSymbolEntry(type, $2, identifiers->getLevel(), paramNo++);
        ((IdentifierSymbolEntry*)se)->setLabel();
        ((IdentifierSymbolEntry*)se)->setAddr(new Operand(se));
        identifiers->install($2, se);
        $$ = new DeclStmt(new Id(se));
        delete []$2;
    }
%%

int yyerror(char const* message)
{
    std::cerr<<message<<std::endl;
    return -1;
}
