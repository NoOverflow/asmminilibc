BITS 64

SECTION .text

GLOBAL strstr

%include 'src/strlen.asm'
%include 'src/strncmp.asm'

strstr:

    mov rax, qword 0
    mov rcx, qword 0
    mov r8, rdi

    call strlen
    mov rdx, rax
    xor rax, rax

.loop_start:

    mov rdi, r8
    cmp rcx, rdx
    jz .loop_end

    add rdi, rcx
    call strncmp
    jnz .loop_strncmp_nz
    mov rax, rdi
    jz .loop_end

.loop_strncmp_nz:

    inc rcx
    jmp .loop_start

.loop_end:

    ret
