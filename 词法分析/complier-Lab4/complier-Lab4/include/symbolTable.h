#include<string.h>
#include<map>
using namespace std;

#define VOID 0
#define INT 1
#define CHAR 2
#define FLOAT 3

class Symbol
{
private:
    /* data */
    int type;
    int32_t inTable;
public:
    Symbol(int type);
    ~Symbol();

    void setInTable(int32_t addr);
};

Symbol::Symbol(int type)
{
    this->type=type;
}

Symbol::~Symbol()
{
}


class SymbolTable
{
private:
    map<string,Symbol*>symbolTable;
    SymbolTable* prevTable;
public:
    SymbolTable(SymbolTable* prev=nullptr);
    ~SymbolTable();

    Symbol* lookUpSymbol(string symbolName);
    void addSymbol(string symbolName,Symbol* symbol);
};

SymbolTable::SymbolTable(SymbolTable* prev=nullptr)
{
    this->prevTable=prev;
}

SymbolTable::~SymbolTable()
{
}
