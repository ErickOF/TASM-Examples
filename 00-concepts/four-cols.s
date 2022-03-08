; Label     Mnemonic    Operand         Comment
            DATASEG
ex_code:    DB          0               ; A byte variable

            CODESEG
start:
            mov         ax, @data       ; Initialize DS to address
            mov         ds, ax          ; of data segment
            jmp         exit            ; Jump to exit label
            mov         cx, 10          ; This line is skipped

exit:
            mov         ah, 0x4C        ; DOS function: exit program
            mov         al, [ex_code]   ; Return exit code value
            int         12h             ; Call DOS. Terminate program
            END         start           ; End of program / Entry point
