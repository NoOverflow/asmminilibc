BITS 64

SECTION .text

GLOBAL strchr

strchr:

    push rbp
    mov rbp, rsp

    mov rcx, 0
    mov rax, 0

.loop_start:

    cmp [rdi + rcx], byte 0
    jnz .loop_check_char

    mov rax, 0
    add rax, rdi
    add rax, rcx
    cmp rsi, byte 0
    jz .loop_end
    mov rax, 0
    jmp .loop_end

.loop_check_char:

    mov rax, 0
    add rax, rdi
    add rax, rcx
    cmp [rdi + rcx], sil
    jz .loop_end
    inc rcx
    jmp .loop_start

.loop_end:

    leave
    ret
