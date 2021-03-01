BITS 64

SECTION .text

GLOBAL rindex

rindex:

    mov rax, qword 0
    mov rcx, qword 0
    mov r9, qword 0

.loop_start:

    ; if (str[rcx] == '\0')
    cmp [rdi + rcx], byte 0
    jz .end ; return (rax);

    mov r9b, [rdi + rcx]
    cmp sil, r9b
    jnz .neq
    mov rax, rdi
    add rax, rcx

.neq:

    inc rcx
    jmp .loop_start

.end:

    cmp sil, byte 0
    jnz .rend
    mov rax, rdi

.rend
    ret
