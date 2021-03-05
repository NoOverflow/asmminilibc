BITS 64

SECTION .text

GLOBAL memcpy

memcpy:

    push rbp
    mov rbp, rsp
    mov rcx, 0
    mov rax, rdi

.loop_start:

    cmp rdx, rcx ; n == i
    jz .loop_end
    mov r8b, [rsi + rcx]
    mov [rdi + rcx], r8b
    inc rcx
    jmp .loop_start

.loop_end:

    leave
    ret
