BITS 64

SECTION .text

GLOBAL ssss

strstr:

    mov rax, qword 0
    mov rcx, qword 0
    mov r8, rdi

    call .sstrlen
    mov rdx, rax
    xor rax, rax

.loop_start:

    mov rdi, r8
    cmp rcx, rdx
    jz .loop_end

    add rdi, rcx
    call .sstrncmp
    jnz .loop_strncmp_nz
    mov rax, rdi
    jz .loop_end

.loop_strncmp_nz:

    inc rcx
    jmp .loop_start

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

    mov rcx, qword 0
    mov rax, qword 0

    ; if (str1 == str2)
    cmp rdi, rsi
    jz .sstrncmp_end ; return (0);

.sstrncmp_loop_start:

    xor rax, rax

    cmp rcx, rdx
    jz .sstrncmp_end

    ; for (int rcx = 0; str1[rcx] != '\0' || str2[rcx] != '\0'
    cmp [rdi + rcx], byte 0
    jnz .sstrncmp_continue
    cmp [rsi + rcx], byte 0
    jnz .sstrncmp_continue
    jmp .sstrncmp_loop_end

.sstrncmp_continue:

    ; if (str1[rcx] != str2[rcx])
    mov al, [rdi + rcx]
    sub al, [rsi + rcx]
    jnz .sstrncmp_loop_neq

    inc rcx
    jmp .sstrncmp_loop_start

.sstrncmp_loop_neq:

    cbw
    cwde

.sstrncmp_loop_end:
.sstrncmp_end:

    ret


