# RISC
RISC-V RV32I RTL Design using Verilog HDL 
Introduction
A RISC-V ISA is defined as a base integer ISA, which must be present in any implementation, plus
optional extensions to the base ISA. The base integer ISAs are very similar to that of the early
RISC processors except with no branch delay slots and with support for optional variable-length
instruction encodings. A base is carefully restricted to a minimal set of instructions sufficient to
provide a reasonable target for compilers, assemblers, linkers, and operating systems (with additional privileged operations), and so provides a convenient ISA and software toolchain “skeleton” around which more customized processor ISAs can be built.There are two primary base integer variants, RV32I and RV64I here we are going to see about RV32I.
