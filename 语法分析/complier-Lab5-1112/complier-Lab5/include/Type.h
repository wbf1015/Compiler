#ifndef __TYPE_H__
#define __TYPE_H__
#include <vector>
#include <string>

class Type
{
private:
    int kind;//描述这个类型的种类
protected:
    enum {INT, VOID, FUNC, FLOAT, ARRAY};
    int size;
public:
    Type(int kind, int size=0) : kind(kind),size(size){};
    virtual ~Type() {};
    virtual std::string toStr() = 0;
    bool isInt() const {return kind == INT;};
    bool isVoid() const {return kind == VOID;};
    bool isFunc() const {return kind == FUNC;};
    bool isFloat() const {return kind == FLOAT;};
    bool isArray() const {return kind == ARRAY;};

    int getSize() const {return this->size;};
};

class IntType : public Type
{
private:
    bool isConst;
public:
    IntType(int size, bool isConst=false) : Type(Type::INT, size), isConst(isConst){};
    std::string toStr();
};

class FloatType : public Type
{
private:
    bool isConst;
public:
    FloatType(int size, bool isConst=false) : Type(Type::FLOAT, size), isConst(isConst){};
    std::string toStr();
};

class VoidType : public Type
{
public:
    VoidType() : Type(Type::VOID){};
    std::string toStr();
};

class FunctionType : public Type
{
private:
    Type *returnType;//返回值类型
    std::vector<Type*> paramsType;//参数列表类型
public:
    FunctionType(Type* returnType, std::vector<Type*> paramsType) : 
    Type(Type::FUNC), returnType(returnType), paramsType(paramsType){};
    std::string toStr();
};

class ArrayType : public Type {
   private:
    Type* elementType;
    int length;
    bool isConst;
    Type* arrayType =nullptr;//要考虑多维数组的情况，数组套数组

   public:
    ArrayType(Type* elementType,
              int length,
              bool constant = false)
        : Type(Type::ARRAY,elementType->getSize()*length),
          elementType(elementType),length(length),isConst(constant) {};
    std::string toStr();
    int getLength() const { return length; };
    Type* getElementType() const { return elementType; };
    void setArrayType(Type* arrayType) { this->arrayType = arrayType; };
    Type* getArrayType() const { return arrayType; };
    int getSize() const {return size;}
};


class TypeSystem
{
private:
    static IntType commonInt;
    static FloatType commonFloat;
    static IntType commonConstInt;
    static FloatType commonConstFloat;
    static VoidType commonVoid;

//array没有在这里说明
//这些东西就是个指针，指针中究竟存了什么在cpp中说明
public:
    static Type *intType;
    static Type *floatType;
    static Type *constIntType;
    static Type *constFloatType;
    static Type *voidType;
};

#endif
