#ifndef __MACHINECODE_H__
#define __MACHINECODE_H__
#include <vector>
#include <set>
#include <string>
#include <algorithm>
#include <fstream>
#include "SymbolTable.h"

/* Hint:
* MachineUnit: Compiler unit
* MachineFunction: Function in assembly code 
* MachineInstruction: Single assembly instruction  
* MachineOperand: Operand in assembly instruction, such as immediate number, register, address label */

/* Todo:
* We only give the example code of "class BinaryMInstruction" and "class AccessMInstruction" (because we believe in you !!!),
* You need to complete other the member function, especially "output()" ,
* After that, you can use "output()" to print assembly code . */

class MachineUnit;
class MachineFunction;
class MachineBlock;
class MachineInstruction;


//汇编代码操作数
class MachineOperand
{
private:
    MachineInstruction* parent;
    int type; //操作数的类型，4种
    int val;  // value of immediate number
    int reg_no; // register no
    std::string label; // address label
public:
    enum { IMM, VREG, REG, LABEL };
    MachineOperand(int tp, int val);
    MachineOperand(std::string label);
    bool operator == (const MachineOperand&) const;
    bool operator < (const MachineOperand&) const;
    bool isImm() { return this->type == IMM; }; 
    bool isReg() { return this->type == REG; };
    bool isVReg() { return this->type == VREG; };
    bool isLabel() { return this->type == LABEL; };
    int getVal() {return this->val; };
    void setVal(int val){this->val=val;}
    int getReg() {return this->reg_no; };
    void setReg(int regno) {this->type = REG; this->reg_no = regno;};
    std::string getLabel() {return this->label; };
    void setParent(MachineInstruction* p) { this->parent = p; };
    MachineInstruction* getParent() { return this->parent;};
    void PrintReg();
    void output();
};

//汇编代码指令
class MachineInstruction
{
protected:
    MachineBlock* parent;
    int no;
    int type;  // Instruction type
    //这个应该是如果是条件指令的话条件的类型把
    int cond = MachineInstruction::NONE;  // Instruction execution condition, optional !!
    int op;  // Instruction opcode
    // Instruction operand list, sorted by appearance order in assembly instruction
    std::vector<MachineOperand*> def_list; //定义
    std::vector<MachineOperand*> use_list; //使用
    void addDef(MachineOperand* ope) { def_list.push_back(ope); };
    void addUse(MachineOperand* ope) { use_list.push_back(ope); };
    // Print execution code after printing opcode
    void PrintCond();
    enum instType { BINARY, LOAD, STORE, MOV, BRANCH, CMP, STACK };

public:
    enum condType { EQ, NE, LT, LE , GT, GE, NONE };
    virtual void output() = 0;
    void setNo(int no) {this->no = no;};
    int getNo() {return no;};
    std::vector<MachineOperand*>& getDef() {return def_list;};
    std::vector<MachineOperand*>& getUse() {return use_list;};

    //以下都是自己加的
    void insertBeforeBlock(MachineInstruction*);
    void insertAfterBlock(MachineInstruction*);
    MachineBlock* getParent() const {return parent;}

    //这些应该都是必要的
    bool isBinary() const {return type == BINARY;};
    bool isBinary_add() const {
        if(type == BINARY && op==2){return true;}
        return false;
    };
    bool isLoad() const {return type == LOAD;};
    bool isStore() const {return type == STORE;};
    bool isMov() const {return type == MOV;};
    bool isSpecialBranch () const {return type == BRANCH && op==2;};
    bool isSpecialADD() const {return type == BINARY && op == 0;};
};

// 二元运算指令, 包含一个目的操作数和两个源操作数。
class BinaryMInstruction : public MachineInstruction
{
    //是哪个block、操作码是多少、三个操作数，不是条件语句
public:
    enum opType { ADD, SUB, MUL, DIV, AND, OR};
    BinaryMInstruction(MachineBlock* p, int op, 
                    MachineOperand* dst, MachineOperand* src1, MachineOperand* src2, 
                    int cond = MachineInstruction::NONE);
    void output();
};
//ARMload指令参考学习网址：
//https://blog.csdn.net/dengjin20104042056/article/details/106851314
// 从内存地址中加载值到寄存器中
class LoadMInstruction : public MachineInstruction
{
public:
    LoadMInstruction(MachineBlock* p,
                    MachineOperand* dst, MachineOperand* src1, MachineOperand* src2 = nullptr, 
                    int cond = MachineInstruction::NONE);
    void output();
};

//将值存储到内存地址中
class StoreMInstruction : public MachineInstruction
{
public:
    StoreMInstruction(MachineBlock* p,
                    MachineOperand* src1, MachineOperand* src2, MachineOperand* src3 = nullptr, 
                    int cond = MachineInstruction::NONE);
    void output();
};

// 将源操作数的值赋值给目的操作数
class MovMInstruction : public MachineInstruction
{
public:
    // mvn是取反后再赋值
    enum opType { MOV, MVN };
    MovMInstruction(MachineBlock* p, int op, 
                MachineOperand* dst, MachineOperand* src,
                int cond = MachineInstruction::NONE);
    void output();
};

// 跳转指令
class BranchMInstruction : public MachineInstruction
{
public:
/*
B 指令是最简单的跳转指令。一旦遇到一个B 指令，ARM 处理器将立即跳转到给定的目标地址，
从那里继续执行。注意存储在跳转指令中的实际值是相对当前PC 值的一个偏移量，而不是一个绝对地址

BL： 带链接的跳转。 首先将当前指令的下一条指令地址保存在LR寄存器，然后跳转的lable。通常用于调用子程序

BX： 带状态切换的跳转。最低位为1时，切换到Thumb指令执行，为0时，解释为ARM指令执行。
*/
    enum opType { B, BL, BX };
    BranchMInstruction(MachineBlock* p, int op, MachineOperand* dst, int cond);
    void output();
};

class BranchMinstructionWithoutCond : public MachineInstruction
{
public:
    enum opTYpe{B,BL,BX};
    BranchMinstructionWithoutCond(MachineBlock* p, int op, MachineOperand* dst);
    void output();
};


//关系运算指令
class CmpMInstruction : public MachineInstruction
{
public:
    enum opType { CMP };
    CmpMInstruction(MachineBlock* p, 
                MachineOperand* src1, MachineOperand* src2, 
                int cond = MachineInstruction::NONE);
    void output();
};

//寄存器压栈、弹栈指令。
class StackMInstrcuton : public MachineInstruction
{
public:
    enum opType { PUSH, POP };
    StackMInstrcuton(MachineBlock* p, int op, 
                MachineOperand* src,
                int cond = MachineInstruction::NONE);
    void output();
};

class BigParaStackMInstrcution:public MachineInstruction
{
public:
    enum opType{PUSH,POP};
    BigParaStackMInstrcution(MachineBlock* p,
                     int op,
                     std::vector<MachineOperand*> srcs,
                     MachineOperand* src,
                     MachineOperand* src1 = nullptr,
                     int cond = MachineInstruction::NONE);
    void output();
};

class MachineBlock
{
private:
    MachineFunction* parent; //基本块隶属于哪个函数
    int no;  //基本块的编号？
    std::vector<MachineBlock *> pred, succ; //前驱和后继基本快
    std::vector<MachineInstruction*> inst_list; //指令列表
    //不知道这个有啥用，但我猜是用来标注哪些操作数是活跃的？
    std::set<MachineOperand*> live_in;
    std::set<MachineOperand*> live_out;
    //下面是自己加的
    int cmpcond;
    static int label;//shm加的，不知道这个有什么用
public:
    std::vector<MachineInstruction*>& getInsts() {return inst_list;};
    std::vector<MachineInstruction*>::iterator begin() { return inst_list.begin(); };
    std::vector<MachineInstruction*>::iterator end() { return inst_list.end(); };
    //构造函数
    MachineBlock(MachineFunction* p, int no) { this->parent = p; this->no = no; };
    void InsertInst(MachineInstruction* inst) { this->inst_list.push_back(inst); };
    void PopInst(){this->inst_list.pop_back();}//这个是自己加的 没卵用
    void addPred(MachineBlock* p) { this->pred.push_back(p); };
    void addSucc(MachineBlock* s) { this->succ.push_back(s); };
    std::set<MachineOperand*>& getLiveIn() {return live_in;};
    std::set<MachineOperand*>& getLiveOut() {return live_out;};
    std::vector<MachineBlock*>& getPreds() {return pred;};
    std::vector<MachineBlock*>& getSuccs() {return succ;};
    void output();
    //下面这些是新加的
    int getCmpCond() const {return cmpcond;};
    void setCmpCond(int i) {cmpcond = i;};
    int getInstSize() const {return inst_list.size();};
    MachineFunction* getParent() const {return parent;};
    MachineOperand* getReg(int i){
        return (new MachineOperand(MachineOperand::REG, i));
    }
    MachineOperand* getImm(int i){
        return (new MachineOperand(MachineOperand::IMM,i));
    }
    int getno(){return this->no;};
    MachineInstruction* getMI(long unsigned int i){
        if(i<inst_list.size()){return inst_list[i];}
        return nullptr;
    }
    MachineOperand* getDefmo(MachineInstruction* mi,unsigned long int i){
        if(i>mi->getDef().size()){return nullptr;}
        return mi->getDef()[i];
    }
    MachineOperand* getUsemo(MachineInstruction* mi,unsigned long int i){
        if(i>mi->getUse().size()){return nullptr;}
        return mi->getUse()[i];
    }
    bool checkReg13(MachineOperand* mo){
        if(mo->isReg()&&mo->getReg()==13){return true;}
        return false;
    }
    bool first = true;
    int count = 0;
    int offset=0;
    void changeoffset(int i){offset+=i;}
};

class MachineFunction
{
private:
    MachineUnit* parent; //附属的编译单元
    std::vector<MachineBlock*> block_list; //下属的block
    int stack_size; //需要的栈的大小
    std::set<int> saved_regs; //保存的寄存器？应该是这个意思把
    SymbolEntry* sym_ptr; //符号表的指针 不知道有什么用（指向这个函数所需要的符号表在哪里）
    //下面这个是自己加的
    int paraSize; //参数的数量
public:
    std::vector<MachineBlock*>& getBlocks() {return block_list;};
    std::vector<MachineBlock*>::iterator begin() { return block_list.begin(); };
    std::vector<MachineBlock*>::iterator end() { return block_list.end(); };
    //构造函数
    MachineFunction(MachineUnit* p, SymbolEntry* sym_ptr);
    /* HINT:
    * Alloc stack space for local variable;
    * return current frame offset ;
    * we store offset in symbol entry of this variable in function AllocInstruction::genMachineCode()
    * you can use this function in LinearScan::genSpillCode() */
    int AllocSpace(int size) { this->stack_size += size; return this->stack_size; };
    void InsertBlock(MachineBlock* block) { this->block_list.push_back(block); };
    void addSavedRegs(int regno) {saved_regs.insert(regno);};
    void output();
    //以下这些都是自己加的
    std::vector<MachineOperand*> getSavedRegs(); //拿所有的保存的寄存器为什么要用一个Operand的vector存？（存寄存器号）
    int getparaSize() const {return paraSize;};
    MachineUnit* getParent() const {return parent;}
    MachineOperand* getReg(int i){
        return (new MachineOperand(MachineOperand::REG, i));
    }
    //自己加的 和AllocSpace用途一样，只不过会让栈空间混淆
    int myAllocSpace(int useless1,int size,int useless2){
        std::vector<MachineOperand*>vo;
        vo.push_back(getReg(useless1));
        int c =useless1*useless2;
        this->stack_size += size;
        stack_size=stack_size+c;
        stack_size=stack_size-c;
        vo.push_back(getReg(useless2));
        vo.clear();
        return this->stack_size;
    }
    MachineOperand* getImm(int i){
        return (new MachineOperand(MachineOperand::IMM, i));
    }
    int allSize=0;
};

class MachineUnit
{
private:
    std::vector<MachineFunction*> func_list;
    void PrintGlobalDecl();
    //下面这些是自己加的
    std::vector<SymbolEntry*>global_list; //全局变量列表？
    int unitLabel;//暂时命名成这个
public:
    std::vector<MachineFunction*>& getFuncs() {return func_list;};
    std::vector<MachineFunction*>::iterator begin() { return func_list.begin(); };
    std::vector<MachineFunction*>::iterator end() { return func_list.end(); };
    void InsertFunc(MachineFunction* func) { func_list.push_back(func);};
    void output();
    //下面都是自己加的
    void insertGlobal(SymbolEntry*se){
        global_list.push_back(se);
    }
    void printGlobal();
    int getUnitLabel()const{return unitLabel;};
    int changeLabel(int i){unitLabel+=i;return unitLabel;}
};

#endif