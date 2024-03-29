#include "SymbolTable.h"
#include <iostream>
#include <sstream>
#include "Type.h"

bool SymbolEntry::setNext(SymbolEntry* se) {
    int paramSize = (dynamic_cast<FunctionType*>(se->getType()))->getParamsType().size();
    SymbolEntry *nextSe = this;

    if(this->next == nullptr){
        // if(dynamic_cast<FunctionType*>(this->getType())->getParamsType().size() == paramSize)
        // {
        //     fprintf(stderr, "a func is reDef\n");
        //     return false;
        // }
        this->next=se;
        return true;
    }

    while(nextSe->getNext()){
        int params = (dynamic_cast<FunctionType*>(nextSe->getType()))->getParamsType().size();
        // if (params == paramSize){
        //     fprintf(stderr, "a func is reDef\n");
        //     return false;
        // }
        nextSe = nextSe->getNext();
    }

    nextSe->next = se;
    return false;
}

SymbolEntry::SymbolEntry(Type* type, int kind) {
    this->type = type;
    this->kind = kind;
}

ConstantSymbolEntry::ConstantSymbolEntry(Type* type, int value): SymbolEntry(type, SymbolEntry::CONSTANT) {
    this->value = value;
}


ConstantSymbolEntry::ConstantSymbolEntry(Type* type): SymbolEntry(type, SymbolEntry::CONSTANT) {
    //this->value = 0;
}

int ConstantSymbolEntry::getValue() const {
    return value;
}


std::string ConstantSymbolEntry::toStr() {
    std::ostringstream buffer;
    buffer << value;
    return buffer.str();
}

IdentifierSymbolEntry::IdentifierSymbolEntry(Type* type,std::string name,int scope,int paramNo): SymbolEntry(type, SymbolEntry::VARIABLE), name(name),paramNo(paramNo) {
    this->scope = scope;
    this->label = -1;
    this->allZero = false;
    this->constant = false;
}

void IdentifierSymbolEntry::setValue(int value) {
    this->value = value;
}

void IdentifierSymbolEntry::setArrayValue(int* arrayValue) {
    this->arrayValue = arrayValue;
}

std::string IdentifierSymbolEntry::toStr() {
    std::ostringstream buffer;
    if (label <= -1) {
        if (type->isFunc())
            buffer << '@';
        buffer << name;
    } else
        buffer << "%t" << label;
    return buffer.str();
}

TemporarySymbolEntry::TemporarySymbolEntry(Type* type, int label): SymbolEntry(type, SymbolEntry::TEMPORARY) {
    this->label = label;
}

std::string TemporarySymbolEntry::toStr() {
    std::ostringstream buffer;
    buffer << "%t" << label;
    return buffer.str();
}

SymbolTable::SymbolTable() {
    prev = nullptr;
    level = 0;
}

SymbolTable::SymbolTable(SymbolTable* prev) {
    this->prev = prev;
    this->level = prev->level + 1;
}

/*
    Description: lookup the symbol entry of an identifier in the symbol table
    Parameters:
        name: identifier name
    Return: pointer to the symbol entry of the identifier

    hint:
    1. The symbol table is a stack. The top of the stack contains symbol entries
   in the current scope.
    2. Search the entry in the current symbol table at first.
    3. If it's not in the current table, search it in previous ones(along the
   'prev' link).
    4. If you find the entry, return it.
    5. If you can't find it in all symbol tables, return nullptr.
*/
SymbolEntry* SymbolTable::lookup(std::string name) {
    SymbolTable* table = this;
    while (table != nullptr)
        if (table->symbolTable.find(name) != table->symbolTable.end()) {
            return table->symbolTable[name];
        } else {
            table = table->prev;
        }
    return nullptr;
}

// install the entry into current symbol table.
bool SymbolTable::install(std::string name, SymbolEntry* entry) {
    if (this->symbolTable.find(name) != this->symbolTable.end()) {
        SymbolEntry* se = this->symbolTable[name];
        if (se->getType()->isFunc())
            return se->setNext(entry);
        return false;
    } else {
        symbolTable[name] = entry;
        return true;
    }
}

int SymbolTable::counter = 0;
static SymbolTable t;
SymbolTable* identifiers = &t;
SymbolTable* globals = &t;
