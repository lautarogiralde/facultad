;Como  ya  se  observó  anteriormente,  muchas  instrucciones  que  normalmente  forman  parte  del  repertorio  
;de  un procesador con arquitectura CISC no existen en el MIPS64. En particular, el soporte para la invocación a 
;subrutinas es mucho más simple que el provisto en la arquitectura x86 (pero no por ello menos potente). El siguiente 
;programa muestra un ejemplo de invocación a una subrutina

.data 
valor1: .word 16 
valor2: .word 4 
result: .word 0 

.text 
ld    $a0, valor1($0) 
ld    $a1, valor2($0) 
jal   a_la_potencia 
sd    $v0, result($0) 
halt 

a_la_potencia:  daddi $v0, $0, 1
lazo: slt   $t1, $a1, $0
bnez  $t1, terminar
daddi $a1, $a1, -1 
dmul  $v0, $v0, $a0 
j     lazo 
terminar: jr    $ra

;a) ¿Qué hace el programa? ¿Cómo está estructurado el código del mismo? 
;   El programa eleva el valor1 a la potencia valor2 mediante una llamada a subrutina

;b) ¿Qué acciones produce la instrucción jal? ¿Y la instrucción jr? 
;   Jal salta a la etiqueta y guarda en $ra la direccion de retorno, jr salta a la direccion guardada en un registro

;c) ¿Qué valor se almacena en el registro $ra? ¿Qué función cumplen los registros $a0 y $a1? ¿Y el registro $v0? 
;   En el registro $ra se guarda la direccion de la instruccion sd $v0, result($0), $a0 y $a1 son los argumentos de 
;   la subrutina y $v0 es el valor que retorna (resultado final)

;d) ¿Qué sucedería si la subrutina a_la_potencia necesitara invocar a otra subrutina para realizar la multiplicación, 
;   por  ejemplo,  en  lugar  de  usar  la  instrucción  dmul?  ¿Cómo  sabría  cada  una  de  las  subrutinas  a  que  
;   dirección  de memoria deben retornar?
;   Se tendria que preservar la direccion de retorno en la pila para no perderla, porque jal es destructivo con la
;   direccion de retorno.
 