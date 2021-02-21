BITS 64

SECTION .text

GLOBAL strncmp

strncmp:

    push rbp
    mov rbp, rsp
    mov rcx, 0
    mov rax, 0

    ; if (str1 == str2)
    cmp rdi, rsi
    mov r8, dword 0
    cmovz rax, r8
    jz _strncmp_end ; return (0);

_strncmp_loop_start:

    cmp rcx, rdx
    jz _strncmp_loop_end

    ; for (int rcx = 0; str1[rcx] != '\0' && str2[rcx] != '\0'
    cmp [rdi + rcx], dword 0
    jz _strncmp_loop_end
    cmp [rsi + rcx], dword 0
    jz _strncmp_loop_end

    ; if (str1[rcx] != str2[rcx])
    mov bl, byte 0
    mov bl, [rsi + rcx]
    cmp bl, [rdi + rcx]
    jnz _strncmp_loop_neq

    inc rcx
    jmp _strncmp_loop_start

_strncmp_loop_neq:

    mov rax, 0
    add al, [rdi + rcx]
    sub al, [rsi + rcx]
    cbw
    cwde

_strncmp_loop_end:
_strncmp_end:

    leave
    ret