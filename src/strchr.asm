BITS 64

SECTION .text

GLOBAL strchr

strchr:

    push rbp
    mov rbp, rsp

    mov rcx, 0
    mov rax, 0

_strchr_loop_start:

    cmp [rdi + rcx], byte 0
    jnz _strchr_loop_check_char

    mov rax, 0
    add rax, rdi
    add rax, rcx
    cmp rsi, byte 0
    jz _strchr_loop_end
    mov rax, 0
    jmp _strchr_loop_end

_strchr_loop_check_char:

    mov rax, 0
    add rax, rdi
    add rax, rcx
    cmp [rdi + rcx], sil
    jz _strchr_loop_end
    inc rcx
    jmp _strchr_loop_start

_strchr_loop_end:

    leave
    ret