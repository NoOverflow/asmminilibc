BITS 64

SECTION .text

GLOBAL strlen

strlen:

    mov rax, 0

.loop_start:

    cmp [rdi + rax], byte 0
    jz .loop_end
    inc rax
    jmp .loop_start

.loop_end:

    ret
