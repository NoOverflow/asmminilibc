BITS 64

SECTION .text

GLOBAL strcspn

strcspn:

    push rbp
    mov rbp, rsp
    mov rcx, qword 0
    mov rax, qword 0
    mov r8b, 0

_strcspn_loop_start:

    cmp [rdi + rcx], byte 0
    jz _strcspn_loop_end

    mov r8, 0 ; j = 0
_strcspn_check_rej_loop_start:

    cmp [rsi + r8], byte 0         ;   if (reject[j] == '\0')
    jz _strcspn_check_rej_loop_end ;        return;
    mov r10b, [rsi + r8]
    cmp [rdi + rcx], r10b    ;   if (reject[j] != s[i])
    jz _strcspn_loop_end          ;        return;
    inc r8                         ;   j++
    jmp _strcspn_check_rej_loop_start

_strcspn_check_rej_loop_end:

    inc rcx
    jmp _strcspn_loop_start

_strcspn_loop_end:

    mov rax, rcx
    leave
    ret