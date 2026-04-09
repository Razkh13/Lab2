section .data
    msg_result db "Результат: ",10
    msg_notfound db "Не найдено",10
    space db " "

section .bss
    numbers resq 100
    n resq 1
    buf resb 21

section .text
    global _start

_start:
    ; пример данных
    mov qword [n], 4
    mov qword [numbers], 19
    mov qword [numbers+8], 29
    mov qword [numbers+16], 55
    mov qword [numbers+24], 12

    xor rbx, rbx        ; индекс
    xor r12, r12        ; found = 0

    mov rax, 1          ; sys_write
    mov rdi, 1          ; stdout
    lea rsi, [rel msg_result]
    mov rdx, 20         ; длина строки (в байтах)
    syscall

main_loop:
    cmp rbx, [n]
    jge check_found

    mov r8, [numbers + rbx*8]   ; число
    mov r9, r8                  ; копия

    ; сумма цифр 
    xor r10, r10        ; sum = 0

sum_loop:
    mov rax, r9
    test rax, rax
    jz sum_done

    xor rdx, rdx
    mov rcx, 10
    div rcx             ; rax = r9 / 10, rdx = остаток

    add r10, rdx        ; sum += digit
    mov r9, rax
    jmp sum_loop

sum_done:

    ;произведение цифр
    mov r9, r8
    mov r11, 1          ; product = 1

prod_loop:
    mov rax, r9
    test rax, rax
    jz prod_done

    xor rdx, rdx
    mov rcx, 10
    div rcx

    imul r11, rdx       ; product *= digit
    mov r9, rax
    jmp prod_loop

prod_done:

    ; --- сравнение ---
    cmp r10, r11
    jge skip_number     ; если sum >= product, то пропустить

    mov r12, 1          ; found = true

    ; вывод числа 
    mov r9, r8
    lea rdi, [buf+20]
    mov byte [rdi], 0

convert_loop:
    mov rax, r9
    xor rdx, rdx
    mov rcx, 10
    div rcx
    add dl, '0'
    dec rdi
    mov [rdi], dl
    mov r9, rax
    test rax, rax
    jnz convert_loop

    lea rsi, [rdi]
    mov rdx, buf+20
    sub rdx, rdi

    mov rax, 1
    mov rdi, 1
    syscall

    ; пробел
    mov rax, 1
    mov rdi, 1
    lea rsi, [rel space]
    mov rdx, 1
    syscall

skip_number:
    inc rbx
    jmp main_loop

check_found:
    cmp r12, 0
    jne exit

    ; если ничего не найдено
    mov rax, 1
    mov rdi, 1
    lea rsi, [rel msg_notfound]
    mov rdx, 12
    syscall

exit:
    mov rax, 60
    xor rdi, rdi
    syscall
