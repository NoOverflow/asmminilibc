BITS 64

SECTION .text

GLOBAL main

EXTERN printf

main:
push    rbp
mov     rbp, rsp

; 64-bit ABI passing order starts w/ edi, esi, ...
mov rdi, msg    ;
mov rax, 0      ; printf is varargs, so EAX counts # of non-integer arguments being passed
call printf

mov rax, 0      ; normal-exit code

leave
ret

SECTION .data
msg:    db "Hello, world", 0xA, 0