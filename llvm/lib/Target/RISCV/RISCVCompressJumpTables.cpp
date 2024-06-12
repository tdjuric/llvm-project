//==-- RISCVCompressJumpTables.cpp - Compress jump tables for RISCV --====//

#include "RISCV.h"
#include "RISCVMachineFunctionInfo.h"
#include "RISCVSubtarget.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/CodeGen/MachineFunctionPass.h"
#include "llvm/CodeGen/MachineJumpTableInfo.h"
#include "llvm/CodeGen/TargetInstrInfo.h"
#include "llvm/CodeGen/TargetSubtargetInfo.h"
#include "llvm/MC/MCContext.h"
#include "llvm/Support/Debug.h"

using namespace llvm;


#define DEBUG_TYPE "riscv-jump-tables"

STATISTIC(NumJT8, "Number of jump-tables with 1-byte entries");
STATISTIC(NumJT16, "Number of jump-tables with 2-byte entries");
STATISTIC(NumJT32, "Number of jump-tables with 4-byte entries"); 

namespace {
class RISCVCompressJumpTables : public MachineFunctionPass {
  const TargetInstrInfo *TII;
  MachineFunction *MF;
  SmallVector<int, 8> BlockInfo;

  int computeBlockSize(MachineBasicBlock &MBB);
  void scanFunction();

  bool compressJumpTable(MachineInstr &MI, int Offset);

public:
  static char ID;
  RISCVCompressJumpTables() : MachineFunctionPass(ID) {
    initializeRISCVCompressJumpTablesPass(*PassRegistry::getPassRegistry());
  }

  bool runOnMachineFunction(MachineFunction &MF) override;

  MachineFunctionProperties getRequiredProperties() const override {
    return MachineFunctionProperties().set(
        MachineFunctionProperties::Property::NoVRegs);
  }
  StringRef getPassName() const override {
    return "RISCV Compress Jump Tables";
  }
};
char RISCVCompressJumpTables::ID = 0;
}

INITIALIZE_PASS(RISCVCompressJumpTables, DEBUG_TYPE,
                "RISCV compress jump tables pass", false, false)

int RISCVCompressJumpTables::computeBlockSize(MachineBasicBlock &MBB) {
  int Size = 0;
  for (const MachineInstr &MI : MBB)
    Size += TII->getInstSizeInBytes(MI);
  return Size;
}

void RISCVCompressJumpTables::scanFunction() {
  BlockInfo.clear();
  BlockInfo.resize(MF->getNumBlockIDs());

  int Offset = 0;
  for (MachineBasicBlock &MBB : *MF) {
    BlockInfo[MBB.getNumber()] = Offset;
    Offset += computeBlockSize(MBB);
  }
}

bool RISCVCompressJumpTables::compressJumpTable(MachineInstr &MI, int Offset) {
  if (MI.getOpcode() != RISCV::JumpTableDest32)
    return false;

  int JTIdx = MI.getOperand(4).getIndex();
  auto &JTInfo = *MF->getJumpTableInfo();
  const MachineJumpTableEntry &JT = JTInfo.getJumpTables()[JTIdx];

  // The jump-table might have been optimized away.
  if (JT.MBBs.empty())
    return false;

  int MaxOffset = std::numeric_limits<int>::min(),
      MinOffset = std::numeric_limits<int>::max();
  MachineBasicBlock *MinBlock = nullptr;
  for (auto Block : JT.MBBs) {
    int BlockOffset = BlockInfo[Block->getNumber()];
    //assert(BlockOffset % 4 == 0 && "misaligned basic block");

    MaxOffset = std::max(MaxOffset, BlockOffset);
    if (BlockOffset <= MinOffset) {
      MinOffset = BlockOffset;
      MinBlock = Block;
    }
  }

  // The ADR instruction needed to calculate the address of the first reachable
  // basic block can address +/-1MB.
  if (!isInt<21>(MinOffset - Offset)) {
    ++NumJT32;
    return false;
  }

  int Span = MaxOffset - MinOffset;
  auto AFI = MF->getInfo<RISCVMachineFunctionInfo>();
  if (isUInt<8>(Span / 4)) {
    AFI->setJumpTableEntryInfo(JTIdx, 1, MinBlock->getSymbol());
    MI.setDesc(TII->get(RISCV::JumpTableDest8));
    ++NumJT8;
    return true;
  } else if (isUInt<16>(Span / 4)) {
    AFI->setJumpTableEntryInfo(JTIdx, 2, MinBlock->getSymbol());
    MI.setDesc(TII->get(RISCV::JumpTableDest16));
    ++NumJT16;
    return true;
  }

  ++NumJT32;
  return false;
}



bool RISCVCompressJumpTables::runOnMachineFunction(MachineFunction &MFIn) {
  bool Changed = false;
  MF = &MFIn;

  const auto &ST = MF->getSubtarget<RISCVSubtarget>();
  TII = ST.getInstrInfo();

  if (ST.force32BitJumpTables() && !MF->getFunction().hasOptSize())
    return false;

  scanFunction();

  for (MachineBasicBlock &MBB : *MF) {
    int Offset = BlockInfo[MBB.getNumber()];
    for (MachineInstr &MI : MBB) {
      Changed |= compressJumpTable(MI, Offset);
      Offset += TII->getInstSizeInBytes(MI);
    }
  }

  return Changed;
}

FunctionPass *llvm::createRISCVCompressJumpTablesPass() {
  return new RISCVCompressJumpTables();
}
