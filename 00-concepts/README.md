# Basics of MS-DOS

* _MS-DOS_ stands for _Microsoft Disk Operating System_
* Released 1981
* x86 architecture (16-bit)
* 109 terminal commands ([most common](https://www.tipsandtricks-hq.com/list-of-useful-and-frequently-used-dos-commands-317))
* TASM (1989) = Turbo Assembler (a Borland product)
* MASM (1981) = Macro Assembler (a Microsoft product). Often mistaken for "Microsoft Assembler"

## [Ideal mode](https://cse.hkust.edu.hk/~cktang/cs180/tasm.htm#:~:text=Turbo%20Assembler%20offers%20a%20directive,for%20expressions%20and%20instruction%20operands.)
Turbo Assembler offers a directive called IDEAL mode. This mode is useful for beginning assembly programmers because it is cleaner and easier to understand. It also assembles faster than MASM mode. Ideal mode offers a new syntax for expressions and instruction operands. It is, however, similar to MASM syntax so as not to be too confusing.


| **Name** | **Code** | **Data** |                **Assumptions**               |                                                                **Description**                                                                |
|:--------:|:--------:|:--------:|:--------------------------------------------:|:---------------------------------------------------------------------------------------------------------------------------------------------:|
|   tiny   |   near   |   near   |         cs = dgroup<br>ds = ss = dgroup         |                                      Code, data, and stack in one 64K segment. Use for .COM programs only                                     |
|   small  |   near   |   near   |          cs = _text<br>ds = ss = dgroup         |          Code and data in separate 64K segments. Use for small programs. Best choice for most stand-alone assembly language programs          |
|  medium  |    far   |   near   |      cs = \<module\>_text<br>ds = ss = dgroup     |                                   Data limited to one 64K segment. Use for large programs with minimal data                                   |
|  compact |   near   |    far   |          cs = _text<br>ds = ss = dgroup         |         Code limited to one 64K segment. Unlimited data size. Use for small-to medium- size programs with many or very large variables        |
|   large  |    far   |    far   |      cs = \<module\>_text<br>ds = ss = dgroup     |        Unlimited code and data sizes. Use for large program and data storage require- ments, as long as no single variable exceeds 64K.       |
|   huge   |    far   |    far   |      cs = \<module\>_text<br>ds = ss = dgroup     | Unlimited code and data sizes. Identical to the large memory model. (The huge model is provided for compatibility with high-level languages). |
|  tchuge  |    far   |    far   | cs = \<module\>_text<br>ds = nothing<br>ss = nothing |         Same as the large memory model, but with a different register assumptions. Use mostly for Turbo C and Borland C++ programming.        |
|  tpascal |   near   |    far   |       cs = code<br>ds = data<br>ss = nothing       |                         Provided for backwards support for early versions of Turbo Pascal. Obsolte for Borland Pascal.                        |
|   flat   |   near   |   near   |           cs = _text<br>ds = ss = flat          |                                     For use with OS/2 only; otherwise the same as the small memory model.                                     |