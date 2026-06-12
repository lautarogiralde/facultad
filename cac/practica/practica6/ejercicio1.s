;El siguiente programa produce la salida de un mensaje predefinido en la ventana Terminal del simulador 
;WinMIPS64. Teniendo en cuenta las condiciones de control del puerto de E/S (en el resumen anterior), modifique el 
;programa de modo que el mensaje a mostrar sea ingresado por teclado en lugar de ser un mensaje fijo.

.data 
texto: .space 100
CONTROL: .word32  0x10000 
DATA: .word32  0x10008 
  
.text 
lwu $s0, DATA(r0)
lwu $s1, CONTROL(r0)
daddi $t3, $0, 0x30
daddi  $t0, $0, texto
daddi $t1, $0, 9
loop: sd $t1, 0($s1)
lbu $t2, 0($s0)
beq $t2, $t3, fin_cadena
sb $t2, 0($t0)
daddi $t0, $t0, 1
j loop

fin_cadena: daddi  $t0, $0, 6
sd $t0, 0($s1)
daddi $t0, $0, texto
sd $t0, 0($s0)

daddi  $t0, $0, 4
sd $t0, 0($s1)
halt
