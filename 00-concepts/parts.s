; Retrieved from Mastering Turbo Assembler by Tom Swan.

; ****************************** HEADER ******************************
; Contains setup information. 
; There are some commands and directives, none of which produces any
; machine code in the final product.
; Instructs the assembler to perform certain actions, generating the
; finished code file according to various options at your disposal.

; Describes the purpose of the program.
% TITLE "--TASM Example--"

; Switches on Turbo Assembler's Ideal mode.
; Offers a new syntax (similar to MASM) for expressions and
; instructions operands.
; Assembles faster than MASM mode.
; Ideal mode: https://cse.hkust.edu.hk/~cktang/cs180/tasm.htm.
; Not necessary for MASM syntax
IDEAL
; Select the memory model.
MODEL   small
; Reserve space for the program's stack, an area of memory that stores
; two kinds of data: temporal values stored by passed to subroutines
; and the address to which routines return control.
; 256 bytes.
; Most programs require only a small stack.
STACK   256



; **************************** EQUATES AREA ***************************
; Declares symbols to which you assign various expressions and constant
; values.
; Lets refer to expressions, strings, and other values by name, making
; programs easier to read and modify.
; EQU can declare all kinds of equates including numbers, expressions,
; character string. Cannot change the symbol's associated value.
; = (equal sign) can declare only numeric equates (values or
; expressions). Can change its value anywhere in the program, not just
; in the equate section. Assembly language instructions can never
; assign new vales to equated symbols.

MAX_SIZE    EQU 10
ELEMENTS    EQU 20
TOTAL_SIZE  =   MAX_SIZE * ELEMENTS
STRING      EQU "Hello, friend!"
SIZE        =   0



; *************************** DATA SECTION ****************************
; Declares variables to be stored in memory.
; Store variables inside the program's data segment (64K in the small
; memory model).
; Can store two kinds of variables: initialized and uninitialized.
DATASEG

; Reserving space for variables
; 25 bytes variable size
number      DB  25
; 10 word variable size
rows        DW  10

ex_code     DB  0

; Variables are guaranteed to follow each other inside the data segment.
alphabet1   DB  "ABCDEFGHIJKLM"
alphabet2   DB  "NOPQRSTUVWXYZ"

; A char is 1 byte (1 char in ASCII code).
char        DB  "A"

; Declare individual characters and byte values, separated by commas
list_nums   DB  0, 1, 2, 3, 4, 5, 6, 7, 8, 9
time        DB  21, 37              ; 21:37
date        DB  5, 3, 22            ; 05/03/2022
date_time   DB  5, 3, 22, 21, 37    ; 05/03/2022 21:37

; Max value in 1 byte = 8 bits -> 2^8 = 256



; ******************************* BODY ********************************
; Contains the actual program code.
; Also known "the code segment".
; Contains program's assembled code.
; Divided in four columns: label, mnemonic, operands and comment

CODESEG

start:      mov         ax, @data       ; Initialize DS to address
            mov         ds, ax          ; of data segment
            jmp         exit            ; Jump to exit label
            mov         cx, 10          ; This line is skipped

exit:       mov         ah, 0x4C        ; DOS function: exit program
            mov         al, [ex_code]   ; Return exit code value
            int         12h             ; Call DOS. Terminate program



; ****************************** CLOSING ******************************
; Marks the end of the source-code text.
; Single line that tells TASM it has reached the end of the program.
; After END directive, you must specify the label where you want the
; program to begin running.
END     start                           ; End of program / Entry point

