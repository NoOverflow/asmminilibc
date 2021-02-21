BITS 64

SECTION .text

GLOBAL strcasecmp

_strcasecmp_to_lower:

    cmp r8b, 91
    jl _strcasecmp_to_lower_l
    ret
    _strcasecmp_to_lower_l:
    cmp r8b, 65
    jg _strcasecmp_to_lower_g
    ret
    _strcasecmp_to_lower_g:
    add r8b, 32
    ret

strcasecmp:

    push rbp
    mov rbp, rsp
    mov rcx, 0
    mov rax, 0

    ; if (str1 == str2)
    cmp rdi, rsi
    mov r8, dword 0
    cmovz rax, r8
    jz _strcasecmp_end ; return (0);

_strcasecmp_loop_start:

    ; for (int rcx = 0; str1[rcx] != '\0' && str2[rcx] != '\0'
    cmp [rdi + rcx], dword 0
    jz _strcasecmp_loop_end
    cmp [rsi + rcx], dword 0
    jz _strcasecmp_loop_end

    ; b = tolower(str1[rcx])
    mov r8b, [rdi + rcx]
    call _strcasecmp_to_lower
    mov r9b, r8b

    ; a = tolower(str2[rcx])
    mov r8b, [rsi + rcx]
    call _strcasecmp_to_lower

    ; if (str1[rcx] != str2[rcx])
    cmp r8b, r9b
    jnz _strcasecmp_loop_neq

    ; rcx++
    inc rcx
    jmp _strcasecmp_loop_start

_strcasecmp_loop_neq:

    mov rax, dword 0
    add al, r8b
    sub al, r9b
    cbw
    cwde

_strcasecmp_loop_end:
_strcasecmp_end:

    leave
    ret