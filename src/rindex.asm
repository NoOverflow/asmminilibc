BITS 64

SECTION .text

GLOBAL rindex

rindex:

    push rbp
    mov rbp, rsp

    mov rax, qword 0
    mov rcx, qword 0
    mov r9, qword 0

_rindex_loop_start:

    ; if (str[rcx] == '\0')
    cmp [rdi + rcx], byte 0
    jz _rindex_end ; return (rax);

    mov r9b, [rdi + rcx]
    cmp sil, r9b
    jnz _rindex_neq
    mov rax, rdi
    add rax, rcx

_rindex_neq:

    inc rcx
    jmp _rindex_loop_start

_rindex_end:

    leave
    ret