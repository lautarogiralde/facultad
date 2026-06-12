;Escriba un programa que calcule el resultado de elevar un valor en punto flotante a la potencia indicada por un 
;exponente que es un número entero positivo. Para ello, en el programa principal se solicitará el ingreso de la base 
;(un número en punto flotante) y del exponente (un número entero sin signo) y se deberá utilizar la subrutina 
;a_la_potencia para calcular el resultado pedido (que será un valor en punto flotante). Tenga en cuenta que cualquier 
;base elevada a la 0 da como resultado 1. Muestre el resultado numérico de la operación en la salida estándar del 
;simulador (ventana Terminal).

.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
base: .word 0
exponente: .word 0
res: .word 0

.text
lwu $s0, CONTROL($0)
lwu $s1, DATA($0)
jal leer
dadd $a0, $0, $v0
dadd $a1, $0, $v1
jal a_la_potencia
halt

leer: daddi $t0, $0, 8
sd $t0, 0($s0)
ld $v0, 0($s1)
sd $t0, 0($s0)
ld $v1, 0($s1)
jr $ra

a_la_potencia: mtc1 $v0, f0
cvt.d.l f0, f0
daddi $t0, $0, 1
mtc1 $t0, f1
cvt.d.l f1, f1
beqz $a1, fin
loop: mul.d f1, f1, f0
daddi $a1, $a1, -1
bnez $a1, loop

fin: 
daddi $t0, $0, 6
sd $t0, 0($s0)
s.d f1, 0($s1)
daddi $t0, $0, 3
sd $t0, 0($s0)
jr $ra