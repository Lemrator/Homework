; ---- DO NOT MODIFY THE DATA SECTION ----
section .data

string_choice: db "Choose a number: ", 0
string_success: db "%d is prime.", 0xa, 0
string_failure: db "%d is not prime.", 0xa, 0
string_error: db "Invalid input. Exiting...", 0xa, 0
input_number: db "%d", 0

; ---- DO NOT MODIFY THE BSS SECTION ----
section .bss
choice: resd 1

section .text

global main
;; tell NASM that printf and scanf are symbols
;; defined in another module
extern scanf, printf

; ---- Your code goes into the TODO snippets ----

main:
    ;-------------------------------
    ; TODO
    ; Ask user for input of a number (use string_choice)
    push string_choice
    call printf
    add esp, 4
    ;-------------------------------
    
    ;-------------------------------
    ; TODO
    ; Read user input (use input_number)
    push choice
    push input_number
	call scanf
	add esp, 8
    ;-------------------------------
    
    ;-------------------------------
    ; TODO
    ; Check if user input is within valid range
	mov eax, [choice]
	cmp eax, 2
    jb error
    cmp eax, 1000
    ja error
	mov esi, [choice]

    ;-------------------------------
    
    ;-------------------------------
    ; DO NOT MODIFY THIS
    ; Call is_prime subroutine
    mov eax, [choice]  ; Load user input
    push eax           ; Pass user's input via the stack
    call is_prime      ; Call subroutine
    add esp, 4         ; Cleanup stack
    
    ; Check result (which is in eax)
    cmp eax, 1
    je success
    
    ; If number is not prime, print failure message
    push esi
    push string_failure
    call printf
    add esp, 8
    ret 
    
    ; If number is prime, print success message
success:
    push esi
    push string_success
    call printf
    add esp, 8
    ret 
    ;-------------------------------
    
    ;-------------------------------
    ; TODO
    ; Print error message (use string_error)
error:  
	push string_error
	call printf
	add esp, 4
	ret
    ;-------------------------------

;-------------------------------
; TODO
; The function is_prime should contain your primality test.
; Return 1 if the argument (passed via the stack) is prime, else 0.
; Mark instructions belonging to the prologue and epilogue.
set_eax_true:
	mov eax, 1
	leave
	retn
set_eax_false:
	mov eax, 0
	leave
	retn
is_prime:
    ; prologue
    push ebp
    mov ebp, esp
    sub esp, 4h
    ; end of prologue
    
    ; function body
	mov eax, [ebp+8]
	xor edx, edx
	mov ebx, 2
	cmp ebx, eax ;falls eingabe der Zahl entpricht, durch die man teilt
	je set_eax_true ;wenn die Zahlen gleich sind, dann ist die Eingabe prim
	div ebx
	cmp edx, 0
	jz set_eax_false
	mov eax, [ebp+8]
	xor edx, edx
	mov ebx, 3
	cmp ebx, eax
	je set_eax_true
	div ebx
	cmp edx, 0
	jz set_eax_false
	mov eax, [ebp+8]
	xor edx, edx
	mov ebx, 5
	cmp ebx, eax
	je set_eax_true
	div ebx
	cmp edx, 0
	jz set_eax_false
	mov eax, [ebp+8]
	xor edx, edx
	mov ebx, 7
	cmp ebx, eax
	je set_eax_true
	div ebx
	cmp edx, 0
	jz set_eax_false
	mov eax, [ebp+8]
	xor edx, edx
	mov ebx, 11
	cmp ebx, eax
	je set_eax_true
	div ebx
	cmp edx, 0
	jz set_eax_false
	mov eax, [ebp+8]
	xor edx, edx
	mov ebx, 13
	cmp ebx, eax
	je set_eax_true
	div ebx
	cmp edx, 0
	jz set_eax_false
	mov eax, [ebp+8]
	xor edx, edx
	mov ebx, 17
	cmp ebx, eax
	je set_eax_true
	div ebx
	cmp edx, 0
	jz set_eax_false
	mov eax, [ebp+8]
	xor edx, edx
	mov ebx, 19
	cmp ebx, eax
	je set_eax_true
	div ebx
	cmp edx, 0
	jz set_eax_false
	mov eax, [ebp+8]
	xor edx, edx
	mov ebx, 23
	cmp ebx, eax
	je set_eax_true
	div ebx
	cmp edx, 0
	jz set_eax_false
	mov eax, [ebp+8]
	xor edx, edx
	mov ebx, 29
	cmp ebx, eax
	je set_eax_true
	div ebx
	cmp edx, 0
	jz set_eax_false
	mov eax, [ebp+8]
	xor edx, edx
	mov ebx, 31
	cmp ebx, eax
	je set_eax_true
	div ebx
	cmp edx, 0
	jz set_eax_false
	call set_eax_true
    ; end of function body
    
    ; epilogue
    leave
    retn
    ; end of epilogue / end of function
;-------------------------------
