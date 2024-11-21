%include 'in_out.asm'

SECTION .data
msg_x: DB 'Введите значение переменной x: ', 0
msg_a: DB 'Введите значение переменной a: ', 0
res: DB 'Результат: ', 0

SECTION .bss
x: RESB 80
a: RESB 80

SECTION .text
GLOBAL _start

_start:
    ; Ввод значения переменной x
    mov eax, msg_x
    call sprint
    mov ecx, x
    mov edx, 80
    call sread
    mov eax, x
    call atoi
    mov edi, eax        ; Сохраняем x в edi

    ; Ввод значения переменной a
    mov eax, msg_a
    call sprint
    mov ecx, a
    mov edx, 80
    call sread
    mov eax, a
    call atoi
    mov esi, eax        ; Сохраняем a в esi

    ; Сравнение x и a
    cmp edi, esi       ; Сравниваем x (edi) и a (esi)
    jl calculate_a     ; Если x < a, переходим к calculate_a

    ; Если x >= a, выполняем x - 1
    dec edi            ; x - 1
    jmp print_result

calculate_a:
    dec esi            ; a - 1

print_result:
    mov eax, res
    call sprint        ; Вывод сообщения 'Результат: '
    
    mov eax, edi       ; Загружаем результат в eax (либо a-1, либо x-1)
    call iprintLF      ; Выводим результат

    call quit          ; Выход из программы

