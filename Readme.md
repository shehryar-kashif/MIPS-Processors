# MIPS Processor Implementations in Verilog

## Overview
This repository contains three different implementations of the MIPS processor, written in Verilog:
1. **Single Cycle MIPS Processor** (with testbenches)
2. **Multicycle MIPS Processor** (with testbenches)
3. **Pipeline MIPS Processor** (without testbenches)

Each folder in the repository corresponds to one of the processor architectures, and all designs are modular, with individual Verilog modules for different components of the processor.

## Folder Structure
The repository is organized into three main folders:
- `Single_Cycle_Processor/`: Contains the Verilog modules and testbenches for the Single Cycle MIPS processor.
- `Multicycle_Processor/`: Contains the Verilog modules and testbenches for the Multicycle MIPS processor.
- `Pipeline_Processor/`: Contains the Verilog modules for the Pipeline MIPS processor (no testbenches).

---

## 1. Single Cycle MIPS Processor
The **Single Cycle MIPS Processor** executes each instruction in one clock cycle. This folder contains the following Verilog modules along with their respective testbenches:

### Modules:
- **ALU.v**: Arithmetic Logic Unit to perform arithmetic and logical operations.
- **Control.v**: Control unit to generate control signals based on the instruction opcode.
- **DataMem.v**: Data memory module for load/store instructions.
- **InstrMem.v**: Instruction memory to store the instruction set.
- **PC.v**: Program counter to hold the address of the next instruction.
- **RegFile.v**: Register file to hold the processor’s general-purpose registers.
- **topLevel.v**: The top-level module that integrates all components into a functional processor.

### Testbenches:
Each module has its corresponding testbench to verify its functionality.

---

## 2. Multicycle MIPS Processor
The **Multicycle MIPS Processor** breaks instruction execution into multiple clock cycles, improving resource utilization. This design spreads instruction execution across stages such as fetch, decode, execute, memory access, and write-back.

### Modules:
- **ALU.v**: Arithmetic Logic Unit for executing operations.
- **ControlUnit.v**: Finite state machine that generates control signals based on the current state and opcode.
- **PC.v**: Program counter that manages instruction sequencing.
- **TopLevel.v**: Top-level module integrating all the components of the processor.
- **ALUControl.v**: Determines the operation to be performed by the ALU.
- **Memory.v**: Handles both instruction and data memory.
- **RegFile.v**: General-purpose register file.
- **tempRegs.v**: Temporary registers used to hold intermediate values between cycles.

### Testbenches:
Each module is accompanied by a testbench to verify its behavior.

---

## 3. Pipeline MIPS Processor
The **Pipeline MIPS Processor** overlaps the execution of multiple instructions to improve throughput. This implementation divides the instruction execution into stages and pipelines the operations.

### Modules:
- **ALU.v**: Performs arithmetic and logic operations.
- **ALUControl.v**: Generates control signals for the ALU.
- **Control.v**: Generates the control signals for the pipeline stages.
- **DataMem.v**: Data memory for load and store instructions.
- **InstrMem.v**: Instruction memory module.
- **PC.v**: Program counter to hold the address of the current instruction.
- **PipelinePcsr.v**: Pipeline processor top-level module, integrating all pipeline stages.
- **RegFile.v**: Register file for general-purpose registers.
- **Registers.v**: Pipeline registers to store intermediate values between pipeline stages.

### Note:
This implementation does not include testbenches, but the modules are ready for testing.

---

## How to Use
1. **Clone the repository**: `git clone https://github.com/shehryar-kashif/MIPS-Processors.git`
2. **Simulate the processors**: Use any Verilog simulator such as ModelSim, Xilinx Vivado, or ISE to run the testbenches and simulate the designs. Do provide appropriate initialization files (InstrMem.txt, RegFile.txt) for testing instruction and register file contents.

## Acknowledgements
This Project was built as a part of Computer Systems Architecture course.
