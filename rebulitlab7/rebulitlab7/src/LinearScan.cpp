#include "LinearScan.h"
#include <algorithm>
#include <iostream>
#include "LiveVariableAnalysis.h"
#include "MachineCode.h"

MachineOperand* lsgetImmInt(int i){
        return (new MachineOperand(MachineOperand::IMM,i));
    }
MachineOperand* lsgetVreg(int i){
        return (new MachineOperand(MachineOperand::VREG,i));
    }
MachineOperand* lsgetLabel(std::string s){
        return (new MachineOperand(s));
    }
MachineOperand* lsgetReg(int i){
        return (new MachineOperand(MachineOperand::REG,i));
    }
MachineBlock* lsgetBlock(MachineOperand*mo){
        return mo->getParent()->getParent();
    }
void lsInsertBefore(MachineOperand*mo,MachineInstruction*mi,int i){
        mo->getParent()->insertBeforeBlock(mi);
    }
void lsInsertAfter(MachineOperand*mo,MachineInstruction*mi,int i){
        mo->getParent()->insertAfterBlock(mi);
    }




LinearScan::LinearScan(MachineUnit* unit) {
    this->unit = unit;
    // 这里不对r0-r3做分配嘛
    for (int i = 4; i < 11; i++)
        regs.push_back(i);
}

void LinearScan::allocateRegisters() {
    for (auto& f : unit->getFuncs()) {
        func = f;
        bool success;
        success = false;
        while (!success)  // repeat until all vregs can be mapped
        {
            computeLiveIntervals();
            success = linearScanRegisterAllocation();
            if (success)  // all vregs can be mapped to real regs
                modifyCode();
            else  // spill vregs that can't be mapped to real regs
                genSpillCode();
        }
    }
}

void LinearScan::makeDuChains() {
    LiveVariableAnalysis lva;
    lva.pass(func);
    du_chains.clear();
    int i = 0;
    std::map<MachineOperand, std::set<MachineOperand*>> liveVar;
    for (auto& bb : func->getBlocks()) {
        liveVar.clear();
        for (auto& t : bb->getLiveOut())
            liveVar[*t].insert(t);
        int no;
        no = i = bb->getInsts().size() + i;
        for (auto inst = bb->getInsts().rbegin(); inst != bb->getInsts().rend();
             inst++) {
            (*inst)->setNo(no--);
            for (auto& def : (*inst)->getDef()) {
                if (def->isVReg()) {
                    auto& uses = liveVar[*def];
                    du_chains[def].insert(uses.begin(), uses.end());
                    auto& kill = lva.getAllUses()[*def];
                    std::set<MachineOperand*> res;
                    set_difference(uses.begin(), uses.end(), kill.begin(),
                                   kill.end(), inserter(res, res.end()));
                    liveVar[*def] = res;
                }
            }
            for (auto& use : (*inst)->getUse()) {
                if (use->isVReg())
                    liveVar[*use].insert(use);
            }
        }
    }
}

void LinearScan::computeLiveIntervals() {
    makeDuChains();
    intervals.clear();
    for (auto& du_chain : du_chains) {
        int t = -1;
        for (auto& use : du_chain.second)
            t = std::max(t, use->getParent()->getNo());
        Interval* interval = new Interval({du_chain.first->getParent()->getNo(),
                                           t,
                                           false,
                                           0,
                                           0,
                                           {du_chain.first},
                                           du_chain.second});
        intervals.push_back(interval);
    }
    bool change;
    change = true;
    while (change) {
        change = false;
        std::vector<Interval*> t(intervals.begin(), intervals.end());
        for (size_t i = 0; i < t.size(); i++)
            for (size_t j = i + 1; j < t.size(); j++) {
                Interval* w1 = t[i];
                Interval* w2 = t[j];
                if (**w1->defs.begin() == **w2->defs.begin()) {
                    std::set<MachineOperand*> temp;
                    set_intersection(w1->uses.begin(), w1->uses.end(),
                                     w2->uses.begin(), w2->uses.end(),
                                     inserter(temp, temp.end()));
                    if (!temp.empty()) {
                        change = true;
                        w1->defs.insert(w2->defs.begin(), w2->defs.end());
                        w1->uses.insert(w2->uses.begin(), w2->uses.end());
                        w1->start = std::min(w1->start, w2->start);
                        w1->end = std::max(w1->end, w2->end);
                        auto it =
                            std::find(intervals.begin(), intervals.end(), w2);
                        if (it != intervals.end())
                            intervals.erase(it);
                    }
                }
            }
    }
    sort(intervals.begin(), intervals.end(), compareStart);
}

bool LinearScan::linearScanRegisterAllocation() {
    bool ret=true;
    doubleClear();
    for(int i=4;i<=10;i++){
        regs.push_back(i);
    }
    for(auto& i :intervals){
        expireOldIntervals(i);
        if(regs.empty()){
            spillAtInterval(i);
            ret=false;
        }
        else{
            i->rreg=regs.front();
            regs.erase(regs.begin());
            active.push_back(i);
            sort(active.begin(), active.end(), compareEnd);
        }
    }
    return ret;

    // bool success = true;
    // active.clear();
    // regs.clear();
    // for (int i = 4; i < 11; i++)
    //     regs.push_back(i);
    // for (auto& i : intervals) {
    //     expireOldIntervals(i);
    //     if (regs.empty()) {
    //         spillAtInterval(i);
    //         success = false;
    //     } else {
    //         i->rreg = regs.front();
    //         regs.erase(regs.begin());
    //         active.push_back(i);
    //         sort(active.begin(), active.end(), compareEnd);
    //     }
    // }
    // return success;
}

void LinearScan::modifyCode() {
    for (auto& interval : intervals) {
        func->addSavedRegs(interval->rreg);
        for (auto def : interval->defs)
            def->setReg(interval->rreg);
        for (auto use : interval->uses)
            use->setReg(interval->rreg);
    }
}

void LinearScan::genSpillCode() {
    for (auto& interval : intervals) {
        if (!interval->spill)
            continue;

        interval->disp=-func->myAllocSpace(0,4,8);
        MachineOperand* mo = lsgetImmInt(interval->disp);
        MachineOperand* mo2 = lsgetReg(11);

        for(MachineOperand* it:interval->uses){
            MachineOperand* mo3 = new MachineOperand(*it);
            MachineOperand* mo4=nullptr;
            if(abs(interval->disp)>=256){
                mo4=lsgetVreg(SymbolTable::getLabel());
                MachineInstruction*mi=new LoadMInstruction(lsgetBlock(it),mo4,mo);
                lsInsertBefore(it,mi,0);
            }
            if(mo4!=nullptr){
                MachineInstruction*mi=new LoadMInstruction(lsgetBlock(it),mo3,mo2,new MachineOperand(*mo4));
                lsInsertBefore(it,mi,0);
            }
            else{
                MachineInstruction*mi = new LoadMInstruction(lsgetBlock(it),mo3,mo2,mo);
                lsInsertBefore(it,mi,0);
            }
        }
        for(MachineOperand*it:interval->defs){
            MachineOperand*mo3 = new MachineOperand(*it);
            MachineOperand*mo4=nullptr;
            MachineInstruction*mi=nullptr;
            MachineInstruction* mi1=nullptr;
            if(abs(interval->disp)>=256){
                mo4=lsgetVreg(SymbolTable::getLabel());
                mi1=new LoadMInstruction(lsgetBlock(it),mo4,mo);
                lsInsertAfter(it,mi1,0);
            }
            if(mo4!=nullptr){
                mi=new StoreMInstruction(lsgetBlock(it),mo3,mo2,new MachineOperand(*mo4));
            }
            else{
                mi = new StoreMInstruction(lsgetBlock(it),mo3,mo2,mo);
            }
            if(mi1!=nullptr){
                mi1->insertAfterBlock(mi);
            }
            else{
                lsInsertAfter(it,mi,0);
            }
        }

    }
}

void LinearScan::expireOldIntervals(Interval* interval) {
    auto it = active.begin();
    while (it != active.end()) {
        if ((*it)->end >= interval->start)
            return;
        regs.push_back((*it)->rreg);
        it = active.erase(find(active.begin(), active.end(), *it));
        sort(regs.begin(), regs.end());
    }
}

void LinearScan::spillAtInterval(Interval* interval) {
    auto spill = active.back();
    if (spill->end > interval->end) {
        spill->spill = true;
        interval->rreg = spill->rreg;
        active.push_back(interval);
        sort(active.begin(), active.end(), compareEnd);
    } else {
        interval->spill = true;
    }
}

bool LinearScan::compareStart(Interval* a, Interval* b) {
    return a->start < b->start;
}

bool LinearScan::compareEnd(Interval* a, Interval* b) {
    return a->end < b->end;
}