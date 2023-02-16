#include "Instruction.h"
#include <iostream>
#include <sstream>
#include "BasicBlock.h"
#include "Function.h"
#include "Type.h"
#include <cmath>
extern FILE* yyout;

const int MAX_SIZE=256;

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

CondBrInstruction::CondBrInstruction(BasicBlock* true_branch, BasicBlock* false_branch, Operand* cond, BasicBlock* insert_bb)
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
    
}

LoadInstruction::LoadInstruction(Operand* dst, Operand* src_addr, BasicBlock* insert_bb)
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
}

MachineOperand* Instruction::genMachineVReg() {
    //在这里为什么用symbolTable的值？
    return getVreg(SymbolTable::getLabel());
}

MachineOperand* Instruction::genMachineImm(int val) {
    return getImmInt(val);
}

MachineOperand* Instruction::genMachineLabel(int block_no) {

    std::string s="";
    s.append(".L");
    s.append(int2String(block_no));
    return getLabel(s);

}

void AllocaInstruction::genMachineCode(AsmBuilder* builder) {
    /* HINT:
     * Allocate stack space for local variabel
     * Store frame offset in symbol entry */
    MachineFunction* mf = builder->getFunction();
    //先不考虑数组，就是根据32bit而言要除8
    //为指令的目的操作数在栈内分配空间
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
        //加载一个全局变量或者常量
        //需要两条指令，第一条指令在全局地址标签中将地址加载到寄存器
        MachineOperand* d = genMachineOperand(operands[0]);
        MachineOperand* t = genMachineVReg();
        MachineOperand* s = genMachineOperand(operands[1]);
        //把地址先存到一个temp里面
        MachineInstruction* mi = new LoadMInstruction(builder->getBlock(),t,s);
        builder->getBlock()->InsertInst(mi);
        //temp再给真正要接受的寄存器
        mi = new LoadMInstruction(builder->getBlock(),d,t);
        builder->getBlock()->InsertInst(mi);
        return ;
    }
    //就是说通过fp去找我想要加载的东西，fp相当于基地址存在
    if(operands[1]->getEntry()->isTemporary() &&  fastDef(operands[1]) && operands[1]->getDef()->isAlloc()){
        //栈内偏移指令
        MachineOperand* d = genMachineOperand(operands[0]);
        //取出栈内偏移
        int o = ((TemporarySymbolEntry*)(operands[1]->getEntry()))->getOffset();
        MachineOperand* s2 = getImmInt(o);
        MachineOperand* s = getReg(11);
        //如果偏移常数太大，就load
        if(abs(o)>=256){
            MachineOperand* t= genMachineVReg();
            builder->getBlock()->InsertInst(new LoadMInstruction(builder->getBlock(),t,s2));
            s2 = getImmInt(256);
            builder->getBlock()->InsertInst(new LoadMInstruction(builder->getBlock(),t,s2));
            s2 = getImmInt(255);
            builder->getBlock()->PopInst();
            s2 = t;
        }
        //如果偏移常数不大或者load完了
        MachineInstruction* mi = new LoadMInstruction(builder->getBlock(),d,s,s2);
        builder->getBlock()->InsertInst(mi);
        return ;
    }
    //直接加载寄存器保存的地址里面的东西
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
        setGlobals(d);
    }else{
        MachineOperand* kk = getImmInt(11);
        MachineOperand* tt = getGlobald();
        setGlobald(kk);
        std::string s=getGlobald()->getLabel();
        setGlobald(tt);
    }
    //要存的位置是函数里面的那些变量
    if (getOperands(0)->getEntry()->isTemporary() && fastDef(getOperands(0)) &&operands[0]->getDef()->isAlloc()) {
         //所以需要找帧指针然后从符号表拿偏移
        MachineOperand* s = genMachineReg(11);
        int o = ((TemporarySymbolEntry*)(getOperands(0)->getEntry()))->getOffset();
        MachineOperand* s2 = getImmInt(o);
        //如果这个偏移太大，需要用寄存器来保存这个数
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
         MachineOperand* kk = getImmInt(12);
        MachineOperand* tt = getGlobald();
        setGlobald(kk);
        std::string s=getGlobald()->getLabel();
        setGlobald(tt);
        s.append("reg");
    }
    //加载全局变量，也是两步走
    //先把地址拿出来放到一个temp里面
    IdentifierSymbolEntry* ise = (IdentifierSymbolEntry*)(operands[0]->getEntry());
    if(operands[0]->getEntry()->isVariable() && (fastIsGlobal(ise))) {
        MachineOperand* t = getVreg(SymbolTable::getLabel());
        //先是加载地址
        MachineInstruction* mi = new LoadMInstruction(builder->getBlock(),t,getGlobald());
        builder->getBlock()->InsertInst(mi);
        //然后从地址取内容
        mi = new StoreMInstruction(builder->getBlock(),getGlobals(),t);
        builder->getBlock()->InsertInst(mi);
        return ;
    }else{
        MachineInstruction* mi = new LoadMInstruction(builder->getBlock(),getGlobald(),getGlobald());
        builder->getBlock()->InsertInst(mi);
        builder->getBlock()->end();
        builder->getBlock()->PopInst();
    }
    //相当于这个东西是一个数组指针
    //把第一个操作数和第二个操作数按位置放在里面就可以
    if(operands[0]->getType()->isPtr()){
        MachineInstruction* mi = new StoreMInstruction(builder->getBlock(),getGlobals(),getGlobald());
        builder->getBlock()->InsertInst(mi);
        return ;
    }
}

void BinaryInstruction::genMachineCode(AsmBuilder* builder) {
    ConstantSymbolEntry* cse = (ConstantSymbolEntry*)(operands[2]->getEntry());
    //把三个操作数拿到
    setGlobald(genMachineOperand(operands[0]));
    setGlobals1(genMachineOperand(operands[1]));
    setGlobals2(genMachineOperand(operands[2]));

    //这里就是做判断，如果立即数大于256，那还是不能放到#后面
    //需要放到寄存器里处理
    if(getGlobals1()->isImm()||getGlobals2()->isImm()){
        if(getGlobals1()->isImm()){
            MachineOperand* mo = getVreg(SymbolTable::getLabel());
            MachineInstruction* mi = new LoadMInstruction(builder->getBlock(),mo,getGlobals1());
            builder->getBlock()->InsertInst(mi);
            setGlobals1(mo);
        }
        if(getGlobals2()->isImm()){
            if((isSmallCal(opcode)&&isBig(cse))||!isSmallCal(opcode)){
                MachineOperand* mo = getVreg(SymbolTable::getLabel());
                MachineInstruction* mi = new LoadMInstruction(builder->getBlock(),mo,getGlobals2());
                builder->getBlock()->InsertInst(mi);
                setGlobals2(mo);
            }
        }
    }
    //这个就是根据每个运算不同生成代码了
    MachineInstruction* mi;
    switch (opcode) {
        case ADD:
            mi = new BinaryMInstruction(builder->getBlock(), BinaryMInstruction::ADD, getGlobald(),getGlobals1(),getGlobals2());
            builder->getBlock()->InsertInst(mi);
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
            //因为ARM没有直接的取模，只能除看整数是多少然后乘，乘完了再减
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
    //加载要比较的对象
    setGlobald(genMachineOperand(getOperands(0)));
    setGlobals1(genMachineOperand(getOperands(1)));
    setGlobals2(genMachineOperand(getOperands(2)));

    //同样也是先判断 如果是立即数的话立即数不能太大
    //太大直接load进寄存器比较
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
    MachineInstruction*mi = new CmpMInstruction(builder->getBlock(),getGlobals1(),getGlobals2(),opcode);
    builder->getBlock()->InsertInst(mi);
    //cmp指令之后，有可能要用那个比较后的bool值
    //把1和0赋给临时变量充当比较的东西
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

    //使用string拼接出要跳转的地方
    std::string temp="";
    temp.append(".L");
    temp.append(int2String(branch->getNo()));
    MachineOperand* mo = getLabel(temp);//跳转目的操作数的生成
    MachineInstruction* mi = new BranchMinstructionWithoutCond(builder->getBlock(),BranchMInstruction::B,mo);
    builder->getBlock()->InsertInst(mi);
}

void CondBrInstruction::genMachineCode(AsmBuilder* builder) {
    //先来第一条正确的块
    std::string temp;
    temp.append(".L");
    temp.append(int2String(true_branch->getNo()));
    MachineOperand* mo = getLabel(temp);//要跳转的truebranch的块号
    //cmpcond就是保存在block里的比较的操作码
    int cc=builder->getBlock()->getCmpCond();
    MachineInstruction* mi = new BranchMInstruction(builder->getBlock(),BranchMInstruction::B,mo,cc); 
    builder->getBlock()->InsertInst(mi);
    
    //再来第二条去到相反的块
    temp.clear();
    temp.append(".L");
    temp.append(int2String(false_branch->getNo()));
    mo = getLabel(temp);
    mi = new BranchMinstructionWithoutCond(builder->getBlock(),BranchMInstruction::B,mo); 
    builder->getBlock()->InsertInst(mi);

}

//(1)有返回值，直接保存到R0中
//(2)生成ADD指令来恢复栈空间
//(3)生成pop指令来恢复寄存器
void RetInstruction::genMachineCode(AsmBuilder* builder) {
    if(!retVoid()){
        //如果有返回值
        //那就把存返回变量的那个位置放到r0上
        setGlobald(getReg(0));
        setGlobals1(genMachineOperand(getOperands(0)));
        MachineInstruction* mi =new MovMInstruction(builder->getBlock(),MovMInstruction::MOV,getGlobald(),getGlobals1());
        builder->getBlock()->InsertInst(mi);
    }
    //恢复栈空间，让sp加上开辟的那个空间大小
    MachineFunction* mf = builder->getFunction();
    MachineOperand* sp = getReg(13);
    int i = mf->getSpace();//获取栈的大小
    MachineOperand* size =getImmInt(i);
    MachineInstruction* cur_inst = new BinaryMInstruction(builder->getBlock(), BinaryMInstruction::ADD,sp, sp, size);
    builder->getBlock()->InsertInst(cur_inst);
    MachineOperand* mo2 = getReg(14);//拿到返回链接寄存器
    //无条件跳转
    //返回的时候会pop恢复寄存器
    MachineInstruction* mi = new BranchMinstructionWithoutCond(builder->getBlock(), BranchMInstruction::BX, mo2);
    builder->getBlock()->InsertInst(mi);
}

//能load4个是肯定的
void CallInstruction::genMachineCode(AsmBuilder* builder) {
    //r0-r3是留给参数的，所以只能先加载4个
    for(unsigned long int i=1;i<operands.size()&&i<=4;i++){
        MachineOperand*mo=getReg(i-1);
        MachineOperand*mo2=genMachineOperand(getOperand(i));
        //大于立即数能达到的最大，如果参数是个立即数的情况
        if(mo2->isImm()&&mo2->getVal()>=256){
            MachineInstruction* mi =new LoadMInstruction(builder->getBlock(),mo,mo2);
            builder->getBlock()->InsertInst(mi);
            continue;
        }else{
            MachineInstruction* mi = new MovMInstruction(builder->getBlock(),MovMInstruction::MOV,mo,mo2);
            builder->getBlock()->InsertInst(mi);
        }
    }
    //然后处理剩下的
    for(unsigned long int i=operands.size()-1;i>=5;i--){
        //最终要放到vmo里的，他们超过了最大限度三个，所以加载的时候只能把他们都压到一个vector李然后在func真正被加载的时候
        //根据给予r3在哪里的偏移去把这些东西取回来
        MachineOperand* mo = genMachineOperand(getOperand(i));
        if(mo->isImm()){
            MachineOperand* mo2 = getVreg(SymbolTable::getLabel());
            if(abs(mo->getVal())<=255){
                MachineInstruction* mi = new MovMInstruction(builder->getBlock(),MovMInstruction::MOV,mo2,mo);
                builder->getBlock()->InsertInst(mi);
            }else{
                MachineInstruction* mi = new LoadMInstruction(builder->getBlock(),mo2,mo);
                builder->getBlock()->InsertInst(mi);
            }
            mo=mo2;
        }
        //然后就可以把所有在vmo的东西全都push
        MachineInstruction* mi =new BigParaStackMInstrcution(builder->getBlock(),StackMInstrcuton::PUSH,this->vmo,mo);
        builder->getBlock()->InsertInst(mi);
    }
    //BL跳转会在寄存器R14 中保存PC 的当前内容
    MachineOperand*mo=new MachineOperand(func->toStr().c_str());
    MachineInstruction*mi=new BranchMinstructionWithoutCond(builder->getBlock(),BranchMInstruction::BL,mo);
    builder->getBlock()->InsertInst(mi);
    if(operands.size()>5){
        MachineOperand* mo2 = getImmInt(calOffset());//计算需要多分配的空间
        MachineOperand* mo3 = getReg(13);
        mi = new BinaryMInstruction(builder->getBlock(),BinaryMInstruction::ADD,mo3,mo3,mo2);
        builder->getBlock()->InsertInst(mi);
    }
    if(dst!=nullptr){
        //有返回值 先保存一下R0的内容
        mo = genMachineOperand(dst);
        MachineOperand* mo2 = getReg(0);
        mi = new MovMInstruction(builder->getBlock(),MovMInstruction::MOV,mo,mo2);
        builder->getBlock()->InsertInst(mi);
    }
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
    initOperand = nullptr;
    last = false;
}

void GepInstruction::output() const {
    
}

GepInstruction::~GepInstruction() {
    operands[0]->setDef(nullptr);
    if (operands[0]->usersNum() == 0)
        delete operands[0];
    operands[1]->removeUse(this);
    operands[2]->removeUse(this);
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
    
    setGlobald(genMachineOperand(getOperands(0)));
    setGlobali1(genMachineOperand(getOperands(2)));


    if(initOperand){
        if(last){
            MachineOperand*mo = genMachineOperand(initOperand);
            MachineInstruction*mi = new BinaryMInstruction(builder->getBlock(),BinaryInstruction::SUB,getGlobald(),mo,getImmInt(4));
            builder->getBlock()->InsertInst(mi);
            return;
        }
        return;
    }


    setGlobalb1(nullptr);
    setGlobali2(getVreg(SymbolTable::getLabel()));
    if(getGlobali1()->isImm()){
        if(getGlobali1()->getVal()<MAX_SIZE-1){
            MachineInstruction*mi=new MovMInstruction(builder->getBlock(),MovMInstruction::MOV,getGlobali2(),getGlobali1());
            setGlobali1(new MachineOperand(*(getGlobali2())));
            builder->getBlock()->InsertInst(mi);
        }else{
            MachineInstruction*mi = new LoadMInstruction(builder->getBlock(),getGlobali2(),getGlobali1());
            setGlobali1(new MachineOperand(*(getGlobali2())));
            builder->getBlock()->InsertInst(mi);
        }
    }


    if(paramFirst){
        GepSize=((PointerType*)(operands[1]->getType()))->getType()->getSize() / getHalf(16);
    }


    else{
        if(first){
            setGlobalb1(genMachineVReg());
            if(getOperands(1)->getEntry()->isVariable()&&((IdentifierSymbolEntry*)(operands[1]->getEntry()))->isGlobal()){
                MachineOperand*mo1=genMachineOperand(getOperands(1));
                MachineInstruction*mi=new LoadMInstruction(builder->getBlock(),getGlobalb1(),mo1);
                builder->getBlock()->InsertInst(mi);
            }else{
                int bias = ((TemporarySymbolEntry*)(operands[1]->getEntry()))->getOffset();
                if(abs(bias)<MAX_SIZE-1){
                    MachineInstruction*mi=new MovMInstruction(builder->getBlock(), MovMInstruction::MOV,getGlobalb1(),getImmInt(bias));
                    builder->getBlock()->InsertInst(mi);
                }
                else{
                    MachineInstruction*mi=new LoadMInstruction(builder->getBlock(),getGlobalb1(),getImmInt(bias));
                    builder->getBlock()->InsertInst(mi);
                }
            }
        }
        ArrayType* type =(ArrayType*)(((PointerType*)(operands[1]->getType()))->getType());
        GepSize = type->getElementType()->getSize() / getHalf(16);
    }

    MachineOperand*mo1=getVreg(SymbolTable::getLabel());
    if(abs(GepSize)<MAX_SIZE-1){
        MachineInstruction*mi=new MovMInstruction(builder->getBlock(),MovMInstruction::MOV,mo1,getImmInt(GepSize));
        builder->getBlock()->InsertInst(mi);
    }else{
        MachineInstruction*mi=new LoadMInstruction(builder->getBlock(),mo1,getImmInt(GepSize));
        builder->getBlock()->InsertInst(mi);
    }

    MachineOperand*mo2=getVreg(SymbolTable::getLabel());
    MachineInstruction*mi=new BinaryMInstruction(builder->getBlock(),BinaryMInstruction::MUL,mo2,getGlobali1(),mo1);
    mo2=new MachineOperand(*mo2);//我觉得这句话没用
    builder->getBlock()->InsertInst(mi);



    if(paramFirst||!first){
        MachineOperand*mo3=genMachineOperand(getOperands(1));
        MachineInstruction*mi=new BinaryMInstruction(builder->getBlock(),BinaryMInstruction::ADD,getGlobald(),mo3,mo2);
        builder->getBlock()->InsertInst(mi);
    }
    else{
        MachineOperand*mo3=getVreg(SymbolTable::getLabel());
        MachineOperand*mo4=new MachineOperand(*(getGlobalb1()));
        MachineInstruction*mi=new BinaryMInstruction(builder->getBlock(),BinaryMInstruction::ADD,mo3,mo4,mo2);
        builder->getBlock()->InsertInst(mi);
        mo3=new MachineOperand(*mo3);//不知道这有啥用
        if(getOperands(1)->getEntry()->isVariable()&&((IdentifierSymbolEntry*)(getOperands(1)->getEntry()))->isGlobal()){
            MachineInstruction*mi=new MovMInstruction(builder->getBlock(),MovMInstruction::MOV,getGlobald(),mo3);
            builder->getBlock()->InsertInst(mi);
        }else{
            MachineInstruction*mi=new BinaryMInstruction(builder->getBlock(),BinaryMInstruction::ADD,getGlobald(),getReg(11),mo3);
            builder->getBlock()->InsertInst(mi);
        }
    }
}
