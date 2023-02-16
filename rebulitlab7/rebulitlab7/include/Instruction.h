#ifndef __INSTRUCTION_H__
#define __INSTRUCTION_H__

#include <map>
#include <sstream>
#include <vector>
#include "AsmBuilder.h"
#include "Operand.h"

class BasicBlock;

class Instruction {
   public:
    Instruction(unsigned instType, BasicBlock* insert_bb = nullptr);
    virtual ~Instruction();
    BasicBlock* getParent();
    bool isUncond() const { return instType == UNCOND; };
    bool isCond() const { return instType == COND; };
    bool isAlloc() const { return instType == ALLOCA; };
    bool isRet() const { return instType == RET; };
    void setParent(BasicBlock*);
    void setNext(Instruction*);
    void setPrev(Instruction*);
    Instruction* getNext();
    Instruction* getPrev();
    virtual void output() const = 0;
    MachineOperand* genMachineOperand(Operand*);
    MachineOperand* genMachineReg(int reg);
    MachineOperand* genMachineVReg();
    MachineOperand* genMachineImm(int val);
    MachineOperand* genMachineLabel(int block_no);
    virtual void genMachineCode(AsmBuilder*) = 0;
    //下面是自己加的指令
    MachineOperand* getImmInt(int i){
        return (new MachineOperand(MachineOperand::IMM,i));
    }
    MachineOperand* getVreg(int i){
        return (new MachineOperand(MachineOperand::VREG,i));
    }
    MachineOperand* getLabel(std::string s){
        return (new MachineOperand(s));
    }
    MachineOperand* getReg(int i){
        return (new MachineOperand(MachineOperand::REG,i));
    }
    std::string int2string2(int i){
        if(i==0){return "0";}
        if(i==1){return "1";}
        if(i==2){return "2";}
        if(i==3){return "3";}
        if(i==4){return "4";}
        if(i==5){return "5";}
        if(i==6){return "6";}
        if(i==7){return "7";}
        if(i==8){return "8";}
        if(i==9){return "9";}
        return "";
    }
    std::string int2String(int i){
        std::string ret="";
        int ii=i;
        while(ii>0){
            int temp = ii%10;
            ret.append(int2string2(temp));
            ii= ii/10;
        }
        std::reverse(ret.begin(),ret.end());
        return ret;
    }

   protected:
    unsigned instType;
    unsigned opcode;
    Instruction* prev;
    Instruction* next;
    BasicBlock* parent;
    std::vector<Operand*> operands;
    enum {
        BINARY,
        COND,
        UNCOND,
        RET,
        LOAD,
        STORE,
        CMP,
        ALLOCA,
        CALL,
        ZEXT,
        XOR,
        GEP
    };
};

// meaningless instruction, used as the head node of the instruction list.
class DummyInstruction : public Instruction {
   public:
    DummyInstruction() : Instruction(-1, nullptr){};
    void output() const {};
    void genMachineCode(AsmBuilder*){};
};

class AllocaInstruction : public Instruction {
   public:
    AllocaInstruction(Operand* dst,
                      SymbolEntry* se,
                      BasicBlock* insert_bb = nullptr);
    ~AllocaInstruction();
    void output() const;
    void genMachineCode(AsmBuilder*);
    //自己添加
    int getStandard(int i){
        if(i==1){return Standard;}
        if(i==2){return Standard*4;}
        return 0;
    }
    int checkSize(int size){
        if(size<0){return 4;}
        return size;
    }
   
   private:
    SymbolEntry* se;
    // 下面都是自己添加的
    int Standard=8;

};

class LoadInstruction : public Instruction {
   public:
    LoadInstruction(Operand* dst,
                    Operand* src_addr,
                    BasicBlock* insert_bb = nullptr);
    ~LoadInstruction();
    void output() const;
    void genMachineCode(AsmBuilder*);
    //自己添加的
    bool fastIsGlobal(IdentifierSymbolEntry* ise){
        return ise->isGlobal();
    }
    bool fastDef(Operand* o){
        return o->getDef()!=nullptr;
    }
};

class StoreInstruction : public Instruction {
   public:
    StoreInstruction(Operand* dst_addr,
                     Operand* src,
                     BasicBlock* insert_bb = nullptr);
    ~StoreInstruction();
    void output() const;
    void genMachineCode(AsmBuilder*);
    //下面是自己加的
    Operand* getOperands(int i ){
        return operands[i];
    }
    MachineOperand* globald;
    MachineOperand* globals;
    void setGlobald(MachineOperand* mo){this->globald=mo;}
    void setGlobals(MachineOperand* mo){this->globals=mo;}
    MachineOperand* getGlobald(){return globald;}
    MachineOperand* getGlobals(){return globals;}
    bool fastDef(Operand* o){return o->getDef()!=nullptr;}
    bool fastIsGlobal(IdentifierSymbolEntry* ise){return ise->isGlobal();}
};

class BinaryInstruction : public Instruction {
   public:
    BinaryInstruction(unsigned opcode,
                      Operand* dst,
                      Operand* src1,
                      Operand* src2,
                      BasicBlock* insert_bb = nullptr);
    ~BinaryInstruction();
    void output() const;
    void genMachineCode(AsmBuilder*);
    enum { SUB, ADD, AND, OR, MUL, DIV, MOD };
    //下面是自己加的代码
    MachineOperand* globald;
    MachineOperand* globals1;
    MachineOperand* globals2;
    void setGlobald(MachineOperand* mo){this->globald=mo;}
    void setGlobals1(MachineOperand* mo){this->globals1=mo;}
    void setGlobals2(MachineOperand* mo){this->globals2=mo;}
    MachineOperand* getGlobald(){return globald;}
    MachineOperand* getGlobals1(){return globals1;}
    MachineOperand* getGlobals2(){return globals2;}
    bool isBig(ConstantSymbolEntry* cse){
        if(cse->getValue()>=256){return true;}
        return false;
    }
    bool isSmallCal(int op){
        if(op<=BinaryInstruction::OR){return true;}
        return false;
    }

};

class CmpInstruction : public Instruction {
   public:
    CmpInstruction(unsigned opcode,
                   Operand* dst,
                   Operand* src1,
                   Operand* src2,
                   BasicBlock* insert_bb = nullptr);
    ~CmpInstruction();
    void output() const;
    void genMachineCode(AsmBuilder*);
    enum { E, NE, L, LE, G, GE };
    //下面是自己加的东西
    MachineOperand* globald;
    MachineOperand* globals1;
    MachineOperand* globals2;
    void setGlobald(MachineOperand* mo){this->globald=mo;}
    void setGlobals1(MachineOperand* mo){this->globals1=mo;}
    void setGlobals2(MachineOperand* mo){this->globals2=mo;}
    MachineOperand* getGlobald(){return globald;}
    MachineOperand* getGlobals1(){return globals1;}
    MachineOperand* getGlobals2(){return globals2;}
    Operand* getOperands(int i ){return operands[i];}
    bool isBig(ConstantSymbolEntry* cse){
        if(cse->getValue()>=256){return true;}
        return false;
    }
    bool needMove(){
        if(opcode >= CmpInstruction::L && opcode <= CmpInstruction::GE){return true;}
        return false;
    }
    int oppo(int i){
        if(i>5){
            return 7-i;
        }
        if(i>=0){
            return 9-2-i;
        }
        return 8-1-i;
    }
};

// unconditional branch
class UncondBrInstruction : public Instruction {
   public:
    UncondBrInstruction(BasicBlock*, BasicBlock* insert_bb = nullptr);
    void output() const;
    void setBranch(BasicBlock*);
    BasicBlock* getBranch();
    void genMachineCode(AsmBuilder*);

   protected:
    BasicBlock* branch;
};

// conditional branch
class CondBrInstruction : public Instruction {
   public:
    CondBrInstruction(BasicBlock*,
                      BasicBlock*,
                      Operand*,
                      BasicBlock* insert_bb = nullptr);
    ~CondBrInstruction();
    void output() const;
    void setTrueBranch(BasicBlock*);
    BasicBlock* getTrueBranch();
    void setFalseBranch(BasicBlock*);
    BasicBlock* getFalseBranch();
    void genMachineCode(AsmBuilder*);

   protected:
    BasicBlock* true_branch;
    BasicBlock* false_branch;
};

class RetInstruction : public Instruction {
   public:
    RetInstruction(Operand* src, BasicBlock* insert_bb = nullptr);
    ~RetInstruction();
    void output() const;
    void genMachineCode(AsmBuilder*);
    //自己加的一些东西
    MachineOperand* globald;
    MachineOperand* globals1;
    MachineOperand* globals2;
    void setGlobald(MachineOperand* mo){this->globald=mo;}
    void setGlobals1(MachineOperand* mo){this->globals1=mo;}
    void setGlobals2(MachineOperand* mo){this->globals2=mo;}
    MachineOperand* getGlobald(){return globald;}
    MachineOperand* getGlobals1(){return globals1;}
    MachineOperand* getGlobals2(){return globals2;}
    Operand* getOperands(int i ){return operands[i];}
    bool retVoid(){
        if(operands.empty()){return true;}
        else{return false;}
    }
};

class CallInstruction : public Instruction {
   private:
    SymbolEntry* func;
    Operand* dst;

   public:
    CallInstruction(Operand* dst,
                    SymbolEntry* func,
                    std::vector<Operand*> params,
                    BasicBlock* insert_bb = nullptr);
    ~CallInstruction();
    void output() const;
    void genMachineCode(AsmBuilder*);
    //下面这些是自己加的
    Operand* getOperand(unsigned long int i){
        if(i<operands.size()){return operands[i];}
        return nullptr;
    }
    std::vector<MachineOperand*>vmo;
    int calOffset(){return (operands.size()-5)*4;}
};

class ZextInstruction : public Instruction {
   public:
    ZextInstruction(Operand* dst,
                    Operand* src,
                    BasicBlock* insert_bb = nullptr);
    ~ZextInstruction();
    void output() const;
    void genMachineCode(AsmBuilder*);
};

class XorInstruction : public Instruction {
   public:
    XorInstruction(Operand* dst, Operand* src, BasicBlock* insert_bb = nullptr);
    ~XorInstruction();
    void output() const;
    void genMachineCode(AsmBuilder*);
};

class GepInstruction : public Instruction {
   private:
    bool paramFirst;
    bool first;
    bool last;
    Operand* init;

   public:
    GepInstruction(Operand* dst,
                   Operand* arr,
                   Operand* idx,
                   BasicBlock* insert_bb = nullptr,
                   bool paramFirst = false);
    ~GepInstruction();
    void output() const;
    void genMachineCode(AsmBuilder*);
    void setFirst() { first = true; };
    void setLast() { last = true; };
    Operand* getInit() const { return init; };
    void setInit(Operand* init) { this->init = init; };

};

#endif