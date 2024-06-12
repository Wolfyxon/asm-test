section .data
    password db "potato4096"
    password_len equ $ - password

section .text
    global _start

    _start:

    exit:
        mov eax, 60 ; sys_exit
        mov rdi, 0  ; Exit code 0
        syscall