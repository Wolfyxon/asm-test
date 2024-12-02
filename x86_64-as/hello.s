.data
    message: .ascii "Helo my fred \n"
    message_end:
        message_len = (message_end - message)

    .global _start

.text
    _start:
        mov $1, %rax           # write
        mov $1, %rdi           # stdout
        mov $message, %rsi     # string address
        mov $message_len, %rdx # string length  
        syscall

        mov $60, %rax          # exit
        mov $0, %rdi           # exit code
        syscall
