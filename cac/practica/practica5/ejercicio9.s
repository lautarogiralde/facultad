;El siguiente programa espera usar una subrutina que calcule en forma recursiva el factorial de un número entero:

.data 
valor: .word 10 
result: .word 0 
  
.text 
daddi $sp, $0, 0x400
ld    $a0, valor($0)
daddi $t0, $0, 1
jal   factorial
sd    $v0, result($0)
halt
 
factorial: slt $t1, $t0, $a0
beqz $t1, caso_base

daddi $sp, $sp, -16
sd $ra, 0($sp)
sd $a0, 8($sp)

daddi $a0, $a0, -1
jal factorial

ld $a0, 8($sp)
ld $ra, 0($sp)
daddi $sp, $sp, 16


dmul $v0, $a0, $v0
jr $ra

caso_base:
daddi $v0, $0, 1
jr  $ra

;   ¿Es posible escribir la subrutina factorial sin utilizar una pila? Justifique.
;   Si, pero no de forma recursiva