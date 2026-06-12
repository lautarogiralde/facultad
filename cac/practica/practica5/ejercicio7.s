;Escriba una subrutina que reciba como parámetros un número positivo M de 64 bits, la dirección del comienzo de una 
;tabla  que  contenga  valores  numéricos  de  64  bits  sin  signo  y  la  cantidad  de  valores  almacenados  en  
;dicha  tabla. La subrutina debe retornar la cantidad de valores mayores que M contenidos en la tabla.

.data
M: .word 9
tabla: .word 1,2,3,4,5,6,7,8,9,10
cant: .word 10
res: .word 0

.code
ld $a0, M($0)
daddi $a1, $0, tabla
ld $a2, cant($0)
jal mayores
sd $v0, res($0)
halt


mayores: daddi $v0, $0, 0
loop: ld $t0, 0($a1)
slt $t1, $a0, $t0
dadd $v0, $v0, $t1
daddi $a1, $a1, 8
daddi $a2, $a2, -1
bnez $a2, loop
jr $ra