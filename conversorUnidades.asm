; Esdras Wilfredo Pérez Coloma 7690-14-6737
; Uninversidad Mariano Gálvez de Guatemala
; Ingeniería en Sistemas - Arquitectura de computadoras #2
; Conversor de unidades con procesamiento en Ensamblador

; PROYECTO: CONVERSOR DE UNIDADES CON PROCESAMIENTO EN ENSAMBLADOR

section .data
    newline db 0xA
    mensaje1 db 'Ingrese longitud en metros: ', 0
    len equ $-mensaje1
    mensaje2 db 'Longitud en centímetros: ', 0
    mensaje3 db 'Longitud en milímetros: ', 0
    mensaje4 db 'Longitud en kilómetros: ', 0

section .bss
    longitud_metros resd 1
    longitud_centimetros resd 1
    longitud_milimetros resd 1
    longitud_kilometros resd 1

section .text
    global _start

; ---- Subrutina impresión de salto de linea ----
saltoLinea:
    mov eax, 4              
    mov ebx, 1              
    mov ecx, newline        
    mov edx, 1              
    int 0x80
    ret

_start:
    ; Imprime mensaje
    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje1
    mov edx, len
    ;mov edx, 26
    int 0x80

    ; Lee longitud en metros
    mov eax, 3
    mov ebx, 0
    mov ecx, longitud_metros
    mov edx, 4
    int 0x80

    ; Convierte ASCII a número
    mov eax, [longitud_metros]
    sub eax, 0x30

    ; Convierte metros a centímetros
    mov ebx, 100
    mul ebx
    mov [longitud_centimetros], eax

    ; Convierte metros a milímetros
    mov ebx, 1000
    mul ebx
    mov [longitud_milimetros], eax

    ; Convierte metros a kilómetros
    mov ebx, 1000
    div ebx
    mov [longitud_kilometros], eax

    ; Imprime resultados

    ; Imprime resultados en centimetros
    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje2
    mov edx, 26
    int 0x80
    mov eax, [longitud_centimetros]
    add eax, 0x30
    mov [longitud_metros], eax
    mov eax, 4
    mov ebx, 1
    mov ecx, longitud_metros
    mov edx, 4
    int 0x80

    call saltoLinea ; Imprimir salto de línea
    
    ; Imprime resultados en milimetros
    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje3
    mov edx, 26
    int 0x80
    mov eax, [longitud_milimetros]
    add eax, 0x30
    mov [longitud_metros], eax
    mov eax, 4
    mov ebx, 1
    mov ecx, longitud_metros
    mov edx, 4
    int 0x80

    call saltoLinea ; Imprimir salto de línea

    ; Imprime resultados en kilometros
    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje4
    mov edx, 26
    int 0x80
    mov eax, [longitud_kilometros]
    add eax, 0x30
    mov [longitud_metros], eax
    mov eax, 4
    mov ebx, 1
    mov ecx, longitud_metros
    mov edx, 4
    int 0x80

    call saltoLinea ; Imprimir salto de línea

    ; Termina el programa
    mov eax, 1
    xor ebx, ebx
    int 0x80
