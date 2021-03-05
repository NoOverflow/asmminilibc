BITS 64

SECTION .text

GLOBAL memmove

; void *memove(void *dest, const void *src, size_t n)
memmove:

    mov rcx, 0
    mov rax, rdi

    cmp rdi, rsi ; if (dest < src)

    jl .forward
    sub rdx, 1

.backward:

    cmp rdx, -1
    je .end
    mov r8b, [rsi + rdx]
    mov [rdi + rdx], r8b
    sub rdx, 1
    jmp .backward

.forward:

    cmp rcx, rdx
    je .end
    mov r8b, [rsi + rcx]
    mov [rdi + rcx], r8b
    add rcx, 1
    jmp .forward

.end:

    ret

