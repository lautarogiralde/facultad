        .data 
cant:   .word 8 
datos:  .word 1, 2, 3, 4, 5, 6, 7, 8 
res:    .word 0 
        .code 
        dadd   r1, r0, r0 
        ld  r2, cant(r0) 
loop:   ld  r3, datos(r1) 
        daddi  r2, r2, -1 
        dsll   r3, r3, 1 
        sd  r3, res(r1) 
        bnez   r2, loop 
        daddi  r1, r1, 8 
        halt

;   a) ¿Qué efecto tiene habilitar la opción Delay Slot (salto retardado)?. 
;   Se ejecuta la instruccion nop por completo, en caso de estar desactivado esta instruccion llega a la etapa IF y se anula porque no le corresponde saltar

;   b) ¿Con qué fin se incluye la instrucción NOP? ¿Qué sucedería si no estuviera?. 
;   Si no estuviera la instruccion nop y se ejecuta el programa con Delay Slot, el mismo termina en la primer iteracion porque ejecutaria la isntruccion halt

;   c) Tomar nota de la cantidad de ciclos, la cantidad de instrucciones y los CPI luego de ejecutar el programa. 
;   Ciclos: 88
;   Instrucciones: 59
;   CPI: 1.492
;   RAWs: 25

;   d) Modificar  el  programa  para  aprovechar  el  ‘Delay  Slot’  ejecutando  una  instrucción  útil.  Simular  y  comparar  número  de 
;      ciclos, instrucciones y CPI obtenidos con los de la versión anterior. 
;   
;           .data 
;   cant:   .word 8 
;   datos:  .word 1, 2, 3, 4, 5, 6, 7, 8 
;   res:    .word 0 
;           .code 
;           dadd   r1, r0, r0 
;           ld  r2, cant(r0) 
;   loop:   ld  r3, datos(r1) 
;           daddi  r2, r2, -1 
;           dsll   r3, r3, 1 
;           daddi  r1, r1, 8 
;           bnez   r2, loop 
;           sd  r3, res(r1) 
;           halt
;
;   Ciclos: 72
;   Instrucciones: 51
;   CPI: 1.421
;   RAWs: 17