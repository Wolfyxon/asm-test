# Registers
Register usage

## Syscalls
- `rax`: Syscall ID (64 bit)
- `eax`: Sycall ID (32 bit)
- `rdi`: Mode

### Example
```assembly
mov rax, 60 ; syscall exit
mov rdi, 0  ; exit code
syscall
```