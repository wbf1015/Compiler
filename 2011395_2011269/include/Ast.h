#ifndef __AST_H__
#define __AST_H__

#include <fstream>
#include <iostream>
#include <stack>
#include "Operand.h"
#include "Type.h"

class SymbolEntry;
class Unit;
class Function;
class BasicBlock;
class Instruction;
class IRBuilder;


class Node {
   private:
    static int counter;
    int seq;
    Node* next;

//add in Lab6
   protected:
    std::vector<Instruction*> true_list;
    std::vector<Instruction*> false_list;
    static IRBuilder* builder;
    void backPatch(std::vector<Instruction*>& list, BasicBlock* bb);
    std::vector<Instruction*> merge(std::vector<Instruction*>& list1, std::vector<Instruction*>& list2);

   public:
    Node(){
        seq = counter++;
        next = nullptr;
    }

    int getSeq() const { return seq; };
    static void setIRBuilder(IRBuilder* ib) { builder = ib; };
    virtual void output(int level) = 0;

    void setNext(Node* node){
        //push node to the last one
        Node* n = this;
        while (n->getNext()) {
            n = n->getNext();
        }
        if (n == this) {
            this->next = node;
        } else {
            n->setNext(node);
        }
    }
    Node* getNext() { return next; }

    virtual void typeCheck() = 0;
    virtual void genCode() = 0;
    std::vector<Instruction*>& trueList() { return true_list; }
    std::vector<Instruction*>& falseList() { return false_list; }
};

class ExprNode : public Node {
   private:
    int kind;

   protected:
    enum { EXPR, INITVALUELISTEXPR, INT2BOOL, UNARYEXPR };
    //储存该表达式的最终类型
    Type* type;
    
    SymbolEntry* symbolEntry;
    Operand* dst;  // The result of the subtree is stored into dst.

   public:
    ExprNode(SymbolEntry* symbolEntry, int kind = EXPR)
        : kind(kind), symbolEntry(symbolEntry){};
    Operand* getOperand() { return dst; };
    void output(int level);
    
    virtual int getValue() { return -1; };
    
    bool isArrayInitList() const { return kind == INITVALUELISTEXPR; };
    bool isUnaryExpr() const { return kind == UNARYEXPR; };

    SymbolEntry* getSymbolEntry() { return symbolEntry; };
    virtual Type* getType() { return type; };
    Type* getTopType() { return type; };

    virtual void typeCheck() { };
    void genCode();
};

class BinaryExpr : public ExprNode {
   private:
    int op;
    ExprNode *expr1, *expr2;

   public:
    enum {
        ADD, SUB, MUL, DIV, MOD, AND, OR, LESS, LESSEQUAL, GREAT, GREATEQUAL, EQUAL, NOTEQUAL
    };
    BinaryExpr(SymbolEntry* se, int op, ExprNode* expr1, ExprNode* expr2);
    void output(int level);
    int getValue();

    void typeCheck();
    void genCode();
};

class UnaryExpr : public ExprNode {
   private:
    int op;
    ExprNode* expr;

   public:
    enum { NOT, SUB, ADD };
    //这里单目ADD没用
    UnaryExpr(SymbolEntry* se, int op, ExprNode* expr);
    void output(int level);
    int getValue();
    void setType(Type* type) { this->type = type; };
    int getOp() const { return op; };

    void typeCheck();
    void genCode();
};
class Constant : public ExprNode {
   public:
    Constant(SymbolEntry* se) : ExprNode(se) { 
        dst = new Operand(se);
        type = TypeSystem::intType;
    };
    void output(int level);
    int getValue();

    void typeCheck();
    void genCode();
};

class Id : public ExprNode {
   private:
    ExprNode* arrayIndices;

    //used in Lab6 判断是否为左值
    bool left = false;

   public:
    Id(SymbolEntry* se, ExprNode* arrayIndices = nullptr): ExprNode(se), arrayIndices(arrayIndices) {
        if (se) {
            type = se->getType();
            if (type->isInt()) {
                SymbolEntry* temp = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
                dst = new Operand(temp);
            } else if (type->isArray()) {
                SymbolEntry* temp = new TemporarySymbolEntry(new PointerType(((ArrayType*)type)->getElementType()), SymbolTable::getLabel());
                dst = new Operand(temp);
            }
        }
    };
    void output(int level);
    int getValue();
    ExprNode* getArrIdx() { return arrayIndices; };
    Type* getType();
    bool isLeft() const { return left; };
    void setLeft() { left = true; }

    void typeCheck();
    void genCode();
    //自己加的
    int getZero(){return 0;}
};

class FuncExpr : public ExprNode {
   private:
    ExprNode* param;

   public:
    FuncExpr(SymbolEntry* se, ExprNode* param = nullptr): ExprNode(se), param(param) {
        dst = nullptr;
        if (se) {
            Type* type = symbolEntry->getType();
            //func ret type
            this->type = ((FunctionType*)type)->getRetType();

            if (this->type != TypeSystem::voidType) {
                SymbolEntry* se = new TemporarySymbolEntry(this->type, SymbolTable::getLabel());
                dst = new Operand(se);
            }
        }
    };
    void output(int level);

    void typeCheck();
    void genCode();
};

class ArrayInitList : public ExprNode {
   private:
    ExprNode* expr;
    int childExprCount;

   public:
    ArrayInitList(SymbolEntry* se, ExprNode* expr = nullptr): ExprNode(se, INITVALUELISTEXPR), expr(expr) {
        type = se->getType();
        childExprCount = 0;
    };
    void output(int level);
    ExprNode* getExpr() const { return expr; };
    void addChildExpr(ExprNode* expr);
    bool isEmpty() { return childExprCount == 0; };
    bool isFull();
    void paddingArray();

    void typeCheck();
    void genCode();
};

// int2bool 类型转换
class Int2BoolExpr : public ExprNode {
   private:
    ExprNode* expr;

   public:
    Int2BoolExpr(ExprNode* expr): ExprNode(nullptr, INT2BOOL), expr(expr) {
        type = TypeSystem::boolType;
        dst = new Operand(new TemporarySymbolEntry(type, SymbolTable::getLabel()));
    };
    void output(int level);
    ExprNode* getExpr() const { return expr; };
    void typeCheck() {};
    void genCode();
};

class StmtNode : public Node {
   private:
    int kind;

   protected:
    enum { IF, IFELSE, WHILE, COMPOUND, RETURN };

   public:
    StmtNode(int kind = -1) : kind(kind){};
    bool isIf() const { return kind == IF; };
    bool isIfElse() const {return kind == IFELSE;};
    bool isWhile() const { return kind == WHILE; };
    bool isCompound() const { return kind == COMPOUND; };
    bool isRETURN() const { return kind == RETURN; };
    
    virtual void typeCheck() = 0;
    virtual void genCode() = 0;
};
class CompoundStmt : public StmtNode {
   private:
    StmtNode* stmt;

   public:
    CompoundStmt(StmtNode* stmt = nullptr) : stmt(stmt){};
    void output(int level);
    void typeCheck();
    void genCode();
};

class SeqNode : public StmtNode {
   private:
    StmtNode *stmt1, *stmt2;

   public:
    SeqNode(StmtNode* stmt1, StmtNode* stmt2) : stmt1(stmt1), stmt2(stmt2){};
    void output(int level);

    void typeCheck();
    void genCode();
};

class DeclStmt : public StmtNode {
   private:
    Id* id;
    ExprNode* expr;

   public:
    DeclStmt(Id* id, ExprNode* expr = nullptr) : id(id) {
        if (expr) {
            this->expr = expr;
            if (expr->isArrayInitList()){
                ((ArrayInitList*)(this->expr))->paddingArray();
            }
        }
    };
    void output(int level);
    Id* getId() { return id; };
    void typeCheck();
    void genCode();
    Function * getFun(){return nullptr;}
    void addZero(std::vector<int>&vi,int n){
        for(int i=1;i<=n;i++){
            vi.push_back(0);
        }
    }
    int getvi(std::vector<int>&vi,unsigned long int n){
        if(n<0||n>=vi.size()){return -1;}
        else{
            return vi[n];
        }
    }
};

class IfStmt : public StmtNode {
   private:
    ExprNode* cond;
    StmtNode* thenStmt;

   public:
    IfStmt(ExprNode* cond, StmtNode* thenStmt)
        : cond(cond), thenStmt(thenStmt) {
        if (cond->getType()->isInt() && cond->getType()->getSize() == 32) {
            Int2BoolExpr* temp = new Int2BoolExpr(cond);
            this->cond = temp;
        }
    };
    void output(int level);
    void typeCheck();
    void genCode();
};

class IfElseStmt : public StmtNode {
   private:
    ExprNode* cond;
    StmtNode* thenStmt;
    StmtNode* elseStmt;

   public:
    IfElseStmt(ExprNode* cond, StmtNode* thenStmt, StmtNode* elseStmt)
        : cond(cond), thenStmt(thenStmt), elseStmt(elseStmt) {
        if (cond->getType()->isInt() && cond->getType()->getSize() == 32) {
            Int2BoolExpr* temp = new Int2BoolExpr(cond);
            this->cond = temp;
        }
    };
    void output(int level);
    void typeCheck();
    void genCode();
};

class WhileStmt : public StmtNode {
   private:
    ExprNode* cond;
    StmtNode* stmt;
    BasicBlock* cond_bb;
    BasicBlock* end_bb;
   public:
    WhileStmt(ExprNode* cond, StmtNode* stmt=nullptr) : cond(cond), stmt(stmt) {
        if (cond->getType()->isInt() && cond->getType()->getSize() == 32) {
            Int2BoolExpr* temp = new Int2BoolExpr(cond);
            this->cond = temp;
        }
    };
    void setStmt(StmtNode* stmt){this->stmt = stmt;};
    void output(int level);
    void typeCheck();
    void genCode();
    BasicBlock* get_cond_bb(){return this->cond_bb;};
    BasicBlock* get_end_bb(){return this->end_bb;};
    void setCondBB(BasicBlock* bb){this->cond_bb = bb;};
    void setEndBB(BasicBlock* bb){this->end_bb = bb;};  
};

class BreakStmt : public StmtNode {
    private:
    StmtNode * whileStmt;
   public:
    BreakStmt(StmtNode* whileStmt){this->whileStmt=whileStmt;};
    void output(int level);
    void typeCheck();
    void genCode();
};

class ContinueStmt : public StmtNode {
    private:
    StmtNode *whileStmt;
   public:
    ContinueStmt(StmtNode* whileStmt){this->whileStmt=whileStmt;};
    void output(int level);
    void typeCheck();
    void genCode();
};

class ReturnStmt : public StmtNode {
   private:
    ExprNode* retValue;

   public:
    ReturnStmt(ExprNode* retValue = nullptr) : retValue(retValue){};
    void output(int level);
    void typeCheck();
    void genCode();
};

class AssignStmt : public StmtNode {
   private:
    ExprNode* lval;
    ExprNode* expr;

   public:
    AssignStmt(ExprNode* lval, ExprNode* expr): lval(lval), expr(expr) {
        Type* type = ((Id*)lval)->getType();
        if (type->isInt()) {
            if (((IntType*)type)->isConst()) {
                fprintf(stderr,"cannot assign to const\n");
                assert(0);
            }
        }
    };
    void output(int level);
    void typeCheck();
    void genCode();
};

class ExprStmt : public StmtNode {
   private:
    ExprNode* expr;

   public:
    ExprStmt(ExprNode* expr) : expr(expr){};
    void output(int level);
    void typeCheck();
    void genCode();
};

//没用的空语句
class EmptyStmt : public StmtNode {
   public:
    EmptyStmt(){};
    void output(int level){};

    void typeCheck(){};
    void genCode(){};
};

class FunctionDef : public StmtNode {
   private:
    SymbolEntry* se;
    DeclStmt* decl;
    StmtNode* stmt;

   public:
    FunctionDef(SymbolEntry* se, DeclStmt* decl, StmtNode* stmt): se(se), decl(decl), stmt(stmt){};
    void output(int level);
    SymbolEntry* getSymbolEntry() { return se; };

    void typeCheck();
    void genCode();
};

class Ast {
   private:
    Node* root;
   public:
    Ast() { root = nullptr; }
    void setRoot(Node* n) { root = n; }
    void output();

    void typeCheck();
    void genCode(Unit* unit);
};
#endif
