section .data

result_string: db "Result: %d", 0xa, 0

section .bss
result: resb 4

section .text

global main
; tell NASM that printf is a symbol defined in another module
extern printf

main:
    mov eax, 0x8eef84d
    mov ebx, 0x9c1d5441
    mov ecx, 0x3d2714f5
    ; ----- YOUR CODE GOES BELOW THIS LINE -----
    ; TODO: Calculate: eax = (ecx * ecx - ebx + eax * 2) ^ (0xaaaa + ebx)
    mov edx, eax
    mov eax, ecx
    mul eax
    mov ecx, eax
    mov eax, edx
    add eax, eax
    add eax, ecx
    sub eax, ebx
    add ebx, 0xaaaa
    xor eax, ebx
    ; ----- END OF YOUR MODIFICATIONS -----
 
    ; Store result
    mov [result], eax
 
    ; Print result
    push dword [result]
    push result_string
    call printf

    ; Calling convention requires us to cleanup stack
    add esp, 8
    
    ret
