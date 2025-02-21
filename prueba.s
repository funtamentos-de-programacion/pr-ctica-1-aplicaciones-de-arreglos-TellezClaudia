section .note.GNU-stack noalloc noexec nowrite  ; Evita advertencia de pila ejecutable

section .data
    mensaje db "Hola, mundo!", 0x0A  ; Mensaje con salto de línea
    longitud equ $ - mensaje         ; Calcula la longitud del mensaje

section .text
    global _start

_start:
    ; sys_write (escribir en pantalla)
    mov eax, 4        ; Número de syscall para sys_write
    mov ebx, 1        ; Descriptor de archivo 1 (stdout)
    mov ecx, mensaje  ; Dirección del mensaje a imprimir
    mov edx, longitud ; Número de bytes a escribir
    int 0x80          ; Llamada al sistema

    ; sys_exit (terminar el programa)
    mov eax, 1        ; Número de syscall para sys_exit
    xor ebx, ebx      ; Código de salida 0
    int 0x80          ; Llamada al sistema