BITS 64

SECTION .text

GLOBAL memcpy

memcpy:

    push rbp
    mov rbp, rsp
    mov rcx, 0
    mov rax, rdi

_memcpy_loop_start:

    cmp rdx, rcx ; n == i
    jz _memcpy_loop_end
    mov r8b, [rsi + rcx]
    mov [rdi + rcx], r8b
    inc rcx
    jmp _memcpy_loop_start

_memcpy_loop_end:

    leave
    ret