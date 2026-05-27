       .data
       A:	.word 1
       B:	.word 6
       PARCIALES: .word 0
       .code
           ld	r2, B(r0) 
           ld	r1, A(r0)
           daddi r3, r0, 0
       loop: daddi r2, r2, -1 
           dsll	r1, r1, 1
           sd r1, PARCIALES(r3)
           daddi r3, r3, 8
           bnez	r2, loop 
           halt


;.data
;A:	.word 1
;B:	.word 6
;.code
;    ld	r1, A(r0)
;    ld	r2, B(r0) 
;loop: dsll	r1, r1, 1
;    daddi r2, r2, -1 
;    bnez	r2, loop 
;    halt


;a)	Ejecutar el programa con Forwarding habilitado y responder:
;   -¿Por qué se presentan atascos tipo RAW?
;       Porque intenta leer el dato guardado en r2 antes de que salga el resultado por la ALU. Es necesario atascar hasta pasada la 
;       etapa Execute

;   -Branch Taken es otro tipo de atasco que aparece. ¿Qué significa? ¿Por qué se produce?
;       Significa que la prediccion de salto fue erronea. Se produce porque se hace un Fetch erroneo a la instruccion siguiente, se tiene que 
;       hacer el Fetch a la instruccion del loop en otro ciclo

;   -¿Cuántos CPI tiene la ejecución de este programa? Tomar nota del número de ciclos, cantidad de instrucciones y CPI.
;       CPI=1.714
;       Cantidad de ciclos=34
;       Cantidad de instrucciones=21

;b)	Ejecutar ahora el programa deshabilitando el Forwarding y responder:
;   -¿Qué instrucciones generan los atascos tipo RAW y por qué? ¿En qué etapa del cauce se produce el atasco en cada caso y durante 
;   cuántos ciclos?
;       Los atascos de tipo RAW los geenera la instruccion bnez, hasta que no tiene el dato en r2 no puede hacer el Decode. El registro r2 no
;       se escribe hasta que el daddi no llega a la etapa de WriteBack, por ello la instruccion se atasca un ciclo mas que cuando estaba el 
;       forwarding activado.

;   -Los Branch Taken Stalls se siguen generando. ¿Qué cantidad de ciclos dura este atasco en cada vuelta del lazo ‘loop’? 
;   Comparar con la ejecución con Forwarding y explicar la diferencia.
;       Si, los branch taken stalls se siguen generando. Esto se debe a que estos atascos se generan porque la prediccion de salto es erronea.
;       no se sabe si el programa va a saltar o no hasta que la instruccion bnez no llega a la etapa Intstruction Decode.
;       Toma los mismos ciclos de reloj atascado que cuando estaba el forwarding activado. Esto se debe a que no tiene que leer un registro, sino
;       que tiene que terminar de decodificar la instruccion de salto para saber que camino se toma.

;   -¿Cuántos CPI tiene la ejecución del programa en este caso? Comparar número de ciclos, cantidad de instrucciones y CPI con el caso con Forwarding.
;       CPI=2.048
;       Cantidad de ciclos=43
;       Cantidad de instrucciones=21

;c) Reordenar las instrucciones para que la cantidad de RAW sea ‘0’ en la ejecución del programa (Forwarding habilitado)

;       .data
;       A:	.word 1
;       B:	.word 6
;       .code
;           ld	r2, B(r0) 
;           ld	r1, A(r0)
;       loop: daddi r2, r2, -1 
;           dsll	r1, r1, 1
;           bnez	r2, loop 
;           halt

;d)	Modificar el programa para que almacene en un arreglo en memoria de datos los contenidos parciales del registro r1 ¿Qué significado 
;   tienen los elementos de la tabla que se genera?

;       .data
;       A:	.word 1
;       B:	.word 6
;       PARCIALES .word 0
;       .code
;           ld	r2, B(r0) 
;           ld	r1, A(r0)
;       loop: daddi r2, r2, -1 
;           dsll	r1, r1, 1
;           sd r1, PARCIALES(r2)
;           bnez	r2, loop 
;           halt