BITS 64

SECTION .text

GLOBAL strstr

; rdi const char *haystack
; rsi const char *needle
strstr:

    mov rax, qword 0
    mov rcx, qword 0

    mov r8, rdi
    mov rdi, rsi
    call .sstrlen
    mov rdx, rax
    xor rax, rax
    mov rdi, r8

.loop_start:

    cmp [rdi + rcx], byte 0
    jz .loop_ret_null

    mov r12, rdi
    add rdi, rcx
    call .sstrncmp
    cmp eax, dword 0
    jnz .loop_strncmp_nz

    ; !strncmp(&str[i], to_find, len)
    mov rax, rdi ; return (str + i)
    jz .loop_end

.loop_strncmp_nz:

    mov rdi, r12
    inc rcx
    jmp .loop_start

.loop_ret_null:

    xor rax, rax

.loop_end:

    ret

; strlen
.sstrlen:

    mov rax, 0

.sstrlen_loop_start:

    cmp [rdi + rax], byte 0
    jz .sstrlen_loop_end
    inc rax
    jmp .sstrlen_loop_start

.sstrlen_loop_end:

    ret

; strncmp
.sstrncmp:

    mov r10, qword 0
    mov rax, qword 0

    ; if (str1 == str2)
    cmp rdi, rsi
    jz .sstrncmp_end ; return (0);

.sstrncmp_loop_start:

    xor rax, rax

    cmp r10, rdx
    jz .sstrncmp_end

    ; for (int rcx = 0; str1[rcx] != '\0' || str2[rcx] != '\0'
    cmp [rdi + r10], byte 0
    jnz .sstrncmp_continue
    cmp [rsi + r10], byte 0
    jnz .sstrncmp_continue
    jmp .sstrncmp_loop_end

.sstrncmp_continue:

    ; if (str1[rcx] != str2[rcx])
    mov al, [rdi + r10]
    sub al, [rsi + r10]
    jnz .sstrncmp_loop_neq

    inc r10
    jmp .sstrncmp_loop_start

.sstrncmp_loop_neq:

    cbw
    cwde

.sstrncmp_loop_end:
.sstrncmp_end:

    ret


