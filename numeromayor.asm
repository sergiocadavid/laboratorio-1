.data
prompt1: .asciiz "Ingrese el primer número: "
prompt2: .asciiz "Ingrese el segundo número: "
prompt3: .asciiz "Ingrese el tercer número: "
result_msg: .asciiz "El número mayor es: "
newline: .asciiz "\n"
buffer: .space 32

.text
.globl main

main:
    # Pide al usuario que ingrese el primer número
    li $v0, 4
    la $a0, prompt1
    syscall

    # Lee el primer número
    li $v0, 5
    syscall
    move $t0, $v0

    # Pide al usuario que ingrese el segundo número
    li $v0, 4
    la $a0, prompt2
    syscall

    # Lee el segundo número
    li $v0, 5
    syscall
    move $t1, $v0

    # Pide al usuario que ingrese el tercer número
    li $v0, 4
    la $a0, prompt3
    syscall

    # Lee el tercer número
    li $v0, 5
    syscall
    move $t2, $v0

    # Encuentra el número mayor
    move $t3, $t0

    # Compara con el segundo número
    blt $t1, $t3, check_t1
    move $t3, $t1

check_t1:
    # Compara con el tercer número
    blt $t2, $t3, output_result
    move $t3, $t2

output_result:
    # Muestra el resultado del número mayor
    li $v0, 4
    la $a0, result_msg
    syscall

    # Muestra el resultado como un entero
    move $a0, $t3
    li $v0, 1
    syscall

    # Imprime una nueva línea
    li $v0, 4
    la $a0, newline
    syscall

    # Sale del programa
    li $v0, 10
    syscall
