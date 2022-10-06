.data
vetor1: .space 120 # cada numero tem 4 bytes de tamanho
vetor2: .space 120 # cada numero tem 4 bytes de tamanho
br: .asciiz "\n"
msg: .asciiz "\n Digite o tamanho dos vetores:"
msg1: .asciiz "\n Digite os valores do vetor 1:"
msg2: .asciiz "\n Digite os valores do vetor 2:"
msg3: .asciiz "\n Valores do vetor1: "
msg4: .asciiz "\n Valores do vetor2: " 
msg5: .asciiz "\n Valores dos vetores intercalados: "
input: .asciiz "\n Digite o "
input2: .asciiz " º valor: "
virgula: .asciiz ","
.text
main:
li $v0, 4 #Codigo syscall para escrever strings no console
la $a0, msg #Carrega em $a0 o endereco da string a ser escrita no console
syscall
li $v0, 5
syscall # Le do teclado o tamanho do vetor

add $s0, $v0, $zero # $s0 recebe o tamanho do vetor

##################################################
#
#     PRIMEIRO FOR
#
##################################################

# Imprime msg1
li $v0, 4 
la $a0, msg1 
syscall

addi $t0, $zero, 0 # Inicializa o contador do for (i = 0)
addi $t1, $zero, 0 # Inicializa a variavel de controle de posicao do vetor
for:
slt $t2, $t0, $s0 # Condicao do for (i < tamanho do vetor)
beq $t2, $zero, fim # Valida a condição slt aplicada no $t2 deu falso



addi $t0, $t0, 1 # Incrementa o contador do for (i++)
# Imprime input
li $v0, 4 
la $a0, input 
syscall

li $v0, 1 # imprime a posição a ser digitada
add $a0, $t0, $zero
syscall

# Imprime input2
li $v0, 4 
la $a0, input2
syscall

li $v0, 5
syscall # Le o valor do teclado

sw $v0, vetor1($t1) # Armazena valor digitado no vetor
addi $t1, $t1, 4 # Incrementa o indice para a proxima posicao livre no vetor
j for
fim: 

##################################################
#
#     SEGUNDO FOR
#
##################################################

# Imprime msg2
li $v0, 4 
la $a0, msg2 
syscall

addi $t0, $zero, 0 # Inicializa o contador do for (i = 0)
addi $t1, $zero, 0 # Inicializa a variavel de controle de posicao do vetor
for2:
slt $t2, $t0, $s0 # Condicao do for (i < tamanho do vetor)
beq $t2, $zero, fim2 # Valida a condição slt aplicada no $t2 deu falso




addi $t0, $t0, 1 # Incrementa o contador do for (i++)
# Imprime input
li $v0, 4 
la $a0, input 
syscall

li $v0, 1 # imprime a posição a ser digitada
add $a0, $t0, $zero
syscall

# Imprime input2
li $v0, 4 
la $a0, input2
syscall

li $v0, 5
syscall # Le o valor do teclado

sw $v0, vetor2($t1) # Armazena valor digitado no vetor
addi $t1, $t1, 4 # Incrementa o indice para a proxima posicao livre no vetor
j for2
fim2: 

##################################################
#
#     IMPRIMINDO TODOS OS VALORES DO VETOR 1
#
##################################################

# Imprime msg3
li $v0, 4 
la $a0, msg3 
syscall

addi $t0, $zero, 0 # Inicializa o contador do for (i = 0)
addi $t1, $zero, 0 # Inicializa a variavel de controle de posicao do vetor
for3:
slt $t2, $t0, $s0 # Condicao do for (i < tamanho do vetor)
beq $t2, $zero, fim3

lw $t3, vetor1($t1) # Armazena valor do vetor em $t3
beq $t0, $zero, a

# Imprime a virgula
li $v0, 4 
la $a0, virgula
syscall

j a
a:
# Printa no console o valor de $t3
li $v0, 1
add $a0, $t3, $zero
syscall

addi $t1, $t1, 4 # Incrementa o indice para a proxima posicao livre no vetor
addi $t0, $t0, 1 # Incrementa o contador do for (i++)
j for3
fim3: 

##################################################
#
#     IMPRIMINDO TODOS OS VALORES DO VETOR 2
#
##################################################

# Imprime msg4
li $v0, 4 
la $a0, msg4 
syscall


addi $t0, $zero, 0 # Inicializa o contador do for (i = 0)
addi $t1, $zero, 0 # Inicializa a variavel de controle de posicao do vetor
for4:
slt $t2, $t0, $s0 # Condicao do for (i < tamanho do vetor)
beq $t2, $zero, fim4 # Valida a condição slt aplicada no $t2 deu falso

lw $t3, vetor2($t1) # Armazena valor do vetor em $t3
beq $t0, $zero, a2

# Imprime a virgula
li $v0, 4 
la $a0, virgula
syscall

j a2
a2:
# Printa no console o valor de $t3
li $v0, 1
add $a0, $t3, $zero
syscall


addi $t1, $t1, 4 # Incrementa o indice para a proxima posicao livre no vetor
addi $t0, $t0, 1 # Incrementa o contador do for (i++)
j for4
fim4:

##################################################
#
#     IMPRIMINDO O VETOR INTERCALADO
#
##################################################

# Imprime msg5
li $v0, 4 
la $a0, msg5
syscall


addi $t0, $zero, 0 # Inicializa o contador do for (i = 0)
addi $t1, $zero, 0 # Inicializa a variavel de controle de posicao do vetor
for5:
slt $t2, $t0, $s0 # Condicao do for (i < tamanho do vetor)
beq $t2, $zero, fim5 # Valida a condição slt aplicada no $t2 deu falso

lw $t4, vetor1($t1) # Armazena valor do vetor em $t4
beq $t0, $zero, a3 #realiza a primeira impressão sem a vírgula
# Imprime a virgula
li $v0, 4 
la $a0, virgula
syscall
j a3

a3:
# Printa no console o valor de $t4
li $v0, 1
add $a0, $t4, $zero
syscall

lw $t5, vetor2($t1) # Armazena valor do vetor em $t5

# Imprime a virgula
li $v0, 4 
la $a0, virgula
syscall

# Printa no console o valor de $t5
li $v0, 1
add $a0, $t5, $zero
syscall

addi $t1, $t1, 4 # Incrementa o indice para a proxima posicao livre no vetor
addi $t0, $t0, 1 # Incrementa o contador do for (i++)
j for5
fim5:

jr $ra