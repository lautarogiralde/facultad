;Escriba una subrutina que reciba como parámetros las direcciones del comienzo de dos cadenas terminadas en cero y 
;retorne la posición en la que las dos cadenas difieren. En caso de que las dos cadenas sean idénticas, debe 
;retornar -1.

.data
cadena1: .asciiz "hola"
cadena2: .asciiz "hol"
res: .word 0

.code
daddi $a0, $0, cadena1
daddi $a1, $0, cadena2
jal comparar
sd $v0, res($0)
halt

comparar: daddi $v0, $0, 0
loop: lbu $t0, 0($a0)
lbu $t1, 0($a1)
daddi $v0, $v0, 1
daddi $a0, $a0, 1
daddi $a1, $a1, 1
beqz $t0, fin_cadena1
bne $t0, $t1, difieren
j loop

difieren: jr $ra
iguales: daddi $v0, $0, -1
jr $ra

fin_cadena1: beqz $t1, iguales
jr $ra


