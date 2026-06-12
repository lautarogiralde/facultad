;Escriba un programa que solicite el ingreso por teclado de una clave (sucesión de cuatro caracteres) utilizando la 
;subrutina char de ingreso de un carácter. Luego, debe comparar la secuencia ingresada con una cadena almacenada en 
;la variable clave. Si las dos cadenas son iguales entre si, la subrutina llamada respuesta mostrará el texto 
;“Bienvenido” en la salida estándar del simulador (ventana Terminal). En cambio, si las cadenas no son iguales, la 
;subrutina deberá mostrar “ERROR” y solicitar nuevamente el ingreso de la clave

.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
cadena: .space 4
clave: .asciiz "aaaa"
bienvenido: .asciiz "Bienvenido"
error: .asciiz "ERROR"

.text
lwu $s0, CONTROL($0)
lwu $s1, DATA($0)
jal char
jal respuesta
halt



char: daddi $t0, $0, cadena
daddi $t2, $0, 4
daddi $t1, $0, 9
loop: sd $t1, 0($s0)
lbu $t3, 0($s1)
sb $t3, 0($t0)
daddi $t0, $t0, 1
daddi $t2, $t2, -1
bnez $t2, loop
jr $ra


respuesta: daddi $t0, $0, 4
daddi $t1, $0, cadena
daddi $t2, $0, clave
loopRes: lb $t3, 0($t1)
lb $t4, 0($t2)
bne $t3, $t4, mError
daddi $t0, $t0, -1
daddi $t1, $t1, 1
daddi $t2, $t2, 1
bnez $t0, loopRes
daddi $t0, $0, bienvenido
sd $t0, 0($s1)
daddi $t1, $0, 6
sd $t1, 0($s0)
daddi $t1, $0, 4
sd $t1, 0($s0)
jr $ra

mError: daddi $t0, $0, error
sd $t0, 0($s1)
daddi $t1, $0, 6
sd $t1, 0($s0)
daddi $t1, $0, 4
sd $t1, 0($s0)
jr $ra