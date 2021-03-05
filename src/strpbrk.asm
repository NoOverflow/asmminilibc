BITS 64

SECTION .text

GLOBAL strpbrk

strpbrk:

    call .sstrcspn
    add rdi, rax
    cmp byte [rdi], byte 0
    jnz .ret_accept
    mov rax, 0
    ret

.ret_accept:

    mov rax, rdi
    ret

.sstrcspn:

    mov rcx, qword 0
    mov rax, qword 0
    mov r8b, 0

.loop_start:

    cmp [rdi + rcx], byte 0
    jz .loop_end

    mov r8, 0 ; j = 0
.check_rej_loop_start:

    cmp [rsi + r8], byte 0         ;   if (reject[j] == '\0')
    jz .rej_loop_end ;        return;
    mov r10b, [rsi + r8]
    cmp [rdi + rcx], r10b    ;   if (reject[j] = s[i])
    jz .loop_end          ;        return;
    inc r8                         ;   j++
    jmp .check_rej_loop_start

.rej_loop_end:

    inc rcx
    jmp .loop_start

.loop_end:

    mov rax, rcx
    ret
