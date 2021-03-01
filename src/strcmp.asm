BITS 64

SECTION .text

GLOBAL strcmp

strcmp:

    mov rcx, qword 0
    mov rax, qword 0

    ; if (str1 == str2)
    cmp rdi, rsi
    jz .end ; return (0);

.loop_start:

    xor rax, rax
    ; for (int rcx = 0; str1[rcx] != '\0' || str2[rcx] != '\0'
    cmp [rdi + rcx], byte 0
    jnz .continue
    cmp [rsi + rcx], byte 0
    jnz .continue
    jmp .loop_end

.continue:

    ; if (str1[rcx] != str2[rcx])
    mov al, [rdi + rcx]
    sub al, [rsi + rcx]
    jnz .loop_neq

    inc rcx
    jmp .loop_start

.loop_neq:

    cbw
    cwde

.loop_end:
.end:

    ret
