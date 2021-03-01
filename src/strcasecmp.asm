BITS 64

SECTION .text

GLOBAL strcasecmp

.to_lower:

    cmp r8b, 91
    jl .to_lower_l
    ret
    .to_lower_l:
    cmp r8b, 65
    jg .to_lower_g
    ret
    .to_lower_g:
    add r8b, 32
    ret

strcasecmp:

    mov rcx, qword 0
    mov rax, qword 0

    ; if (str1 == str2)
    cmp rdi, rsi
    jz .end ; return (0);

.loop_start:

    xor rax, rax
    ; for (int rcx = 0; str1[rcx] != '\0' && str2[rcx] != '\0'
    cmp [rdi + rcx], byte 0
    jnz .continue
    cmp [rsi + rcx], byte 0
    jnz .continue
    jmp .loop_end

.continue:

    ; b = tolower(str1[rcx])
    mov r8b, [rdi + rcx]
    call .to_lower
    mov al, r8b

    ; a = tolower(str2[rcx])
    mov r8b, [rsi + rcx]
    call .to_lower

    ; if (str1[rcx] != str2[rcx])
    sub al, r8b
    jnz .loop_neq

    inc rcx
    jmp .loop_start

.loop_neq:

    cbw
    cwde

.loop_end:
.end:

    ret
