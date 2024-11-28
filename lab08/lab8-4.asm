%include 'in_out.asm'
SECTION .data
msg_func db "Функция: f(x) = 3x-1", 0
msg_result db "Результат: ", 0
SECTION .text
GLOBAL _start

_start:
    ; ----- Вывод сообщения о функции
    mov eax, msg_func
    call sprintLF

    ; ----- Инициализация
    pop ecx        ; Считываем количество входных данных (N)
    sub ecx, 1    ; Уменьшаем на 1, чтобы учесть начальное значение
    mov esi, 0    ; Инициализация суммы (результата)

next:
    cmp ecx, 0h   ; Проверяем, не достигли ли нуля
    jz _end       ; Если да, переходим к окончанию

    pop eax       ; Считываем следующее значение (x)
    call atoi     ; Преобразуем строку в число

    ; ----- Вычисление f(x) = 3x - 1
    mov ebx, 3    ; Устанавливаем множитель 3
    mul ebx       ; Умножаем eax на 3 (eax = 3 * x)
    sub eax, 1    ; Вычитаем 1 (eax = 3 * x - 1)

    add esi, eax   ; Добавляем результат к сумме

    loop next     ; Переход к следующему значению

_end:
    ; ----- Вывод результата
    mov eax, msg_result
    call sprint

    mov eax, esi   ; Загружаем итоговое значение в eax
    call iprintLF  ; Печатаем результат

    call quit      ; Завершение программы
