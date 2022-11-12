#ifndef __AST_H__
#define __AST_H__

#include <fstream>
#include "SymbolTable.h"
#include "Type.h"

class SymbolEntry; //每一个符号项
class Type; //类型

class Node //抽象语法树的节点
{
private:
    static int counter; //不懂干啥用的
    int seq; //不懂干啥用的
    Node* next;//递归时使用

public:
    Node();
    int getSeq() const {return seq;};
    virtual void output(int level) = 0;
    //暂时把这句注释掉，实现一个把新插入进来的插到最后面的方式
    //void setNext(Node *next){this->next=next;};
    void setNext(Node *next);
    Node *getNext(){return this->next;};
};

class ExprNode : public Node
{
protected:
    SymbolEntry *symbolEntry;

public:
    ExprNode(SymbolEntry *symbolEntry) : symbolEntry(symbolEntry){};
    Type* getType();
    SymbolEntry *getSymbolEntry(){return symbolEntry;}
    int getIValue(){return 0;}
    float getFValue(){return 0.0;}
};

class UnaryExpr : public ExprNode
{
private:
    int op;
    ExprNode *expr;
public:
    enum {SUB,ADD,NOT};
    UnaryExpr(SymbolEntry *se, int op, ExprNode *expr) : ExprNode(se), op(op), expr(expr){};
    void output(int level);
    int getIValue();
    float getFValue();
};

class FuncExpr : public ExprNode {
   private:
    ExprNode* param;

   public:
    FuncExpr(SymbolEntry* se, ExprNode* param = nullptr)
        : ExprNode(se), param(param){};
    void output(int level);
    //不知道咋写
    int getIValue(){return 0;};
    float getFValue(){return 0.0;};
};


class BinaryExpr : public ExprNode
{
private:
    int op;
    ExprNode *expr1, *expr2;
public:
    enum {ADD, SUB, MUL, DIV, MOD, 
    AND, OR, LOGIC_AND, LOGIC_OR,
    MORE, LESS, MOREOREQUAL, LESSOREQUAL, EQUAL, UNEQUAL};
    BinaryExpr(SymbolEntry *se, int op, ExprNode*expr1, ExprNode*expr2) : ExprNode(se), op(op), expr1(expr1), expr2(expr2){};
    void output(int level);
    int getIValue();
    float getFValue();
};

class Constant : public ExprNode
{
public:
    Constant(SymbolEntry *se) : ExprNode(se){};
    int getvalue(){return ((ConstantSymbolEntry*)symbolEntry)->getValue(); }
    void output(int level);
    int getIValue();
    float getFValue();
};

//ID类，存储变量用的，他是继承了表达式节点
class Id : public ExprNode
{
public:
    Id(SymbolEntry *se) : ExprNode(se){};
    SymbolEntry* getSymbolEntry(){return symbolEntry;};
    void output(int level);
    std::string getValue(){return symbolEntry->toStr();}
    int getIValue(){return (int)getFValue();};
    float getFValue(){
        SymbolTable* nowTable=identifiers;
        while(identifiers){
            if(identifiers->lookup(getValue())){
                return ((IdentifierSymbolEntry*)(identifiers->lookup(getValue())))->getValue();
            }
            else{
                nowTable=nowTable->getPrev();
            }
        }
        return 0.0;//这里就是没找到，但不知道该怎么处理
    }
};

class ArrayInit : public ExprNode
{
private:
    ExprNode* expr;
    int childExprCount;
    bool isFullZero;
public:
    ArrayInit(SymbolEntry* se):ExprNode(se) {
            childExprCount=0;
            expr=nullptr;
            isFullZero=true;
    };
    void output(int level);
    ExprNode* getExpr() const { return expr; };
    void addExpr(ExprNode* expr);
    bool isFull();
};

class StmtNode : public Node{};

class CompoundStmt : public StmtNode
{
private:
    StmtNode *stmt;
public:
    CompoundStmt(StmtNode *stmt) : stmt(stmt) {};
    void output(int level);
};

class SeqNode : public StmtNode
{
private:
    StmtNode *stmt1, *stmt2;
public:
    SeqNode(StmtNode *stmt1, StmtNode *stmt2) : stmt1(stmt1), stmt2(stmt2){};
    void output(int level);
};

class DeclStmt : public StmtNode
{
private:
    Id *id; //一个声明语句肯定会有一个新的变量，存储这个变量
    ExprNode *expr;  //这个是ID的值
public:
    DeclStmt(Id *id, ExprNode*expr=nullptr) : id(id), expr(expr){};
    Id* getId(){return id;}
    void output(int level);
};

class IfStmt : public StmtNode
{
private:
    ExprNode *cond;
    StmtNode *thenStmt;
public:
    IfStmt(ExprNode *cond, StmtNode *thenStmt) : cond(cond), thenStmt(thenStmt){};
    void output(int level);
};

class IfElseStmt : public StmtNode
{
private:
    ExprNode *cond;
    StmtNode *thenStmt;
    StmtNode *elseStmt;
public:
    IfElseStmt(ExprNode *cond, StmtNode *thenStmt, StmtNode *elseStmt) : cond(cond), thenStmt(thenStmt), elseStmt(elseStmt) {};
    void output(int level);
};

class WhileStmt : public StmtNode
{
private:
    ExprNode *cond;
    StmtNode *stmt;
public:
    WhileStmt(ExprNode *cond, StmtNode *stmt) : cond(cond), stmt(stmt){};
    void output(int level);
};

class BreakStmt : public StmtNode {
    public:
        BreakStmt(){};
        void output(int level);
};

class ContinueStmt : public StmtNode {
   public:
    ContinueStmt(){};
    void output(int level);
};

class ReturnStmt : public StmtNode
{
private:
    ExprNode *retValue;
public:
    ReturnStmt(ExprNode*retValue=nullptr) : retValue(retValue) {};
    void output(int level);
};

class AssignStmt : public StmtNode
{
private:
    ExprNode *lval;
    ExprNode *expr;
public:
    AssignStmt(ExprNode *lval, ExprNode *expr) : lval(lval), expr(expr) {};
    void output(int level);
};

class ExprStmt : public StmtNode {
   private:
    ExprNode* expr;

   public:
    ExprStmt(ExprNode* expr) : expr(expr){};
    void output(int level);
};

class FunctionDef : public StmtNode
{
private:
    SymbolEntry* se;
    // 参数的定义 next连接
    DeclStmt* decl;
    StmtNode* stmt;

   public:
    FunctionDef(SymbolEntry* se, DeclStmt* decl, StmtNode* stmt)
        : se(se), decl(decl), stmt(stmt){};
    void output(int level);
};

class Ast
{
private:
    Node* root;
public:
    Ast() {root = nullptr;}
    void setRoot(Node*n) {root = n;}
    void output();
};

#endif
