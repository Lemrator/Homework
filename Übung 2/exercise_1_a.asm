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
	imul ecx, ecx ; ecx ∗ ecx
	sub ecx, ebx ; ecx ∗ ecx−ebx
	shl eax, 1 ; eax ∗2
	add eax, ecx ; ecx ∗ ecx−ebx+eax ∗2
	add ebx, 0xaaaa ; ebx+0xaaaa
	xor eax, ebx ; ( ecx ∗ ecx−ebx+eax ∗ 2 ) ˆ ( ebx+0xaaaa )
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
