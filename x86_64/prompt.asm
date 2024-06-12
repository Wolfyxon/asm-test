section .data
    question db "What's your name?", 0xA ; Declare initial question
    question_len equ $ - question ; Calculate question length

    greeting db "Hello, " ; Declare greeting
    greeting_len equ $ - greeting ; Calculate greeting length

    name_len equ 128 ; Specify max name length

section .bss
    name resb name_len ; Allocate name

section .text
    global _start

    _start:
        ; -- Prompt --

        ; Print question
        mov rsi, question      ; Specify string
        mov rdx, question_len  ; Specify string length
        call print

        ; Read input and wait
        call read

        ; -- Response --

        ; Print greeting
        mov rsi, greeting       ; Specify string
        mov rdx, greeting_len   ; Specify string length
        call print

        ; Print name
        mov rsi, name
        mov rdx, name_len
        call print

        ; End program
        call exit

    ; void exit()
    exit:
        mov eax, 60 ; sys_exit
        mov rdi, 0  ; Exit code 0
        syscall

    ; void print(rsi string, rdx length)
    print:
        mov eax, 1 ; sys_write
        mov rdi, 1 ; stdout
        syscall

        ret

    ; rsi read()
    read:
        mov eax, 0         ; sys_read
        mov rdi, 0         ; stdin
        mov rsi, name      ; Specify output variable to write the string to
        mov rdx, name_len  ; Specify the string length
        syscall
        ret