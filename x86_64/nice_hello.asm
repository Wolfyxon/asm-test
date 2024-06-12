section .data
    ; Define variables
    message     db "Helo my fred", 0xA ; Define message string. 0xA - newline
    message_len equ $ - message        ; Calculate length of message

section .text
    global _start

    ; Init function
    _start:

        ; Run print(message, message_len)
        mov rsi, message        ; specify data
        mov rdx, message_len    ; specify data length 
        call print              ; Execute

        ; Run exit()
        call exit

    ; Exits the program
    ; void exit()
    exit:
        mov eax, 60  ; 60 - sys_exit
        mov rdi, 0   ; exit code 0
        syscall

    ; Outputs a message
    ; void print(rsi string, rdx length)
    print:
        ; Prepare output
        mov rax, 1              ; sys_write
        mov rdi, 1              ; stdout (output mode)
        syscall

        ret ; Return to the previous function


    
