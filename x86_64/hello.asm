section .data
    ; Define variables
    message     db "Helo my fred", 0xA ; Define message string. 0xA - newline
    message_len equ $ - message        ; Calculate length of message

section .text
    global _start

    _start:
        ; Print message
        mov rax, 1              ; sys_write
        mov rdi, 1              ; stdout (output mode)
        mov rsi, message        ; specify data
        mov rdx, message_len    ; specify data length 
        syscall

        ; Exit program (not exiting will cause a segmentation fault)
        mov eax, 60  ; 60 - sys_exit
        mov rdi, 0   ; exit code 0
        syscall

