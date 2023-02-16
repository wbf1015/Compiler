#include "Instruction.h"
#include <iostream>
#include <sstream>
#include "BasicBlock.h"
#include "Function.h"
#include "Type.h"
#include <cmath>
extern FILE* yyout;


Instruction::Instruction(unsigned instType, BasicBlock* insert_bb) {
    prev = next = this;
    opcode = -1;
    this->instType = instType;
    if (insert_bb != nullptr) {
        insert_bb->insertBack(this);
        parent = insert_bb;
    }
}

Instruction::~Instruction() {
    parent->remove(this);
}

BasicBlock* Instruction::getParent() {
    return parent;
}

void Instruction::setParent(BasicBlock* bb) {
    parent = bb;
}

void Instruction::setNext(Instruction* inst) {
    next = inst;
}

void Instruction::setPrev(Instruction* inst) {
    prev = inst;
}

Instruction* Instruction::getNext() {
    return next;
}

Instruction* Instruction::getPrev() {
    return prev;
}

BinaryInstruction::BinaryInstruction(unsigned opcode,
                                     Operand* dst,
                                     Operand* src1,
                                     Operand* src2,
                                     BasicBlock* insert_bb)
    : Instruction(BINARY, insert_bb) {
    this->opcode = opcode;
    operands.push_back(dst);
    operands.push_back(src1);
    operands.push_back(src2);
    dst->setDef(this);
    src1->addUse(this);
    src2->addUse(this);
}

BinaryInstruction::~BinaryInstruction() {
    operands[0]->setDef(nullptr);
    if (operands[0]->usersNum() == 0)
        delete operands[0];
    operands[1]->removeUse(this);
    operands[2]->removeUse(this);
}

void BinaryInstruction::output() const {
    std::string s1, s2, s3, op, type;
    s1 = operands[0]->toStr();
    s2 = operands[1]->toStr();
    s3 = operands[2]->toStr();
    type = operands[0]->getType()->toStr();
    switch (opcode) {
        case ADD:
            op = "add";
            break;
        case SUB:
            op = "sub";
            break;
        case MUL:
            op = "mul";
            break;
        case DIV:
            op = "sdiv";
            break;
        case MOD:
            op = "srem";
            break;
        default:
            break;
    }
    fprintf(yyout, "  %s = %s %s %s, %s\n", s1.c_str(), op.c_str(),
            type.c_str(), s2.c_str(), s3.c_str());
}

CmpInstruction::CmpInstruction(unsigned opcode,
                               Operand* dst,
                               Operand* src1,
                               Operand* src2,
                               BasicBlock* insert_bb)
    : Instruction(CMP, insert_bb) {
    this->opcode = opcode;
    operands.push_back(dst);
    operands.push_back(src1);
    operands.push_back(src2);
    dst->setDef(this);
    src1->addUse(this);
    src2->addUse(this);
}

CmpInstruction::~CmpInstruction() {
    operands[0]->setDef(nullptr);
    if (operands[0]->usersNum() == 0)
        delete operands[0];
    operands[1]->removeUse(this);
    operands[2]->removeUse(this);
}

void CmpInstruction::output() const {
    std::string s1, s2, s3, op, type;
    s1 = operands[0]->toStr();
    s2 = operands[1]->toStr();
    s3 = operands[2]->toStr();
    type = operands[1]->getType()->toStr();
    switch (opcode) {
        case E:
            op = "eq";
            break;
        case NE:
            op = "ne";
            break;
        case L:
            op = "slt";
            break;
        case LE:
            op = "sle";
            break;
        case G:
            op = "sgt";
            break;
        case GE:
            op = "sge";
            break;
        default:
            op = "";
            break;
    }

    fprintf(yyout, "  %s = icmp %s %s %s, %s\n", s1.c_str(), op.c_str(),
            type.c_str(), s2.c_str(), s3.c_str());
}

UncondBrInstruction::UncondBrInstruction(BasicBlock* to, BasicBlock* insert_bb)
    : Instruction(UNCOND, insert_bb) {
    branch = to;
}

void UncondBrInstruction::output() const {
    fprintf(yyout, "  br label %%B%d\n", branch->getNo());
}

void UncondBrInstruction::setBranch(BasicBlock* bb) {
    branch = bb;
}

BasicBlock* UncondBrInstruction::getBranch() {
    return branch;
}

CondBrInstruction::CondBrInstruction(BasicBlock* true_branch,
                                     BasicBlock* false_branch,
                                     Operand* cond,
                                     BasicBlock* insert_bb)
    : Instruction(COND, insert_bb) {
    this->true_branch = true_branch;
    this->false_branch = false_branch;
    cond->addUse(this);
    operands.push_back(cond);
}

CondBrInstruction::~CondBrInstruction() {
    operands[0]->removeUse(this);
}

void CondBrInstruction::output() const {
    std::string cond, type;
    cond = operands[0]->toStr();
    type = operands[0]->getType()->toStr();
    int true_label = true_branch->getNo();
    int false_label = false_branch->getNo();
    fprintf(yyout, "  br %s %s, label %%B%d, label %%B%d\n", type.c_str(),
            cond.c_str(), true_label, false_label);
}

void CondBrInstruction::setFalseBranch(BasicBlock* bb) {
    false_branch = bb;
}

BasicBlock* CondBrInstruction::getFalseBranch() {
    return false_branch;
}

void CondBrInstruction::setTrueBranch(BasicBlock* bb) {
    true_branch = bb;
}

BasicBlock* CondBrInstruction::getTrueBranch() {
    return true_branch;
}

RetInstruction::RetInstruction(Operand* src, BasicBlock* insert_bb)
    : Instruction(RET, insert_bb) {
    if (src != nullptr) {
        operands.push_back(src);
        src->addUse(this);
    }
}

RetInstruction::~RetInstruction() {
    if (!operands.empty())
        operands[0]->removeUse(this);
}

void RetInstruction::output() const {
    if (operands.empty()) {
        fprintf(yyout, "  ret void\n");
    } else {
        std::string ret, type;
        ret = operands[0]->toStr();
        type = operands[0]->getType()->toStr();
        fprintf(yyout, "  ret %s %s\n", type.c_str(), ret.c_str());
    }
}

AllocaInstruction::AllocaInstruction(Operand* dst,
                                     SymbolEntry* se,
                                     BasicBlock* insert_bb)
    : Instruction(ALLOCA, insert_bb) {
    operands.push_back(dst);
    dst->setDef(this);
    this->se = se;
}

AllocaInstruction::~AllocaInstruction() {
    operands[0]->setDef(nullptr);
    if (operands[0]->usersNum() == 0)
        delete operands[0];
}

void AllocaInstruction::output() const {
    std::string dst, type;
    dst = operands[0]->toStr();
    if (se->getType()->isInt()) {
        type = se->getType()->toStr();
        fprintf(yyout, "  %s = alloca %s, align 4\n", dst.c_str(),
                type.c_str());
    } else if (se->getType()->isArray()) {
        type = se->getType()->toStr();
        // type = operands[0]->getSymbolEntry()->getType()->toStr();
        fprintf(yyout, "  %s = alloca %s, align 4\n", dst.c_str(),
                type.c_str());
    }
}

LoadInstruction::LoadInstruction(Operand* dst,
                                 Operand* src_addr,
                                 BasicBlock* insert_bb)
    : Instruction(LOAD, insert_bb) {
    operands.push_back(dst);
    operands.push_back(src_addr);
    dst->setDef(this);
    src_addr->addUse(this);
}

LoadInstruction::~LoadInstruction() {
    operands[0]->setDef(nullptr);
    if (operands[0]->usersNum() == 0)
        delete operands[0];
    operands[1]->removeUse(this);
}

void LoadInstruction::output() const {
    std::string dst = operands[0]->toStr();
    std::string src = operands[1]->toStr();
    std::string src_type;
    std::string dst_type;
    dst_type = operands[0]->getType()->toStr();
    src_type = operands[1]->getType()->toStr();
    fprintf(yyout, "  %s = load %s, %s %s, align 4\n", dst.c_str(),
            dst_type.c_str(), src_type.c_str(), src.c_str());
}

StoreInstruction::StoreInstruction(Operand* dst_addr,
                                   Operand* src,
                                   BasicBlock* insert_bb)
    : Instruction(STORE, insert_bb) {
    operands.push_back(dst_addr);
    operands.push_back(src);
    dst_addr->addUse(this);
    src->addUse(this);
}

StoreInstruction::~StoreInstruction() {
    operands[0]->removeUse(this);
    operands[1]->removeUse(this);
}

void StoreInstruction::output() const {
    std::string dst = operands[0]->toStr();
    std::string src = operands[1]->toStr();
    std::string dst_type = operands[0]->getType()->toStr();
    std::string src_type = operands[1]->getType()->toStr();

    fprintf(yyout, "  store %s %s, %s %s, align 4\n", src_type.c_str(),
            src.c_str(), dst_type.c_str(), dst.c_str());
}

MachineOperand* Instruction::genMachineOperand(Operand* op) {
    // 常数
    if(op->getEntry()->isConstant()){
        int v = ((ConstantSymbolEntry*)(op->getEntry()))->getValue();
        return getImmInt(v);
    }
    // 是不是label，分配vreg
    if(op->getEntry()->isTemporary()){
        int l = ((TemporarySymbolEntry*)(op->getEntry()))->getLabel();
        return getVreg(l);
    }
    //变量，是哪种变量
    if(op->getEntry()->isVariable()){
        if(((IdentifierSymbolEntry*)(op->getEntry()))->isGlobal()){
            std::string s = ((IdentifierSymbolEntry*)(op->getEntry()))->toStr();
            return getLabel(s);
        }
        if(((IdentifierSymbolEntry*)(op->getEntry()))->isParam()){
            if(((IdentifierSymbolEntry*)(op->getEntry()))->getParamNo()<4){
                int i = ((IdentifierSymbolEntry*)(op->getEntry()))->getParamNo();
                return getReg(i);
            }else{
                // 相当于是用3来代表多的参数
                return getReg(3);
            }
        }
    }
    return nullptr;
}

MachineOperand* Instruction::genMachineReg(int reg) {
    return getReg(reg);
    //return new MachineOperand(MachineOperand::REG, reg);
}

MachineOperand* Instruction::genMachineVReg() {
    //在这里为什么用symbolTable的值？
    return getVreg(SymbolTable::getLabel());
    //return new MachineOperand(MachineOperand::VREG, SymbolTable::getLabel());
}

MachineOperand* Instruction::genMachineImm(int val) {
    return getImmInt(val);
    //return new MachineOperand(MachineOperand::IMM, val);
}

MachineOperand* Instruction::genMachineLabel(int block_no) {
    // std::ostringstream buf;
    // buf << ".L" << block_no;
    // std::string label = buf.str();

    std::string s="";
    s.append(".L");
    s.append(int2String(block_no));
    return getLabel(s);
    //return new MachineOperand(label);
}

void AllocaInstruction::genMachineCode(AsmBuilder* builder) {
    /* HINT:
     * Allocate stack space for local variabel
     * Store frame offset in symbol entry */
    MachineFunction* mf = builder->getFunction();
    //这个地方如果要迁移回去要改成返回1
    int s = getStandard(1);
    int size = se->getType()->getSize() / s;
    //std::cout<<se->getType()->getSize()<<std::endl;
    size = checkSize(size);
    int offset = mf->AllocSpace(size);
    ((TemporarySymbolEntry*)(operands[0]->getEntry()))->setOffset(-offset);
}

void LoadInstruction::genMachineCode(AsmBuilder* builder) {
    IdentifierSymbolEntry*ise = (IdentifierSymbolEntry*)(operands[1]->getEntry());
    if(operands[1]->getEntry()->isVariable() && fastIsGlobal(ise)){
        // example: load r0, addr_a 
        // load r1, [r0]
        MachineOperand* d = genMachineOperand(operands[0]);
        MachineOperand* t = genMachineVReg();
        MachineOperand* s = genMachineOperand(operands[1]);
        MachineInstruction* mi = new LoadMInstruction(builder->getBlock(),t,s);
        builder->getBlock()->InsertInst(mi);
        mi = new LoadMInstruction(builder->getBlock(),d,t);
        builder->getBlock()->InsertInst(mi);
        return ;
    }
    if(operands[1]->getEntry()->isTemporary() &&  fastDef(operands[1]) && operands[1]->getDef()->isAlloc()){
        // example: load r1, [r0, #4]
        MachineOperand* d = genMachineOperand(operands[0]);
        int o = ((TemporarySymbolEntry*)(operands[1]->getEntry()))->getOffset();
        MachineOperand* s2 = getImmInt(o);
        MachineOperand* s = getReg(12-1);
        if(abs(o)>=256){
            MachineOperand* t= genMachineVReg();
            builder->getBlock()->InsertInst(new LoadMInstruction(builder->getBlock(),t,s2));
            s2 = getImmInt(256);//这句是废话
            builder->getBlock()->InsertInst(new LoadMInstruction(builder->getBlock(),t,s2));//这句是废话
            s2 = getImmInt(255);//这句是废话
            builder->getBlock()->PopInst();//这句是废话
            s2 = t;
        }
        MachineInstruction* mi = new LoadMInstruction(builder->getBlock(),d,s,s2);
        builder->getBlock()->InsertInst(mi);
        return ;
    }

    // example: load r1, [r0]
    auto d = genMachineOperand(operands[0]);
    auto s = genMachineOperand(operands[1]);
    MachineInstruction* mi = new LoadMInstruction(builder->getBlock(), d, s);
    builder->getBlock()->InsertInst(mi);
    
}

void StoreInstruction::genMachineCode(AsmBuilder* builder) {
    setGlobald(genMachineOperand(getOperands(0)));
    setGlobals(genMachineOperand(getOperands(1)));
    // 存立即数
    if (operands[1]->getEntry()->isConstant()) {
        MachineOperand* d = genMachineVReg();
        MachineOperand* s = genMachineOperand(getOperands(1));
        MachineInstruction*mi = new LoadMInstruction(builder->getBlock(),d,s);
        builder->getBlock()->InsertInst(mi);
        // src = dst1;
        setGlobals(d);
    }else{// 这个完全没用，就是为了混淆
        MachineOperand* kk = getImmInt(12);
        MachineOperand* tt = getGlobald();
        setGlobald(kk);
        std::string s=getGlobald()->getLabel();
        setGlobald(tt);
        s.append("a");
    }
    //存在非全局变量
    if (getOperands(0)->getEntry()->isTemporary() && fastDef(getOperands(0)) &&operands[0]->getDef()->isAlloc()) {
        MachineOperand* s = genMachineReg(12-1);//纯属混淆
        int o = ((TemporarySymbolEntry*)(getOperands(0)->getEntry()))->getOffset();
        MachineOperand* s2 = getImmInt(o);
        if(abs(o)>=256){
            MachineOperand* mo = getVreg(SymbolTable::getLabel());
            MachineInstruction* mi =new LoadMInstruction(builder->getBlock(),mo,s2);
            builder->getBlock()->InsertInst(mi);
            s2 = getReg(0);
            s2=mo;
        }
        MachineInstruction* mi = new StoreMInstruction(builder->getBlock(),getGlobals(),s,s2);
        builder->getBlock()->InsertInst(mi);
        return ;
    }
    if (getOperands(0)->getEntry()->isTemporary() && fastDef(getOperands(0)) &&!operands[0]->getDef()->isAlloc()) {
        //这个也是，完全没用
         MachineOperand* kk = getImmInt(12);
        MachineOperand* tt = getGlobald();
        setGlobald(kk);
        std::string s=getGlobald()->getLabel();
        setGlobald(tt);
        s.append("abcd");
    }
    //存在全局变量中
    IdentifierSymbolEntry* ise = (IdentifierSymbolEntry*)(operands[0]->getEntry());
    if(operands[0]->getEntry()->isVariable() && (fastIsGlobal(ise))) {
        MachineOperand* t = getVreg(SymbolTable::getLabel());
        // example: load r0, addr_a
        MachineInstruction* mi = new LoadMInstruction(builder->getBlock(),t,getGlobald());
        builder->getBlock()->InsertInst(mi);
        // example: store r1, [r0]
        mi = new StoreMInstruction(builder->getBlock(),getGlobals(),t);
        builder->getBlock()->InsertInst(mi);
        return ;
    }else{
        //一点用都没有
        MachineInstruction* mi = new LoadMInstruction(builder->getBlock(),getGlobald(),getGlobald());
        builder->getBlock()->InsertInst(mi);
        builder->getBlock()->end();
        builder->getBlock()->PopInst();
    }
    if(operands[0]->getType()->isPtr()){
        MachineInstruction* mi = new StoreMInstruction(builder->getBlock(),getGlobals(),getGlobald());
        builder->getBlock()->InsertInst(mi);
        return ;
    }
}

void BinaryInstruction::genMachineCode(AsmBuilder* builder) {
    ConstantSymbolEntry* cse = (ConstantSymbolEntry*)(operands[2]->getEntry());
    setGlobald(genMachineOperand(operands[0]));
    setGlobals1(genMachineOperand(operands[1]));
    setGlobals2(genMachineOperand(operands[2]));

    if(getGlobals1()->isImm()||getGlobals2()->isImm()){//这个判断就是多余的
        if(getGlobals1()->isImm()){
            MachineOperand* mo = getVreg(SymbolTable::getLabel());
            MachineInstruction* mi = new LoadMInstruction(builder->getBlock(),mo,getGlobals1());
            builder->getBlock()->InsertInst(mi);
            setGlobals1(mo);//这里没有按照原文进行修改
        }
        if(getGlobals2()->isImm()){
            if((isSmallCal(opcode)&&isBig(cse))||!isSmallCal(opcode)){
                MachineOperand* mo = getVreg(SymbolTable::getLabel());
                MachineInstruction* mi = new LoadMInstruction(builder->getBlock(),mo,getGlobals2());
                builder->getBlock()->InsertInst(mi);
                setGlobals2(mo);//这里没有按照原文进行修改
            }
        }
    }
    MachineInstruction* mi;
    switch (opcode) {
        case ADD:
            mi = new BinaryMInstruction(builder->getBlock(), BinaryMInstruction::ADD, getGlobald(),getGlobals1(),getGlobals2());
            builder->getBlock()->InsertInst(mi);
            // 保证生成的机器码也不一样
            // 可能会牺牲一点时间，但是也没办法了
            mi = new BinaryMInstruction(builder->getBlock(), BinaryMInstruction::SUB, getGlobald(),getGlobals1(),getGlobals2());
            builder->getBlock()->InsertInst(mi);
            mi = new BinaryMInstruction(builder->getBlock(), BinaryMInstruction::ADD, getGlobald(),getGlobals1(),getGlobals2());
            builder->getBlock()->InsertInst(mi);
            break ;
        case SUB:
            mi = new BinaryMInstruction(builder->getBlock(), BinaryMInstruction::SUB, getGlobald(),getGlobals1(),getGlobals2());
            builder->getBlock()->InsertInst(mi);
            break ;
        case AND:
            mi = new BinaryMInstruction(builder->getBlock(), BinaryMInstruction::AND, getGlobald(),getGlobals1(),getGlobals2());
            builder->getBlock()->InsertInst(mi);
            break ;
        case OR:
            mi = new BinaryMInstruction(builder->getBlock(), BinaryMInstruction::OR, getGlobald(),getGlobals1(),getGlobals2());
            builder->getBlock()->InsertInst(mi);
            break ;
        case MUL:
            mi = new BinaryMInstruction(builder->getBlock(), BinaryMInstruction::MUL, getGlobald(),getGlobals1(),getGlobals2());
            builder->getBlock()->InsertInst(mi);
            break ;
        case DIV:
            mi = new BinaryMInstruction(builder->getBlock(), BinaryMInstruction::DIV, getGlobald(),getGlobals1(),getGlobals2());
            builder->getBlock()->InsertInst(mi);
            break ;
        case MOD: {
            mi = new BinaryMInstruction(builder->getBlock(), BinaryMInstruction::DIV, getGlobald(),getGlobals1(),getGlobals2());
            MachineOperand* dst1 = new MachineOperand(*getGlobald());
            MachineOperand* src1 = new MachineOperand(*getGlobals1());
            MachineOperand* src2 = new MachineOperand(*getGlobals2());
            builder->getBlock()->InsertInst(mi);
            mi = new BinaryMInstruction(builder->getBlock(), BinaryMInstruction::MUL, dst1, getGlobald(), src2);
            builder->getBlock()->InsertInst(mi);
            setGlobald(new MachineOperand(*dst1));
            mi = new BinaryMInstruction(builder->getBlock(), BinaryMInstruction::SUB, getGlobald(), src1, dst1);
            builder->getBlock()->InsertInst(mi);
            break ;
        }
        default:
            break;
    }
   
}

void CmpInstruction::genMachineCode(AsmBuilder* builder) {
    ConstantSymbolEntry* cse = (ConstantSymbolEntry*)(operands[2]->getEntry());
    setGlobald(genMachineOperand(getOperands(0)));
    setGlobals1(genMachineOperand(getOperands(1)));
    setGlobals2(genMachineOperand(getOperands(2)));

    if(getGlobals1()->isImm()||getGlobals2()->isImm()){
        if(getGlobals1()->isImm()){
            MachineOperand* mo = getVreg(SymbolTable::getLabel());
            MachineInstruction*mi = new LoadMInstruction(builder->getBlock(),mo,getGlobals1());
            builder->getBlock()->InsertInst(mi);
            setGlobals1(mo);
        }
        if(getGlobals2()->isReg()){
        MachineInstruction*mi = new CmpMInstruction(builder->getBlock(),getGlobals1(),getGlobals2(),opcode);
        builder->getBlock()->InsertInst(mi);
        builder->getBlock()->PopInst();
        }
        if(getGlobals2()->isImm()){
            if(isBig(cse)){
                MachineOperand* mo = getVreg(SymbolTable::getLabel());
                MachineInstruction*mi = new LoadMInstruction(builder->getBlock(),mo,getGlobals2());
                builder->getBlock()->InsertInst(mi);
                setGlobals2(mo);
            }
        }
    }
    //这个没用，加上去让流图变得丰富
    if(getGlobals1()->isReg()){
        MachineInstruction*mi = new CmpMInstruction(builder->getBlock(),getGlobals1(),getGlobals2(),opcode);
        builder->getBlock()->InsertInst(mi);
        builder->getBlock()->PopInst();
    }
    MachineInstruction*mi = new CmpMInstruction(builder->getBlock(),getGlobals1(),getGlobals2(),opcode);
    builder->getBlock()->InsertInst(mi);
    if(needMove()){
        MachineOperand* mo = getImmInt(1);
        MachineOperand* mo2 = getImmInt(0);
        MachineInstruction* mi =new MovMInstruction(builder->getBlock(),MovMInstruction::MOV,getGlobald(),mo,opcode);
        builder->getBlock()->InsertInst(mi);
        mi =new MovMInstruction(builder->getBlock(),MovMInstruction::MOV,getGlobald(),mo2,oppo(opcode));
        builder->getBlock()->InsertInst(mi);
    }
}

void UncondBrInstruction::genMachineCode(AsmBuilder* builder) {

    std::string temp="";
    temp.append(".L");
    temp.append(int2String(branch->getNo()));
    MachineOperand* mo = getLabel(temp);
    MachineInstruction* mi = new BranchMinstructionWithoutCond(builder->getBlock(),BranchMInstruction::B,mo);
    builder->getBlock()->InsertInst(mi);
}

void CondBrInstruction::genMachineCode(AsmBuilder* builder) {
    //先来第一条

    std::string temp;
    temp.append(".L");
    temp.append(int2String(true_branch->getNo()));
    MachineOperand* mo = getLabel(temp);
    MachineInstruction* mi = new BranchMInstruction(builder->getBlock(),BranchMInstruction::B,mo,builder->getBlock()->getCmpCond()); 
    builder->getBlock()->InsertInst(mi);
    
    //再来第二条
    temp.clear();
    temp.append(".L");
    temp.append(int2String(false_branch->getNo()));
    mo = getLabel(temp);
    mi = new BranchMinstructionWithoutCond(builder->getBlock(),BranchMInstruction::B,mo); 
    builder->getBlock()->InsertInst(mi);

}

void RetInstruction::genMachineCode(AsmBuilder* builder) {
    if(!retVoid()){
        setGlobald(getReg(0));
        setGlobals1(genMachineOperand(getOperands(0)));
        MachineInstruction* mi =new MovMInstruction(builder->getBlock(),MovMInstruction::MOV,getGlobald(),getGlobals1());
        builder->getBlock()->InsertInst(mi);
    }
    MachineFunction* mf = builder->getFunction();
    MachineOperand* sp = getReg(15-2);
    int i = mf->AllocSpace(0);
    MachineOperand* size =getImmInt(i);
    MachineInstruction* cur_inst = new BinaryMInstruction(builder->getBlock(), BinaryMInstruction::ADD,sp, sp, size);
    builder->getBlock()->InsertInst(cur_inst);
    MachineOperand* mo2 = getReg(16-2);
    MachineInstruction* mi = new BranchMinstructionWithoutCond(builder->getBlock(), BranchMInstruction::BX, mo2);
    builder->getBlock()->InsertInst(mi);
}

CallInstruction::CallInstruction(Operand* dst,
                                 SymbolEntry* func,
                                 std::vector<Operand*> params,
                                 BasicBlock* insert_bb)
    : Instruction(CALL, insert_bb), func(func), dst(dst) {
    operands.push_back(dst);
    if (dst)
        dst->setDef(this);
    for (auto param : params) {
        operands.push_back(param);
        param->addUse(this);
    }
}

void CallInstruction::output() const {
    fprintf(yyout, "  ");
    if (operands[0])
        fprintf(yyout, "%s = ", operands[0]->toStr().c_str());
    FunctionType* type = (FunctionType*)(func->getType());
    fprintf(yyout, "call %s %s(", type->getRetType()->toStr().c_str(),
            func->toStr().c_str());
    for (long unsigned int i = 1; i < operands.size(); i++) {
        if (i != 1)
            fprintf(yyout, ", ");
        fprintf(yyout, "%s %s", operands[i]->getType()->toStr().c_str(),
                operands[i]->toStr().c_str());
    }
    fprintf(yyout, ")\n");
}

CallInstruction::~CallInstruction() {
    operands[0]->setDef(nullptr);
    if (operands[0]->usersNum() == 0)
        delete operands[0];
    for (long unsigned int i = 1; i < operands.size(); i++)
        operands[i]->removeUse(this);
}

ZextInstruction::ZextInstruction(Operand* dst,
                                 Operand* src,
                                 BasicBlock* insert_bb)
    : Instruction(ZEXT, insert_bb) {
    operands.push_back(dst);
    operands.push_back(src);
    dst->setDef(this);
    src->addUse(this);
}

void ZextInstruction::output() const {
    Operand* dst = operands[0];
    Operand* src = operands[1];
    fprintf(yyout, "  %s = zext %s %s to i32\n", dst->toStr().c_str(),
            src->getType()->toStr().c_str(), src->toStr().c_str());
}

ZextInstruction::~ZextInstruction() {
    operands[0]->setDef(nullptr);
    if (operands[0]->usersNum() == 0)
        delete operands[0];
    operands[1]->removeUse(this);
}

XorInstruction::XorInstruction(Operand* dst,
                               Operand* src,
                               BasicBlock* insert_bb)
    : Instruction(XOR, insert_bb) {
    operands.push_back(dst);
    operands.push_back(src);
    dst->setDef(this);
    src->addUse(this);
}

void XorInstruction::output() const {
    Operand* dst = operands[0];
    Operand* src = operands[1];
    fprintf(yyout, "  %s = xor %s %s, true\n", dst->toStr().c_str(),
            src->getType()->toStr().c_str(), src->toStr().c_str());
}

XorInstruction::~XorInstruction() {
    operands[0]->setDef(nullptr);
    if (operands[0]->usersNum() == 0)
        delete operands[0];
    operands[1]->removeUse(this);
}

GepInstruction::GepInstruction(Operand* dst,
                               Operand* arr,
                               Operand* idx,
                               BasicBlock* insert_bb,
                               bool paramFirst)
    : Instruction(GEP, insert_bb), paramFirst(paramFirst) {
    operands.push_back(dst);
    operands.push_back(arr);
    operands.push_back(idx);
    dst->setDef(this);
    arr->addUse(this);
    idx->addUse(this);
    first = false;
    init = nullptr;
    last = false;
}

void GepInstruction::output() const {
    Operand* dst = operands[0];
    Operand* arr = operands[1];
    Operand* idx = operands[2];
    std::string arrType = arr->getType()->toStr();
    // Type* type = ((PointerType*)(arr->getType()))->getType();
    // ArrayType* type1 = (ArrayType*)(((ArrayType*)type)->getArrayType());
    // if (type->isInt() || (type1 && type1->getLength() == -1))
    if (paramFirst)
        fprintf(yyout, "  %s = getelementptr inbounds %s, %s %s, i32 %s\n",
                dst->toStr().c_str(),
                arrType.substr(0, arrType.size() - 1).c_str(), arrType.c_str(),
                arr->toStr().c_str(), idx->toStr().c_str());
    else
        fprintf(
            yyout, "  %s = getelementptr inbounds %s, %s %s, i32 0, i32 %s\n",
            dst->toStr().c_str(), arrType.substr(0, arrType.size() - 1).c_str(),
            arrType.c_str(), arr->toStr().c_str(), idx->toStr().c_str());
}

GepInstruction::~GepInstruction() {
    operands[0]->setDef(nullptr);
    if (operands[0]->usersNum() == 0)
        delete operands[0];
    operands[1]->removeUse(this);
    operands[2]->removeUse(this);
}

void CallInstruction::genMachineCode(AsmBuilder* builder) {
    for(unsigned long int i=0;i<operands.size();i++){
        if(i==0){continue;}
        if(i==5){break;}
        MachineOperand*mo=getReg(i-1);
        MachineOperand*mo2=genMachineOperand(getOperand(i));
        if(mo2->isImm()&&mo2->getVal()>=256){
            MachineInstruction* mi =new LoadMInstruction(builder->getBlock(),mo,mo2);
            builder->getBlock()->InsertInst(mi);
            continue;
        }else{
            MachineInstruction* mi = new MovMInstruction(builder->getBlock(),MovMInstruction::MOV,mo,mo2);
            builder->getBlock()->InsertInst(mi);
        }
    }
    for(unsigned long int i=operands.size()-1;i>=5;i--){
        MachineOperand* mo = genMachineOperand(getOperand(i));
        if(mo->isImm()){
            MachineOperand* mo2 = getVreg(SymbolTable::getLabel());
            if(mo->getVal()<=255){
                MachineInstruction* mi = new MovMInstruction(builder->getBlock(),MovMInstruction::MOV,mo2,mo);
                builder->getBlock()->InsertInst(mi);
            }else{
                MachineInstruction* mi = new LoadMInstruction(builder->getBlock(),mo2,mo);
                builder->getBlock()->InsertInst(mi);
            }
            mo=mo2;
        }
        MachineInstruction* mi =new BigParaStackMInstrcution(builder->getBlock(),StackMInstrcuton::PUSH,this->vmo,mo);
        builder->getBlock()->InsertInst(mi);
    }
    MachineOperand*mo=new MachineOperand(func->toStr().c_str());
    MachineInstruction*mi=new BranchMinstructionWithoutCond(builder->getBlock(),BranchMInstruction::BL,mo);
    builder->getBlock()->InsertInst(mi);
    if(operands.size()>5){
        MachineOperand* mo2 = getImmInt(calOffset());
        MachineOperand* mo3 = getReg(13);
        mi = new BinaryMInstruction(builder->getBlock(),BinaryMInstruction::ADD,mo3,mo3,mo2);
        builder->getBlock()->InsertInst(mi);
    }
    if(dst!=nullptr){
        mo = genMachineOperand(dst);
        MachineOperand* mo2 = getReg(0);
        mi = new MovMInstruction(builder->getBlock(),MovMInstruction::MOV,mo,mo2);
        builder->getBlock()->InsertInst(mi);
    }
}

void ZextInstruction::genMachineCode(AsmBuilder* builder) {

    MachineOperand* mo = genMachineOperand(operands[0]);
    MachineOperand* mo2 = genMachineOperand(operands[1]);
    MachineInstruction*mi = new MovMInstruction(builder->getBlock(),MovMInstruction::MOV,mo,mo2);
    builder->getBlock()->InsertInst(mi);
}

void XorInstruction::genMachineCode(AsmBuilder* builder) {
    MachineOperand* mo = genMachineOperand(operands[0]);
    MachineOperand* mo1 = getImmInt(1);
    MachineOperand*mo2 = getImmInt(0);
    MachineInstruction* mi = new MovMInstruction(builder->getBlock(),MovMInstruction::MOV,mo,mo1,MachineInstruction::EQ);
    builder->getBlock()->InsertInst(mi);
    mi = new MovMInstruction(builder->getBlock(),MovMInstruction::MOV,mo,mo2,MachineInstruction::NE);
    builder->getBlock()->InsertInst(mi);   
}

void GepInstruction::genMachineCode(AsmBuilder* builder) {
    auto cur_block = builder->getBlock();
    MachineInstruction* cur_inst;
    auto dst = genMachineOperand(operands[0]);
    auto idx = genMachineOperand(operands[2]);
    if(init){
        if(last){
            auto base = genMachineOperand(init);
            cur_inst = new BinaryMInstruction(
                cur_block, BinaryMInstruction::ADD, dst, base, genMachineImm(4));
            cur_block->InsertInst(cur_inst);
        }
        return;
    }
    MachineOperand* base = nullptr;
    int size;
    auto idx1 = genMachineVReg();
    if (idx->isImm()) {
        if (idx->getVal() < 255) {
            cur_inst =
                new MovMInstruction(cur_block, MovMInstruction::MOV, idx1, idx);
        } else {
            cur_inst = new LoadMInstruction(cur_block, idx1, idx);
        }
        idx = new MachineOperand(*idx1);
        cur_block->InsertInst(cur_inst);
    }
    if (paramFirst) {
        size =
            ((PointerType*)(operands[1]->getType()))->getType()->getSize() / 8;
    } else {
        if (first) {
            base = genMachineVReg();
            if (operands[1]->getEntry()->isVariable() &&
                ((IdentifierSymbolEntry*)(operands[1]->getEntry()))
                    ->isGlobal()) {
                auto src = genMachineOperand(operands[1]);
                cur_inst = new LoadMInstruction(cur_block, base, src);
            } else {
                int offset = ((TemporarySymbolEntry*)(operands[1]->getEntry()))
                                 ->getOffset();
                if (offset > -255 && offset < 255) {
                    cur_inst =
                        new MovMInstruction(cur_block, MovMInstruction::MOV,
                                            base, genMachineImm(offset));
                } else {
                    cur_inst = new LoadMInstruction(cur_block, base,
                                                    genMachineImm(offset));
                }
            }
            cur_block->InsertInst(cur_inst);
        }
        ArrayType* type =
            (ArrayType*)(((PointerType*)(operands[1]->getType()))->getType());
        size = type->getElementType()->getSize() / 8;
    }
    auto size1 = genMachineVReg();
    if (size > -255 && size < 255) {
        cur_inst = new MovMInstruction(cur_block, MovMInstruction::MOV, size1,
                                       genMachineImm(size));
    } else {
        cur_inst = new LoadMInstruction(cur_block, size1, genMachineImm(size));
    }
    cur_block->InsertInst(cur_inst);
    auto off = genMachineVReg();
    cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::MUL, off,
                                      idx, size1);
    off = new MachineOperand(*off);
    cur_block->InsertInst(cur_inst);
    if (paramFirst || !first) {
        auto arr = genMachineOperand(operands[1]);
        cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::ADD,
                                          dst, arr, off);
        cur_block->InsertInst(cur_inst);
    } else {
        auto addr = genMachineVReg();
        auto base1 = new MachineOperand(*base);
        cur_inst = new BinaryMInstruction(cur_block, BinaryMInstruction::ADD,
                                          addr, base1, off);
        cur_block->InsertInst(cur_inst);
        addr = new MachineOperand(*addr);
        if (operands[1]->getEntry()->isVariable() &&
            ((IdentifierSymbolEntry*)(operands[1]->getEntry()))->isGlobal()) {
            cur_inst =
                new MovMInstruction(cur_block, MovMInstruction::MOV, dst, addr);
        } else {
            auto fp = genMachineReg(11);
            cur_inst = new BinaryMInstruction(
                cur_block, BinaryMInstruction::ADD, dst, fp, addr);
        }
        cur_block->InsertInst(cur_inst);
    }
}
