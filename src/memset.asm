BITS 64

SECTION .text

GLOBAL memset

memset:

    push rbp
    mov rbp, rsp
    mov rcx, 0
    mov rax, rdi

_memset_loop_start:

    cmp rdx, rcx
    jz _memset_loop_end
    mov [rdi + rcx], sil
    inc rcx
    jmp _memset_loop_start

_memset_loop_end:

    leave
    ret