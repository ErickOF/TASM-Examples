# 8086 Registers

* General-purpose registers (ax, bx, cx, dx)
  * Subdivided intro high and low 8-bit halves.
    * ax : ah-al
    * bx : bh-bl
    * cx : ch-cl
    * dx : dh-dl
  * **Important**: changing the value in the 16-bit register also
  change the register's two 8-bit halves.
* Pointer and index registers (sp, bp, si, di)
* Segment registers (cs, ds, ss, es)
* Instruction pointer (ip)
* Flags (of, df, if, tf, sf, zf, af, pf, cf)

## General-purpose registers
General use (but not mandatory):

* **AX (accumulator):** usually use to accumulate the result of
  additions, subtractions, and so forth.
* **BX (Base):** often points to the starting address (called the
  base) of structure in memory.
* **CX (Count):** frequently specifies the number of times some
  operation is to repeat.
* **DX (Data):** most often holds data, perhaps passed through
  subroutine for processing.


## Pointer and index registers
For specific operations:

* **SP (Stack pointer):** always points to the top of the
  processor's stack.
* **BS (Base pointer):** usually addresses variables stored inside
  the stack.
* **SI (Source index):** serve as workhorses for easing the load of
  processing byte strings.
* **DI (Destination index):** serve as workhorses for easing the 
  load of processing byte strings.


## Segment registers
Locate the start of four 64K segments in memory. A program is free
to allocate more than four segments but, in that case, has to swap
the correct values in and out of one or more segments registers to
address the additional segments.

Highly specialized. Can't perform math on them or use to hold the
results of other operations.

* **CS (Code segment):** addresses the start of the program's
  machine code in memory.
* **DS (Data segment):** addresses the start of the program's
  variables.
* **SS (Stack segment):** locates the start of the program's
  stack space.
* **ES (Extra segment):** locates an additional data segment if
  needed, although in many programs. ES and DS addresses the same
  memory, facilitating some operations tied to these registers.


## Instruction pointer
* **IP (Instruction pointer):**
  * Specifies the next machine-code instruction to be executed,
    relative to the segment located by CS.
  * Rarely refer directly.
  * Some instructions change IP to alter the location of the next
    instruction to be executed, thus changing the flow of the 
    program.


# Flags
Register of 16-bits wide, but only 9 bits are used. The other 7
bits are no use to programs.

| **Symbol** |     **Full Name**       | **Bit** |
|:----------:|:-----------------------:|:-------:|
|  o or of   |      Overflow flag      |    B    |
|  d or df   |     Direction flag      |    A    |
|  i or if   |  Interrupt enable flag  |    9    |
|  t or tf   | Trap (single-step) flag |    8    |
|  s or sf   |        Sign flag        |    7    |
|  z or zf   |        Zero flag        |    6    |
|  a or af   |     Auxiliary flag      |    4    |
|  p or pf   |       Parity flag       |    2    |
|  c or cf   |        Carry flag       |    0    |
