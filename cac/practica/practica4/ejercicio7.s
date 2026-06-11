;Escribir un programa que recorra una TABLA de diez números enteros y determine cuántos elementos son mayores que X.
;El resultado debe  almacenarse  en una  dirección etiquetada  CANT. El programa  debe  generar además otro arreglo
;llamado RES cuyos elementos sean ceros y unos. Un ‘1’ indicará que el entero correspondiente en el  arreglo  TABLA
;es  mayor  que  X, mientras que un ‘0’ indicará que es menor o igual. 

.data
TABLA: .word 1,2,3,4,5,6,7,8,9,10
X: .word 6
CANT: .word 0
RES: .word 0

.code
daddi $t0, $0, 10
daddi $t1, $0, 0
daddi $t2, $0, TABLA
daddi $t3, $0, RES
ld $t4, X($0)

loop: ld $t5, 0($t2)
slt $t6, $t4, $t5
dadd $t1, $t1, $t6
sd $t6, 0($t3)
daddi $t2, $t2, 8
daddi $t3, $t3, 8
daddi $t0, $t0, -1
bnez $t0, loop
sd $t1, CANT($0)
halt