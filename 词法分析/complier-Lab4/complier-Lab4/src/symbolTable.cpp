#include "include/symbolTable.h"

Symbol::setInTable(int32_t adddr){
    this->inTable=addr;
}

SymbolTable::lookUpSymbol(string symbolName){
    if(symbolTable.find(symbolName)!=symbolTable.end()){
        return symbolTable[symbolName];
    }
    return nullptr;
}
SymbolTable::addSymbol(string symbolName,Symbol* symbol){
    symbolTable.insert(pair<string,Symbol*>(symbolName,symbol));
}