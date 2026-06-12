;Escriba un programa que realice la suma de dos números enteros (de un dígito cada uno) utilizando dos subrutinas: 
;La denominada ingreso del ejercicio anterior (ingreso por teclado de un dígito numérico) y otra  denominada 
;resultado, que muestre en la salida estándar del simulador (ventana Terminal) el resultado numérico de la suma de 
;los dos números ingresados (ejercicio similar al ejercicio 7 de Práctica 2)

.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008

.text
jal ingreso
dadd $a0, $0, $v0
jal ingreso
dadd $a1, $0, $v0
jal suma
halt

ingreso: lwu $s0, CONTROL($0)
lwu $s1, DATA($0)
daddi $t0, $0, 9
daddi $t1, $0, 0x30
daddi $t2, $0, 0x39
reintento: sd $t0, 0($s0)
ld $v0, 0($s1)
slt $t3, $v0, $t1
bnez $t3, reintento
slt $t3, $t2, $v0
bnez $t3, reintento
daddi $v0, $v0, -0x30
jr $ra

suma: dadd $t0, $a0, $a1
daddi $t1, $0, 1
sd $t0, 0($s1)
sd $t1, 0($s0)
jr $ra