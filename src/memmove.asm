BITS 64

SECTION .text

GLOBAL memmove

; void *memove(void *dest, const void *src, size_t n)
memmove:

    mov rcx, 0
    mov rax, rdi

    cmp rdi, rsi ; if (dest < src)

    jl _memmove_forward
    sub rdx, 1

_memmove_backward:

    cmp rdx, -1
    je _memmove_end
    mov r8b, [rsi + rdx]
    mov [rdi + rdx], r8b
    sub rdx, 1
    jmp _memmove_backward

_memmove_forward:

    cmp rcx, rdx
    je _memmove_end
    mov r8b, [rsi + rcx]
    mov [rdi + rcx], r8b
    add rcx, 1
    jmp _memmove_forward

_memmove_end:

    ret

