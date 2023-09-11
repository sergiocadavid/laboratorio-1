.data
prompt: .asciiz "Ingrese la cantidad de términos de la Serie de Fibonacci: "
result_msg: .asciiz "Serie de Fibonacci: "
newline: .asciiz "\n"

.text
.globl main

main:
    # Pide al usuario la cantidad de términos de la Serie de Fibonacci
    li $v0, 4
    la $a0, prompt
    syscall

    # Lee la cantidad de términos ingresada por el usuario
    li $v0, 5
    syscall
    move $t0, $v0

    # Muestra el mensaje inicial de la Serie de Fibonacci
    li $v0, 4
    la $a0, result_msg
    syscall
    
   

    # Caso especial para la impresión de 0 términos
    beqz $t0, end_fibonacci

    # Muestra el primer término (0) de la Serie de Fibonacci
    li $t1, 0
    li $v0, 1
    move $a0, $t1
    syscall
    # dejar espacio
    li $v0, 11
        li $a0, ' '
        syscall

    # Caso especial para la impresión de 1 término
    beq $t0, 1, end_fibonacci

    # Muestra una coma para separar los términos
    li $v0, 4
    li $v0, 11
    syscall
    
    

    # Inicializa los primeros dos términos de la Serie de Fibonacci
    li $t1, 0 # Término n-2
    li $t2, 1 # Término n-1

    # Muestra el segundo término (1) de la Serie de Fibonacci
    li $v0, 1
    move $a0, $t2
    syscall
    #dejar espacio
    li $v0, 11
        li $a0, ' '
        syscall

    # Verifica si solo se solicitaron dos términos
    beq $t0, 2, end_fibonacci

    # Calcula y muestra los términos restantes de la Serie de Fibonacci
    li $t3, 2 # Índice del término actual (comienza en el tercer término)
    
    fibonacci_loop:
        # Calcula el siguiente término de Fibonacci: n = n-1 + n-2
        add $t3, $t3, 1
        add $t4, $t1, $t2
        move $t1, $t2
        move $t2, $t4

        # Muestra el término actual
        move $a0, $t4
        li $v0, 1
        syscall
        # dejar espacio
        li $v0, 11
        li $a0, ' '
        syscall

        # Verifica si se han mostrado suficientes términos
        bne $t3, $t0, fibonacci_loop

    end_fibonacci:
    # Imprime una nueva línea y sale del programa
    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 10
    syscall
