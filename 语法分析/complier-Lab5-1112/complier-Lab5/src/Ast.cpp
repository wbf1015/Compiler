#include "Ast.h"
#include "SymbolTable.h"
#include <string>
#include "Type.h"

extern FILE *yyout;
int Node::counter = 0;

Node::Node()
{
    seq = counter++;
}

void Node::setNext(Node* node) {
    //要把node加到最后去 这里有点疑惑，还是在.h中把原来的setnext也保留了
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

void Ast::output()
{
    fprintf(yyout, "program\n");
    if(root != nullptr)
        root->output(4);
}

Type* ExprNode::getType(){
    return this->symbolEntry->getType();
}

void UnaryExpr::output(int level) {
    std::string op_str;
    switch (op) {
        case NOT:
            op_str = "not";
            break;
        case SUB:
            op_str = "minus";
            break;
        case ADD:
            op_str = "add";    
    }
    fprintf(yyout, "%*cUnaryExpr\top: %s\n", level, ' ', op_str.c_str());
    expr->output(level + 4);
}

int UnaryExpr::getIValue() {
    int v;
    switch(op) {
        case NOT :
            v=!(expr->getIValue());
            break;
        case SUB:
            v=-(expr->getIValue());
            break;
        case ADD:
            v=+(expr->getIValue());
            break;
    }
    return v;
}

float UnaryExpr::getFValue() {
    float v;
    switch(op) {
        case NOT :
            v=!(expr->getFValue());
            break;
        case SUB:
            v=-(expr->getFValue());
            break;
        case ADD:
            v=+(expr->getFValue());
            break;
    }
    return v;
}

void FuncExpr::output(int level) {
    std::string name, type;
    int scope;
    name = symbolEntry->toStr();
    type = symbolEntry->getType()->toStr();
    scope = dynamic_cast<IdentifierSymbolEntry*>(symbolEntry)->getScope();
    fprintf(yyout, "%*cCallExpr\tfunction name: %s\tscope: %d\ttype: %s\n",
            level, ' ', name.c_str(), scope, type.c_str());
    Node* temp = param;
    while (temp) {
        temp->output(level + 4);
        temp = temp->getNext();
    }
}

void BinaryExpr::output(int level)
{
    std::string op_str;
    switch(op)
    {
        case ADD:
            op_str = "add";
            break;
        case SUB:
            op_str = "sub";
            break;
        case DIV:
            op_str = "div";
            break;
        case MUL:
            op_str = "mul";
            break;
        case MOD:
            op_str = "mod";
            break;
        case LOGIC_AND:
            op_str = "logic and";
            break;
        case LOGIC_OR:
            op_str = "logic and";
            break;
        case AND:
            op_str = "and";
            break;
        case OR:
            op_str = "or";
            break;
        case LESS:
            op_str = "less";
            break;
        case LESSOREQUAL:
            op_str="lessORequal";
            break;
        case MORE:
            op_str = "more";
            break;
        case MOREOREQUAL:
            op_str = "moreOrequal";
            break;
        case EQUAL:
            op_str = "equal";
            break;
        case UNEQUAL:
            op_str = "unequal";
            break;
        
        
    }
    fprintf(yyout, "%*cBinaryExpr\top: %s\n", level, ' ', op_str.c_str());
    expr1->output(level + 4);
    expr2->output(level + 4);
}

int BinaryExpr::getIValue(){
    int v;
    switch(op){
        case ADD:
            v=expr1->getIValue() + expr2->getIValue();
            break;
        case SUB:
            v=expr1->getIValue() - expr2->getIValue();
            break;
        case MUL:
            v=expr1->getIValue() * expr2->getIValue();
            break;
        case DIV:
            v=expr1->getIValue() / expr2->getIValue();
            break;
        case MOD:
            v=expr1->getIValue() % expr2->getIValue();
            break;
        case LOGIC_AND:
            v=expr1->getIValue() && expr2->getIValue();
            break;
        case LOGIC_OR:
            v=expr1->getIValue() || expr2->getIValue();
            break;
        case LESS:
            v=expr1->getIValue() < expr2->getIValue();
            break;
        case LESSOREQUAL:
            v=expr1->getIValue() <= expr2->getIValue();
            break;
        case MORE:
            v=expr1->getIValue() > expr2->getIValue();
            break;
        case MOREOREQUAL:
            v=expr1->getIValue() >= expr2->getIValue();
            break;
        case EQUAL:
            v=expr1->getIValue() == expr2->getIValue();
            break;
        case UNEQUAL:
            v=expr1->getIValue() != expr2->getIValue();
            break;
    }
    return v;
}

float BinaryExpr::getFValue(){
    float v;
    switch(op){
        case ADD:
            v=expr1->getFValue() + expr2->getFValue();
            break;
        case SUB:
            v=expr1->getFValue() - expr2->getFValue();
            break;
        case MUL:
            v=expr1->getFValue() * expr2->getFValue();
            break;
        case DIV:
            v=expr1->getFValue() / expr2->getFValue();
            break;
        case MOD:
            //这里c++要求只能是整数，所以强行取整就行
            v=expr1->getIValue() % expr2->getIValue();
            break;
        case LOGIC_AND:
            v=expr1->getFValue() && expr2->getFValue();
            break;
        case LOGIC_OR:
            v=expr1->getFValue() || expr2->getFValue();
            break;
        case LESS:
            v=expr1->getFValue() < expr2->getFValue();
            break;
        case LESSOREQUAL:
            v=expr1->getFValue() <= expr2->getFValue();
            break;
        case MORE:
            v=expr1->getFValue() > expr2->getFValue();
            break;
        case MOREOREQUAL:
            v=expr1->getFValue() >= expr2->getFValue();
            break;
        case EQUAL:
            v=expr1->getFValue() == expr2->getFValue();
            break;
        case UNEQUAL:
            v=expr1->getFValue() != expr2->getFValue();
            break;
    }
    return v;
}

void Constant::output(int level)
{
    std::string type, value;
    type = symbolEntry->getType()->toStr();
    value = symbolEntry->toStr();
    fprintf(yyout, "%*cIntegerLiteral\tvalue: %s\ttype: %s\n", level, ' ',
            value.c_str(), type.c_str());
}

int Constant::getIValue(){
    int v;
    v=((ConstantSymbolEntry*)symbolEntry)->getValue();
    return v;
}
float Constant::getFValue(){
    float v;
    v=((ConstantSymbolEntry*)symbolEntry)->getFvalue();
    return v;
}

void Id::output(int level)
{
    std::string name, type;
    int scope;
    name = symbolEntry->toStr();
    type = symbolEntry->getType()->toStr();
    scope = dynamic_cast<IdentifierSymbolEntry*>(symbolEntry)->getScope();
    fprintf(yyout, "%*cId\tname: %s\tscope: %d\ttype: %s\n", level, ' ',
            name.c_str(), scope, type.c_str());
}
void ArrayInit::output(int level)
{
    std::string type;
    type = symbolEntry->getType()->toStr();
    if(!isFullZero){
        fprintf(yyout, "%*ctype: %s\n", level, ' ',type.c_str());
        ExprNode*temp=expr;
        while (temp){
            temp->output(level + 4);
            temp=(ExprNode*)temp->getNext();
        }
    }
    else{
        fprintf(yyout, "%*ctype: %s\tzero array\n", level, ' ',type.c_str());
    }
}
void ArrayInit::addExpr(ExprNode* expr){
    isFullZero=false;
    childExprCount++;
    if(this->expr==nullptr){
        this->expr=expr;
        return;
    }
    this->expr->setNext(expr);
}

bool ArrayInit::isFull(){
    ArrayType* type = (ArrayType*)(this->symbolEntry->getType());
    return childExprCount == type->getLength();
}

void CompoundStmt::output(int level)    
{
    fprintf(yyout, "%*cCompoundStmt\n", level, ' ');
    stmt->output(level + 4);
}


void SeqNode::output(int level)
{
    fprintf(yyout, "%*cSequence\n", level, ' ');
    stmt1->output(level + 4);
    stmt2->output(level + 4);
}

void DeclStmt::output(int level)
{
    fprintf(yyout, "%*cDeclStmt\n", level, ' ');
    id->output(level + 4);
    if (expr)
        expr->output(level + 4);
    if (this->getNext()) {
        this->getNext()->output(level);
    }
}

void IfStmt::output(int level)
{
    fprintf(yyout, "%*cIfStmt\n", level, ' ');
    cond->output(level + 4);
    thenStmt->output(level + 4);
}

void IfElseStmt::output(int level)
{
    fprintf(yyout, "%*cIfElseStmt\n", level, ' ');
    cond->output(level + 4);
    thenStmt->output(level + 4);
    elseStmt->output(level + 4);
}

void WhileStmt::output(int level) {
    fprintf(yyout, "%*cWhileStmt\n", level, ' ');
    cond->output(level + 4);
    stmt->output(level + 4);
}

void BreakStmt::output(int level) {
    fprintf(yyout, "%*cBreakStmt\n", level, ' ');
}

void ContinueStmt::output(int level) {
    fprintf(yyout, "%*cContinueStmt\n", level, ' ');
}

void ReturnStmt::output(int level)
{
    fprintf(yyout, "%*cReturnStmt\n", level, ' ');
    retValue->output(level + 4);
}

void AssignStmt::output(int level)
{
    fprintf(yyout, "%*cAssignStmt\n", level, ' ');
    lval->output(level + 4);
    expr->output(level + 4);
}

void FunctionDef::output(int level)
{
    std::string name, type;
    name = se->toStr();
    type = se->getType()->toStr();
    fprintf(yyout, "%*cFunctionDefine\tfunction name: %s\ttype: %s\n", level,
            ' ', name.c_str(), type.c_str());
    if (decl) {
        decl->output(level + 4);
    }
    stmt->output(level + 4);
}

void ExprStmt::output(int level) {
    fprintf(yyout, "%*cExprStmt\n", level, ' ');
    expr->output(level + 4);
}
