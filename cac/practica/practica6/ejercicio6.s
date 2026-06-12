;El siguiente programa produce una salida estableciendo el color de un punto de la pantalla gráfica (en la ventana 
;Terminal del simulador WinMIPS64). Modifique el programa de modo que las coordenadas y color del punto sean ingresados 
;por teclado.

.data
coorX:   .byte   24
coorY:   .byte   24
color:   .byte   255, 0, 255, 0
CONTROL: .word32 0x10000 
DATA: .word32 0x10008 
 
.text 
lwu $s6, CONTROL(r0)
lwu $s7, DATA(r0)

daddi  $t0, $0, 7
sd $t0, 0($s6)

lbu $s0, coorX(r0)
sb $s0, 5($s7)
lbu $s1, coorY(r0)
sb $s1, 4($s7)
lwu $s2, color(r0)
sw $s2, 0($s7)

daddi  $t0, $0, 5
sd $t0, 0($s6)
halt