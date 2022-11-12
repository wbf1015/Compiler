#include "Type.h"
#include <assert.h>
#include <sstream>


IntType TypeSystem::commonInt = IntType(4); //TypeSystem中的commonInt就是一个四字节的int类型，等于号的右边是调用int的构造函数
FloatType TypeSystem::commonFloat = FloatType(4);
IntType TypeSystem::commonConstInt = IntType(4,true);
FloatType TypeSystem::commonConstFloat = FloatType(4,true);
VoidType TypeSystem::commonVoid = VoidType();


Type* TypeSystem::intType = &commonInt; //这句话的意思是其实TypeSystem中那个public的类型intType就是那个private类型commonInt
Type* TypeSystem::floatType=&commonFloat;
Type* TypeSystem::voidType = &commonVoid;
Type* TypeSystem::constIntType=&commonConstInt;
Type* TypeSystem::constFloatType=&commonConstFloat;

//int类型 常量返回const int，非常量返回int
std::string IntType::toStr()
{
    if(isConst){
        return "const int";
    }else{
        return "int";
    }
}
//float类型 常量返回const float，非常量返回float
std::string FloatType::toStr()
{
    if(isConst){
        return "const float";
    }else{
        return "float";
    }
}
//void类型 返回void
std::string VoidType::toStr()
{
    return "void";
}
//函数类型 返回函数的返回类型
std::string FunctionType::toStr()
{
    std::ostringstream buffer;
    buffer << returnType->toStr() << "()";
    return buffer.str();
}
//输出数组大小，格式为：const int【4】【5】
std::string ArrayType::toStr() {
    std::vector<std::string> vec;
    Type* temp = this;
    while (temp && temp->isArray()) {
        std::ostringstream buffer;
        if(temp == this && length == 0)
            buffer << '[' << ']';
        else
            buffer << '[' << ((ArrayType*)temp)->getLength() << ']';
        vec.push_back(buffer.str());
        temp = ((ArrayType*)temp)->getElementType();
    }
    //assert(temp->isInt());
    std::ostringstream buffer;
    if (isConst)
        buffer << "const ";
    buffer << "int";
    for (auto it = vec.begin(); it != vec.end(); it++)
        buffer << *it;
    return buffer.str();
}
