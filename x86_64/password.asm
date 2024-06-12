section .data
    prompt db "Enter password: "
    prompt_len equ $ - prompt

    password_correct db "Welcome back", 0xA
    password_correct_len equ $ - password_correct

    password_incorrect db "Access denied", 0xA
    password_incorrect_len equ $ - password_incorrect

    password db "potato4096";, 0xA
    password_len equ $ - password

section .bss
    input_password resb password_len

section .text
    global _start

    _start:
        ; Print prompt
        mov rsi, prompt
        mov rdx, prompt_len
        call print

        ; Wait for the user to enter the password
        call read


        ; Compare the passwords
                                  ; The entered password is already in rsi
        mov rdi, password         ; Load correct password
        mov rcx, password_len     ; Load length of the correct password
        
        repe cmpsb                ; Run comparasion
        jne _password_incorrect   ; Jump to _password_incorrect if the passwords don't match

        ; Show a correct password message
        mov rsi, password_correct
        mov rdx, password_correct_len
        call print

        ; Exit
        call exit

    _password_incorrect:
        ; Show incorrect password message
        mov rsi, password_incorrect
        mov rdx, password_incorrect_len
        call print

        call exit

    ; void print(rsi string, rdx length)
    print:
        mov eax, 1 ; sys_write
        mov rdi, 1 ; stdout

        syscall
        ret

    ; rsi read()
    read:
        mov eax, 0 ; sys_read
        mov rdi, 0 ; stdin

        syscall

        mov rdi, rsi 
        mov al, 0

        ret

    exit:
        mov eax, 60 ; sys_exit
        mov rdi, 0  ; Exit code 0
        syscall