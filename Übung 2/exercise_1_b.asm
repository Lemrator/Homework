
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
    push choice			; Trage übergebenenen Wert in "choice" ein
    push input_number
	call scanf
	add esp, 8
    ;-------------------------------
    
    ;-------------------------------
    ; TODO
    ; Check if user input is within valid range
    mov eax, [choice]	; Bewege "choice" in EAX
	cmp eax, 2			; Fehlermeldung, falls choise<2
	jb error
	cmp eax, 1000		; Fehlermeldung, falls choise>1000
	ja error

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
is_prime:
    ; prologue
    pop eax
    ; end of prologue
    
    ; function body

    ; end of function body
    
    ; epilogue
    ret
    ; end of epilogue / end of function
;-------------------------------
