;Escriba un programa que utilice sucesivamente dos subrutinas: La primera, denominada ingreso, debe solicitar  el 
;ingreso por teclado de un número entero (de un dígito), verificando que el valor ingresado realmente sea un dígito. 
;La segunda, denominada muestra, deberá mostrar en la salida estándar del simulador (ventana Terminal) el valor del 
;número ingresado expresado en letras (es decir, si se ingresa un ‘4’, deberá mostrar ‘CUATRO’). Establezca el pasaje 
;de parámetros entre subrutinas respetando las convenciones para el uso de los registros y minimice las detenciones 
;del cauce (ejercicio similar al ejercicio 6 de Práctica 2).

.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
cero: .asciiz "CERO"
uno: .asciiz "UNO"
dos: .asciiz "DOS"
tres: .asciiz "TRES"
cuatro: .asciiz "CUATRO"
cinco: .asciiz "CINCO"
seis: .asciiz "SEIS"
siete: .asciiz "SIETE"
ocho: .asciiz "OCHO"
nueve: .asciiz "NUEVE"

.text
daddi $sp, $0, 0x400
jal ingreso
halt

ingreso: lwu $s0, CONTROL($0)
lwu $s1, DATA($0)
daddi $t0, $0, 9
daddi $t1, $0, 0x30
daddi $t2, $0, 0x39
reintento: sd $t0, 0($s0)
ld $t3, 0($s1)
slt $t4, $t3, $t1
bnez $t4, reintento
slt $t4, $t2, $t3
bnez $t4, reintento
daddi $sp, $sp, -8
sd $ra, 0($sp)
jal escribo
ld $ra, 0($sp)
daddi $sp, $sp, 8
jr $ra

escribo: daddi $t0, $0, 6
sd $t0, 0($s0)
daddi $t2, $0, 0x31
beq $t3, $t1, eCero
beq $t3, $t2, eUno
daddi $t1, $0, 0x32
daddi $t2, $0, 0x33
beq $t3, $t1, eDos
beq $t3, $t2, eTres
daddi $t1, $0, 0x34
daddi $t2, $0, 0x35
beq $t3, $t1, eCuatro
beq $t3, $t2, eCinco
daddi $t1, $0, 0x36
daddi $t2, $0, 0x37
beq $t3, $t1, eSeis
beq $t3, $t2, eSiete
daddi $t1, $0, 0x38
daddi $t2, $0, 0x39
beq $t3, $t1, eOcho
beq $t3, $t2, eNueve

eCero: daddi $t0, $0, cero
sd $t0, 0($s1)
daddi $t1, $0, 4
sd $t1, 0($s0)
jr $ra

eUno: daddi $t0, $0, uno
sd $t0, 0($s1)
daddi $t1, $0, 4
sd $t1, 0($s0)
jr $ra

eDos: daddi $t0, $0, dos
sd $t0, 0($s1)
daddi $t1, $0, 4
sd $t1, 0($s0)
jr $ra

eTres: daddi $t0, $0, tres
sd $t0, 0($s1)
daddi $t1, $0, 4
sd $t1, 0($s0)
jr $ra

eCuatro: daddi $t0, $0, cuatro
sd $t0, 0($s1)
daddi $t1, $0, 4
sd $t1, 0($s0)
jr $ra

eCinco: daddi $t0, $0, cinco
sd $t0, 0($s1)
daddi $t1, $0, 4
sd $t1, 0($s0)
jr $ra

eSeis: daddi $t0, $0, seis
sd $t0, 0($s1)
daddi $t1, $0, 4
sd $t1, 0($s0)
jr $ra

eSiete: daddi $t0, $0, siete
sd $t0, 0($s1)
daddi $t1, $0, 4
sd $t1, 0($s0)
jr $ra

eOcho: daddi $t0, $0, ocho
sd $t0, 0($s1)
daddi $t1, $0, 4
sd $t1, 0($s0)
jr $ra

eNueve: daddi $t0, $0, nueve
sd $t0, 0($s1)
daddi $t1, $0, 4
sd $t1, 0($s0)
jr $ra