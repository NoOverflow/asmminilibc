BITS 64

SECTION .text

GLOBAL memset

memset:

    push rbp
    mov rbp, rsp
    mov rcx, 0
    mov rax, rdi

.loop_start:

    cmp rdx, rcx
    jz .loop_end
    mov [rdi + rcx], sil
    inc rcx
    jmp .loop_start

.loop_end:

    leave
    ret
