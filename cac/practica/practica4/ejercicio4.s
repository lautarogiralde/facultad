.data 
tabla: .word 20, 1, 14, 3, 2, 58, 18, 7, 12, 11
num:	.word 7
long: .word 10

.code
ld	r1, long(r0)
ld	r2, num(r0)
dadd r3, r0, r0
dadd r10, r0, r0
loop: ld r4, tabla(r3)
beq	r4, r2, listo
daddi r1, r1, -1
daddi r3, r3, 8
bnez	r1, loop
j fin
listo:  daddi r10, r0, 1 
fin:    halt

;a)	Ejecutar en simulador con Forwarding habilitado. ¿Qué tarea realiza? ¿Cuál es el resultado y dónde queda indicado?
;   El codigo verifica si en la tabla esta el numero 7, en caso de encontrar el valor pone el r10 en 1
;   Con los datos proporcionados va a terminar con r10 en 1
;b)	Re-Ejecutar el programa con la opción Configure/Enable Branch Target Buffer habilitada. 
;   Explicar la ventaja de usar este método y cómo trabaja.
;   Con Branch Target Buffer el codigo tiene menos atascos Branch Taken, debido a que cambia la prediccion de salto en caso de equivocarse
;   Para cada instruccion se salto hay un registro en una tabla donde indica si la vez anterior se salto o no, permite que ejecute la proxima
;   instruccion y en caso de equivocarse va a perder un ciclo re reloj para hacer el Fetch de la instruccion correcta.

;c)	Confeccionar una tabla que compare número de ciclos, CPI, RAWs y Branch Taken Stalls para los dos casos anteriores.
;   