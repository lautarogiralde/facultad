;   Escribir un programa que multiplique dos números enteros utilizando sumas repetidas (similar al Ejercicio  7 de 
;   la Práctica 1). El programa debe estar optimizado para su ejecución con la opción Delay Slot habilitada.

.data
NUM1: .word 0
NUM2: .word 2
RES: .word 0
.code
ld $t0, NUM1($0)
ld $t1, NUM2($0)

beqz $t1, fin
daddi $t3, $0, 0

loop: daddi $t1, $t1, -1
bnez $t1, loop
dadd $t3, $t3, $t0
sd $t3, RES($0)
fin: halt