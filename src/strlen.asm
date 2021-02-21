BITS 64

SECTION .text

GLOBAL strlen

strlen:

    push    rbp
    mov     rbp, rsp

    mov rax, 0

_strl_loop_start:

    cmp [rdi + rax], byte 0
    jz _strl_loop_end
    inc rax
    jmp _strl_loop_start

_strl_loop_end:

    leave
    ret