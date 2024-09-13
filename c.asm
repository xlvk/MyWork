section .bss
    num1      resb 4
    num2      resb 4
    operation resb 1
    result    resb 4
    newline   resb 1

; the data section
section .data
    prompt_num1 db 'Enter first number: ', 0
    prompt_num2 db 'Enter second number: ', 0
    prompt_op   db 'Enter operation (+, -, *, /): ', 0
    prompt_res  db 'Result: ', 0
    newline_msg db 10, 0

section .text
    global _start

_start:
    ; Prompt for num1
    mov eax, 4           ; sys_write
    mov ebx, 1           ; stdout
    mov ecx, prompt_num1 ; message
    mov edx, 20          ; length
    int 0x80

    ; Read num1 from user
    mov eax, 3    ; sys_read
    mov ebx, 0    ; stdin
    mov ecx, num1 ; buffer
    mov edx, 1    ; length
    int 0x80

    ; Read and discard newline
    mov eax, 3       ; sys_read
    mov ebx, 0       ; stdin
    mov ecx, newline ; buffer
    mov edx, 1       ; length
    int 0x80

    ; Print newline
    ; mov eax, 4           ; sys_write
    ; mov ebx, 1           ; stdout
    ; mov ecx, newline_msg ; message
    ; mov edx, 1           ; length
    ; int 0x80

    ; Prompt for num2
    mov eax, 4           ; sys_write
    mov ebx, 1           ; stdout
    mov ecx, prompt_num2 ; message
    mov edx, 22          ; length
    int 0x80

    ; Read num2 from user
    mov eax, 3    ; sys_read
    mov ebx, 0    ; stdin
    mov ecx, num2 ; buffer
    mov edx, 1    ; length
    int 0x80

    ; Read and discard newline
    mov eax, 3       ; sys_read
    mov ebx, 0       ; stdin
    mov ecx, newline ; buffer
    mov edx, 1       ; length
    int 0x80

    ; Print newline
    ; mov eax, 4           ; sys_write
    ; mov ebx, 1           ; stdout
    ; mov ecx, newline_msg ; message
    ; mov edx, 1           ; length
    ; int 0x80

    ; Prompt for operation
    mov eax, 4         ; sys_write
    mov ebx, 1         ; stdout
    mov ecx, prompt_op ; message
    mov edx, 30        ; length
    int 0x80

    ; Read operation from user
    mov eax, 3         ; sys_read
    mov ebx, 0         ; stdin
    mov ecx, operation ; buffer
    mov edx, 1         ; length
    int 0x80

    ; Read and discard newline
    mov eax, 3       ; sys_read
    mov ebx, 0       ; stdin
    mov ecx, newline ; buffer
    mov edx, 2       ; length
    int 0x80

    ; Convert ASCII to integer
    sub byte [num1], '0'
    sub byte [num2], '0'

    ; Load the numbers into registers
    mov al, [num1]
    mov bl, [num2]

    ; Load the operation into a register
    mov cl, [operation]

    ; Perform the operation
    cmp cl, '+'
    je  add
    cmp cl, '-'
    je  subtract
    cmp cl, '*'
    je  multiply
    cmp cl, '/'
    je  divide

    ; Addition
add:
    add al, bl
    jmp done

    ; Subtraction
subtract:
    sub al, bl
    jmp done

    ; Multiplication
multiply:
    mul bl
    jmp done

    ; Division
divide:
    cmp bl, 0
    je done  ; Skip division if denominator is zero
    xor ah, ah
    div bl
    jmp done

done:
    ; Store the result
    mov [result], al

    ; Convert result to ASCII
    add byte [result], '0'

    ; Prompt for result
    mov eax, 4           ; sys_write
    mov ebx, 1           ; stdout
    mov ecx, prompt_res ; message
    mov edx, 16          ; length
    int 0x80


    ; Write result to stdout
    mov eax, 4      ; sys_write
    mov ebx, 1      ; stdout
    mov ecx, result ; buffer
    mov edx, 2      ; length
    int 0x80

    ; Exit the program
    mov eax, 1
    int 0x80