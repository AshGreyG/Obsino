---
tags:
  - computer-engineering
  - computer-architecture
book: Digital Design and Computer Architecture Risc-V Edition
date: 2026-01-02
---

## 1 Introduction

+ [o] Two specifications: SystemVerilog and VHDL
+ [ ] Module:
+ [o] The two major purpose of HDLs are logic **simulation** and **synthesis**.
  During simulation, inputs are applied to a module and the outputs are checked
  to verify that the module operates correctly. During synthesis, the textual
  description of a module is transformed into logic gates.
  + simulation: waveform of the circuit.
  + synthesis: divide HDL into **synthesizable** modules and a **testbench**.
    + The synthesizable modules describe the hardware.
    + The testbench contains code to apply inputs to a module, check whether
      the output results are correct, and print discrepancies between expected
      and actual outputs. Testbench code is intended only for simulation and
      cannot be synthesized.
+ [ ] little-endian order
+ [ ] big-endian order

## 2 Hardware Description Language

+ [o] In general, complex systems are designed **hierarchically**. The overall
  system is described structurally by instantiating its major components. Each
  of these components is described structurally from its building blocks and
  so forth recursively until the pieces are simple enough to describe behaviorally.