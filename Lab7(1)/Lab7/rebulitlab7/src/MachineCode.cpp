#include "MachineCode.h"
#include <iostream>
#include "Type.h"
//向字符输入和结果输出文件的指针
extern FILE* yyout;
int MachineBlock::label = 0;

//如果操作数是立即数或者寄存器（包括虚拟寄存器？）
MachineOperand::MachineOperand(int tp, int val)
{
    this->type = tp;
    if(tp == MachineOperand::IMM)
        this->val = val;
    else 
        this->reg_no = val;
}
//label是通过构造的时候传入的
MachineOperand::MachineOperand(std::string label)
{
    this->type = MachineOperand::LABEL;
    this->label = label;
}

bool MachineOperand::operator==(const MachineOperand&a) const
{
    //label不能判断
    if (this->type != a.type)//类型
        return false;
    if (this->type == IMM)//立即数
        return this->val == a.val;
    if(this->type == LABEL) //标签的判断（自己加的）
        return this->label == a.label;
    return this->reg_no == a.reg_no;//寄存器
}

bool MachineOperand::operator<(const MachineOperand&a) const
{
    if(this->type == a.type)
    {
        if(this->type == IMM)
            return this->val < a.val;
        return this->reg_no < a.reg_no;
    }
    return this->type < a.type;

    if (this->type != a.type)
        return false;
    if (this->type == IMM)
        return this->val == a.val;
    return this->reg_no == a.reg_no;
}

void MachineOperand::PrintReg()
{
    switch (reg_no)
    {
    case 11:
        //FP：栈顶指针，指向一个栈帧的顶部，当函数发生跳转时，会记录当时的栈的起始位置。
        fprintf(yyout, "fp");
        break;
    case 13:
        //SP：栈指针（也称为栈底指针），指向栈当前的位置
        fprintf(yyout, "sp");
        break;
    case 14:
        //LR：链接寄存器，保存函数返回的地址。
        fprintf(yyout, "lr");
        break;
    case 15:
        //PC也叫计数寄存器，用于存放下一条要执行的指令的地址，
        //因此在子程序返回后，要将LR中的地址存入PC，即mov PC LR
        fprintf(yyout, "pc");
        break;
    default:
        fprintf(yyout, "r%d", reg_no);
        break;
    }
}

void MachineOperand::output() 
{
    /* HINT：print operand
    * Example:
    * immediate num 1 -> print #1;
    * register 1 -> print r1;
    * lable addr_a -> print addr_a; */
    switch (this->type)
    {
    case IMM:
        fprintf(yyout, "#%d", this->val);
        break;
    case VREG:
        fprintf(yyout, "v%d", this->reg_no);
        break;
    case REG:
        PrintReg();
        break;
    case LABEL:
        //通过传入的label判断的
        //如果开头是.L就一起全都输出
        if (this->label.substr(0, 2) == ".L")
        {
            fprintf(yyout, "%s", this->label.c_str());
            return ;
        }
        //开头是@就不输出@
        else if (this->label.substr(0, 1) == "@"){
            int n = this->label.size();
            std::string temp = this->label.substr(1,n);
            fprintf(yyout, "%s", temp.c_str());
            return ;
        }
        //否则就输出addr_开头的东西
        //看起来这个是全局变量
        else{
            fprintf(yyout, "addr_%s%d", this->label.c_str(), parent->getParent()->getParent()->getParent()->getUnitLabel());
            return ;
        }
    default:
        break;
    }
}

void MachineInstruction::PrintCond()
{
    // TODO
    switch (cond)
    {
    case LT:
        fprintf(yyout, "lt");
        break;
    case EQ:
        fprintf(yyout, "eq");
        break;
    case NE:
        fprintf(yyout, "ne");
        break;
    case LE:
        fprintf(yyout, "le");
        break;
    case GT:
        fprintf(yyout, "gt");
        break;
    case GE:
        fprintf(yyout, "ge");
        break;
    default:
        break;
    }
}

void MachineInstruction::insertBeforeBlock(MachineInstruction* i){
    //这俩函数有点牛逼，全注释了也能过，不太懂
    std::vector<MachineInstruction*>insts = parent->getInsts();
    for(std::vector<MachineInstruction*>::iterator iter=insts.begin();iter!=insts.end();iter++){
        if( (*iter) == this){
            insts.insert(iter,i);
            break;
        }
    }
}

void MachineInstruction::insertAfterBlock(MachineInstruction* i){
    //这俩函数有点牛逼，全注释了也能过，不太懂
    std::vector<MachineInstruction*>insts = parent->getInsts();
    bool flag=false;
    bool ifinsert=false;
    for(std::vector<MachineInstruction*>::iterator iter=insts.begin();iter!=insts.end();iter++){
        if(flag){
            insts.insert(iter,i);
            ifinsert=true;
            break;
        }
        if( (*iter) == this){
            flag=true;
            continue;
        }
    }
    if(flag&&!ifinsert){
        insts.push_back(i);
    }
}


BinaryMInstruction::BinaryMInstruction(
    MachineBlock* p, int op, 
    MachineOperand* dst, MachineOperand* src1, MachineOperand* src2, 
    int cond)
{
    this->parent = p;
    this->type = MachineInstruction::BINARY;
    this->op = op;
    this->cond = cond;
    //目的操作数放到def
    this->def_list.push_back(dst);
    //两个源操作数放到use
    this->use_list.push_back(src1);
    this->use_list.push_back(src2);
    dst->setParent(this);
    src1->setParent(this);
    src2->setParent(this);
}

void BinaryMInstruction::output() 
{
    // TODO: 
    // Complete other instructions
    switch (this->op)
    {
    case BinaryMInstruction::ADD:
        fprintf(yyout, "\tadd ");
        this->PrintCond();
        this->def_list[0]->output();
        fprintf(yyout, ", ");
        this->use_list[0]->output();
        fprintf(yyout, ", ");
        this->use_list[1]->output();
        fprintf(yyout, "\n");
        break;
    case BinaryMInstruction::SUB:
        fprintf(yyout, "\tsub ");
        this->PrintCond();
        this->def_list[0]->output();
        fprintf(yyout, ", ");
        this->use_list[0]->output();
        fprintf(yyout, ", ");
        this->use_list[1]->output();
        fprintf(yyout, "\n");
        break;
    case BinaryMInstruction::AND:
        fprintf(yyout, "\tand ");
        this->PrintCond();
        this->def_list[0]->output();
        fprintf(yyout, ", ");
        this->use_list[0]->output();
        fprintf(yyout, ", ");
        this->use_list[1]->output();
        fprintf(yyout, "\n");
        break;
    case BinaryMInstruction::OR:
        fprintf(yyout, "\torr ");
        this->PrintCond();
        this->def_list[0]->output();
        fprintf(yyout, ", ");
        this->use_list[0]->output();
        fprintf(yyout, ", ");
        this->use_list[1]->output();
        fprintf(yyout, "\n");
        break;
    case BinaryMInstruction::MUL:
        fprintf(yyout, "\tmul ");
        this->PrintCond();
        this->def_list[0]->output();
        fprintf(yyout, ", ");
        this->use_list[0]->output();
        fprintf(yyout, ", ");
        this->use_list[1]->output();
        fprintf(yyout, "\n");
        break;
    case BinaryMInstruction::DIV:
        fprintf(yyout, "\tsdiv ");
        this->PrintCond();
        this->def_list[0]->output();
        fprintf(yyout, ", ");
        this->use_list[0]->output();
        fprintf(yyout, ", ");
        this->use_list[1]->output();
        fprintf(yyout, "\n");
        break;
    default:
        break;
    }
}

LoadMInstruction::LoadMInstruction(MachineBlock* p,
    MachineOperand* dst, MachineOperand* src1, MachineOperand* src2,
    int cond)
{
    this->parent = p;
    this->type = MachineInstruction::LOAD;
    this->op = -1;//这个op为啥是-1啊，不懂
    this->cond = cond;
    this->def_list.push_back(dst);
    this->use_list.push_back(src1);
    if (src2)
        this->use_list.push_back(src2);
    dst->setParent(this);
    src1->setParent(this);
    if (src2)
        src2->setParent(this);
}
//load是把后面的取出到前面
void LoadMInstruction::output()
{
    //LDR 指令用于从内存中将一个 32 位的字读取到目标寄存器。
    fprintf(yyout, "\tldr ");
    //目的寄存器
    this->def_list[0]->output();//machineOperand的output
    fprintf(yyout, ", ");

    // Load immediate num, eg: ldr r1, =8
    if(this->use_list[0]->isImm())
    {
        fprintf(yyout, "=%d\n", this->use_list[0]->getVal());
        return;
    }

    // Load address 
    // 要取出的值在寄存器里
    if(this->use_list[0]->isReg()||this->use_list[0]->isVReg())
        fprintf(yyout, "[");

    this->use_list[0]->output();
    if( this->use_list.size() > 1 )
    {
        fprintf(yyout, ", ");
        this->use_list[1]->output();
    }

    if(this->use_list[0]->isReg()||this->use_list[0]->isVReg())
        fprintf(yyout, "]");
    fprintf(yyout, "\n");
}

StoreMInstruction::StoreMInstruction(MachineBlock* p,
    MachineOperand* src1, MachineOperand* src2, MachineOperand* src3, 
    int cond)
{
    // TODO
    // 这个要自己写
    this->parent=p;
    this->type = MachineInstruction::STORE;
    this->op = -1;//这个操作码有点魔幻
    this->cond = cond;
    //store里面都是用到的，和加载中的def不一样，所以这里只需要有use_list的更新
    this->use_list.push_back(src1);
    this->use_list.push_back(src2);
    if(src3){
        this->use_list.push_back(src3);
    }
    src1->setParent(this);
    src2->setParent(this);
    if (src3)
        src3->setParent(this);

}
//store是把前面的保存到后面
void StoreMInstruction::output()
{
    // TODO
    // 这个也是自己写
    fprintf(yyout, "\tstr ");
    this->use_list[0]->output();
    fprintf(yyout, ", ");
    //STR不存在用LDR伪装的=赋值行为，直接判断寄存器就可以
    if (this->use_list[1]->isReg() || this->use_list[1]->isVReg())
        fprintf(yyout, "[");
    //输出寄存器or输出立即数
    this->use_list[1]->output();
    //如果是三个操作数就输出第三个操作数
    if (this->use_list.size() > 2) {
        fprintf(yyout, ", ");
        this->use_list[2]->output();
    }
    //括号闭合
    if (this->use_list[1]->isReg() || this->use_list[1]->isVReg())
        fprintf(yyout, "]");
    fprintf(yyout, "\n");
}

MovMInstruction::MovMInstruction(MachineBlock* p, int op, 
    MachineOperand* dst, MachineOperand* src,
    int cond)
{
    // TODO
    // 这个需要自己写
    this->parent = p;
    this->type = MachineInstruction::MOV;
    this->op = op; //这个op要靠进来的时候传进来
    this->cond = cond;
    this->def_list.push_back(dst);
    this->use_list.push_back(src);
    dst->setParent(this);
    src->setParent(this);
}

void MovMInstruction::output() 
{
    // TODO
    // 这个需要自己写
    // 可以是立即数也可以是寄存器
    fprintf(yyout, "\tmov");
    //这个为啥woc
    // MOV{条件}{S}  目的寄存器，源操作数 这个真的牛逼
    // 不加102就错，加了也不知道哪用了
    PrintCond();
    fprintf(yyout, " ");
    this->def_list[0]->output();
    fprintf(yyout, ", ");
    this->use_list[0]->output();
    fprintf(yyout, "\n");
}

BranchMInstruction::BranchMInstruction(MachineBlock* p, int op, MachineOperand* dst, int cond)
{
    // TODO
    // 需要自己写
    this->parent = p;
    this->type = MachineInstruction::BRANCH;
    this->op = op; //是哪种分支
    this->cond = cond;
    // 目标存在use_list
    this->use_list.push_back(dst);
    dst->setParent(this);
}

void BranchMInstruction::output()
{
    // TODO
    // 需要自己写
    switch (op) {
        case B:
            // 跳转的类型
            fprintf(yyout, "\tb");
            // 条件
            PrintCond();
            fprintf(yyout, " ");
            this->use_list[0]->output();
            fprintf(yyout, "\n");
            break;
        // 感觉后面这俩基本都用不到PrintCond
        // 所以就先把这个PrintCond给注释了
        case BX:
            fprintf(yyout, "\tbx");
            //PrintCond();
            fprintf(yyout, " ");
            this->use_list[0]->output();
            fprintf(yyout, "\n");
            break;
        case BL:
            fprintf(yyout, "\tbl");
            //PrintCond();
            fprintf(yyout, " ");
            this->use_list[0]->output();
            fprintf(yyout, "\n");
            break;
    }
}

BranchMinstructionWithoutCond::BranchMinstructionWithoutCond(MachineBlock* p, int op, MachineOperand* dst)
{
    // TODO
    // 需要自己写
    this->parent = p;
    this->type = MachineInstruction::BRANCH;
    this->op = op; //是哪种分支
    // 目标存在use_list
    this->use_list.push_back(dst);
    dst->setParent(this);
}

void BranchMinstructionWithoutCond::output(){
    // TODO
    // 需要自己写
    switch (op) {
        case B:
            // 跳转的类型
            fprintf(yyout, "\tb");
            // 条件
            fprintf(yyout, " ");
            this->use_list[0]->output();
            fprintf(yyout, "\n");
            break;
        // 感觉后面这俩基本都用不到PrintCond
        // 所以就先把这个PrintCond给注释了
        case BX:
            fprintf(yyout, "\tbx");
            fprintf(yyout, " ");
            this->use_list[0]->output();
            fprintf(yyout, "\n");
            break;
        case BL:
            fprintf(yyout, "\tbl");
            fprintf(yyout, " ");
            this->use_list[0]->output();
            fprintf(yyout, "\n");
            break;
    }
}

CmpMInstruction::CmpMInstruction(MachineBlock* p, 
    MachineOperand* src1, MachineOperand* src2, 
    int cond)
{
    // TODO
    // 这个也需要自己写
    this->parent = p;
    this->type = MachineInstruction::CMP;
    this->op = -1;
    this->cond = cond;
    p->setCmpCond(cond); //把比较的类型放上
    this->use_list.push_back(src1);
    this->use_list.push_back(src2);
    src1->setParent(this);
    src2->setParent(this);
}

void CmpMInstruction::output()
{
    // TODO
    // Jsut for reg alloca test
    // delete it after test
    // 这里CMP只需要输出两个比较的对象就好了，不需要做其他的判断
    // 接下来bxx由Branch搞定
    fprintf(yyout, "\tcmp ");
    this->use_list[0]->output();
    fprintf(yyout, ", ");
    this->use_list[1]->output();
    fprintf(yyout, "\n");
}

// 意思是这个构造函数被弃用了
// 看吧 合适的时候可以调这个构造函数
StackMInstrcuton::StackMInstrcuton(MachineBlock* p, int op, 
    MachineOperand* src,
    int cond)
{
    // TODO
    // 这个也是自己写的
    this->parent = p;
    // 常规的一些设置
    this->type = MachineInstruction::STACK;
    this->op = op;
    this->cond = cond;
    this->use_list.push_back(src);
    src->setParent(this);
}

BigParaStackMInstrcution::BigParaStackMInstrcution( MachineBlock* p,
                     int op,
                     std::vector<MachineOperand*> srcs,
                     MachineOperand* src,
                     MachineOperand* src1,
                     int cond){
    this->parent = p;
    // 常规的一些设置
    this->type = MachineInstruction::STACK;
    this->op = op;
    this->cond = cond;
    // 直接给我了一个vector，里面全都是操作数，不知道有什么用
    // 但是他没给vector里的东西弄set_parents，所以可以想象是可以用完就扔的东西
    if(!srcs.empty()){
        for(unsigned long long int i=0;i<srcs.size();i++){
            this->use_list.push_back(srcs[i]);
        }
    }
    // 只给单独输入的这个操作数有setParent
    this->use_list.push_back(src);
    src->setParent(this);
    // 声明的时候src1可以没有
    if (src1) {
        this->use_list.push_back(src1);
        src1->setParent(this);
    }
}

void BigParaStackMInstrcution::output(){
    // TODO
    // 这也是自己写的
    // 先选择是压还是入
    switch (op) {
        case PUSH:
            fprintf(yyout, "\tpush ");
            break;
        case POP:
            fprintf(yyout, "\tpop ");
            break;
    }
    fprintf(yyout, "{");
    for (long unsigned int i = 0; i < use_list.size(); i++) {
        if(i>0){
            fprintf(yyout, ", ");
        }
        this->use_list[i]->output();
    }
    fprintf(yyout, "}\n");
}

void StackMInstrcuton::output()
{
    // TODO
    // 这也是自己写的
    // 先选择是压还是入
    switch (op) {
        case PUSH:
            fprintf(yyout, "\tpush ");
            break;
        case POP:
            fprintf(yyout, "\tpop ");
            break;
    }
    fprintf(yyout, "{");
    for (long unsigned int i = 0; i < use_list.size(); i++) {
        if(i>0){
            fprintf(yyout, ", ");
        }
        this->use_list[i]->output();
    }
    fprintf(yyout, "}\n");
}

MachineFunction::MachineFunction(MachineUnit* p, SymbolEntry* sym_ptr) 
{ 
    this->parent = p; 
    this->sym_ptr = sym_ptr; 
    this->stack_size = 0;
    this->paraSize =((FunctionType*)(sym_ptr->getType()))->getParamsSe().size();
};

void MachineBlock::output()
{   
   bool first = true;
    int offset = (parent->getSavedRegs().size() + 2) * 4;
    int num = parent->getparaSize();
    int count = 0;
    if (!inst_list.empty()) {
        fprintf(yyout, ".L%d:\n", this->no);
        for (auto it = inst_list.begin(); it != inst_list.end(); it++) {
            if ((*it)->isSpecialBranch()) {
                
                auto fp = new MachineOperand(MachineOperand::REG, 11);
                auto lr = new MachineOperand(MachineOperand::REG, 14);
                auto cur_inst =
                    new BigParaStackMInstrcution(this, StackMInstrcuton::POP,
                                         parent->getSavedRegs(), fp, lr);
                cur_inst->output();
            }
            if (num > 4 && (*it)->isStore()) {
                MachineOperand* operand = (*it)->getUse()[0];
                if (operand->isReg() && operand->getReg() == 3) {
                    if (first) {
                        first = false;
                    } else {
                        auto fp = new MachineOperand(MachineOperand::REG, 11);
                        auto r3 = new MachineOperand(MachineOperand::REG, 3);
                        auto off =
                            new MachineOperand(MachineOperand::IMM, offset);
                        offset += 4;
                        auto cur_inst = new LoadMInstruction(this, r3, fp, off);
                        cur_inst->output();
                    }
                }
            }
            if ((*it)->isSpecialADD()) {
                auto dst = (*it)->getDef()[0];
                auto src1 = (*it)->getUse()[0];
                if (dst->isReg() && dst->getReg() == 13 && src1->isReg() &&
                    src1->getReg() == 13 && (*(it + 1))->isSpecialBranch()) {
                    int size = parent->AllocSpace(0);
                    if (size < -255 || size > 255) {
                        auto r1 = new MachineOperand(MachineOperand::REG, 1);
                        auto off =
                            new MachineOperand(MachineOperand::IMM, size);
                        (new LoadMInstruction(nullptr, r1, off))->output();
                        (*it)->getUse()[1]->setReg(1);
                    } else
                        (*it)->getUse()[1]->setVal(size);
                }
            }
            (*it)->output();
            count++;
            if (count % 500 == 0) {
                fprintf(yyout, "\tb .B%d\n", label);
                fprintf(yyout, ".LTORG\n");
                parent->getParent()->printGlobal();
                fprintf(yyout, ".B%d:\n", label++);
            }
        }
    }
}

// 相当于是把所有存的reg都打包返回了
// 不知道reg这玩意是怎么传进去的
std::vector<MachineOperand*> MachineFunction::getSavedRegs() {
    std::vector<MachineOperand*> ret;
    for(std::set<int>::iterator iter=saved_regs.begin();iter!=saved_regs.end();iter++){
        ret.push_back(new MachineOperand(MachineOperand::REG, (*iter)));
    }
    return ret;
}

void MachineFunction::output()
{   
    // fprintf(yyout, "\t.global %s\n", this->sym_ptr->toStr().c_str() + 1);
    // fprintf(yyout, "\t.type %s , %%function\n",
    //         this->sym_ptr->toStr().c_str() + 1);
    // fprintf(yyout, "%s:\n", this->sym_ptr->toStr().c_str() + 1);
    // TODO
    /* Hint:
     *  1. Save fp
     *  2. fp = sp
     *  3. Save callee saved register
     *  4. Allocate stack space for local variable */
    //框架代码，给好了的
    std::string s = this->sym_ptr->toStr();
    s = s.substr(1,s.size());
    //在这里做了改动，如果之前输入改了这里也要改一下
    const char* func_name = s.c_str();
    fprintf(yyout, "\t.global %s\n", func_name);
    fprintf(yyout, "\t.type %s , %%function\n", func_name);
    fprintf(yyout, "%s:\n", func_name);
    // TODO
    /* Hint:
    *  1. Save fp
    *  2. fp = sp
    *  3. Save callee saved register
    *  4. Allocate stack space for local variable */
    (new BigParaStackMInstrcution(nullptr, BigParaStackMInstrcution::PUSH, getSavedRegs(), getReg(11),getReg(14)))->output();
    (new MovMInstruction(nullptr, MovMInstruction::MOV, getReg(11), getReg(13)))->output();
    int off = myAllocSpace(13,0,14);
    MachineOperand* size = getImm(off);
    if(abs(off)>=256){
        MachineOperand* mo = getReg(4);
        MachineInstruction* mi =new LoadMInstruction(nullptr,mo,size);
        mi->output();
        mi = new BinaryMInstruction(nullptr,BinaryMInstruction::SUB,getReg(13),getReg(13),mo);
        mi->output();
    }else{
        MachineInstruction* mi = new BinaryMInstruction(nullptr,BinaryMInstruction::SUB,getReg(13),getReg(13),size);
        mi->output();
    }
    for(unsigned long int i= 0;i<block_list.size();i++){
        block_list[i]->output();
        this->allSize+=block_list[i]->getInstSize();
        if(allSize > 160){
            fprintf(yyout, "\tb .F%d\n", parent->getUnitLabel());
            fprintf(yyout, ".LTORG\n");
            parent->printGlobal();
            fprintf(yyout, ".F%d:\n", parent->getUnitLabel()-1);
            allSize = 0;
        }
    }
    fprintf(yyout, "\n");


}

void MachineUnit::PrintGlobalDecl()
{
    // TODO
    // 需要自己写
    std::vector<int>choose;
    if (!global_list.empty())
        fprintf(yyout, "\t.data\n");
    for (unsigned long long int i = 0; i < global_list.size(); i++) {
        IdentifierSymbolEntry* se = (IdentifierSymbolEntry*)global_list[i];
        if (se->getConst()) {
            choose.push_back(1);
            //constIdx.push_back(i);
        } else if (se->isAllZero()) {
            choose.push_back(2);
            //zeroIdx.push_back(i);
        } else {
            choose.push_back(3);
        }
    }
    for(unsigned long long int i=0;i<choose.size();i++){
        if(choose[i]==3){
            IdentifierSymbolEntry* se = (IdentifierSymbolEntry*)global_list[i];
            fprintf(yyout, "\t.global %s\n", se->toStr().c_str());
            fprintf(yyout, "\t.align 4\n");
            fprintf(yyout, "\t.size %s, %d\n", se->toStr().c_str(),
                    se->getType()->getSize());
            fprintf(yyout, "%s:\n", se->toStr().c_str());
            if (!se->getType()->isArray()) {
                fprintf(yyout, "\t.word %d\n", se->getValue());
            } 
            //数组
            if(se->getType()->isArray()){
                int n = se->getType()->getSize() / 32;
                int* p = se->getArrayValue();
                for (int i = 0; i < n; i++) {
                    fprintf(yyout, "\t.word %d\n", p[i]);
                }
            }
        }
    }
    fprintf(yyout, "\t.section .rodata\n");
    for(unsigned long long int i=0;i<choose.size();i++){
        if(choose[i]==1){
            IdentifierSymbolEntry* se = (IdentifierSymbolEntry*)global_list[i];
            fprintf(yyout, "\t.global %s\n", se->toStr().c_str());
            fprintf(yyout, "\t.align 4\n");
            fprintf(yyout, "\t.size %s, %d\n", se->toStr().c_str(),
                    se->getType()->getSize());
            fprintf(yyout, "%s:\n", se->toStr().c_str());
            if (!se->getType()->isArray()) {
                fprintf(yyout, "\t.word %d\n", se->getValue());
            } else {
                int n = se->getType()->getSize() / 32;
                int* p = se->getArrayValue();
                for (int i = 0; i < n; i++) {
                    fprintf(yyout, "\t.word %d\n", p[i]);
                }
            }
        }
    }
    for(unsigned long long int i=0;i<choose.size();i++){
        if(choose[i]==2){
            //数组
            IdentifierSymbolEntry* se = (IdentifierSymbolEntry*)global_list[i];
            if (se->getType()->isArray()) {
                fprintf(yyout, "\t.comm %s, %d, 4\n", se->toStr().c_str(),
                        se->getType()->getSize());
            }
        }
    }
}

void MachineUnit::output()
{
    // TODO
    /* Hint:
    * 1. You need to print global variable/const declarition code;
    * 2. Traverse all the function in func_list to print assembly code;
    * 3. Don't forget print bridge label at the end of assembly code!! */
    fprintf(yyout, "\t.arch armv8-a\n");
    fprintf(yyout, "\t.arch_extension crc\n");
    fprintf(yyout, "\t.arm\n");
    PrintGlobalDecl();
    fprintf(yyout, "\t.text\n");
    int k = getUnitLabel();
    fprintf(yyout, "\t@ %d\n",k);
    for(unsigned long long int i=0;i<func_list.size();i++){
        func_list[i]->output();
    }
    printGlobal();
}

void MachineUnit::printGlobal(){
    for (auto s : global_list) {
        IdentifierSymbolEntry* se = (IdentifierSymbolEntry*)s;
        //没有什么用
        changeLabel(1);
        changeLabel(-1);
        //不知道这个unit_label咋来的
        fprintf(yyout, "addr_%s%d:\n", se->toStr().c_str(), this->unitLabel);
        fprintf(yyout, "\t.word %s\n", se->toStr().c_str());
    }
    //这里改了一下 本来应该是1的
    changeLabel(1);
}
