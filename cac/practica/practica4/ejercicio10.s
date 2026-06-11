;Escribir un programa que cuente la cantidad de veces que un determinado caracter aparece en una cadena de texto. 
;Observar cómo se almacenan en memoria los códigos ASCII de los caracteres (código de la letra “a” es 61H). Utilizar 
;la instrucción lbu (load byte unsigned) para cargar códigos en registros.
;La inicialización de los datos es la siguiente:  

.data 
cadena: .asciiz "adbdcdedfdgdhdid" ; cadena a analizar 
car: .asciiz "d" ; caracter buscado 
cant: .word 0 ; cantidad de veces que se repite el caracter car en cadena.

.code
daddi $t0, $0, cadena
lbu $t1, car($0)
daddi $t4, $0, 0

loop: lbu $t3, 0($t0)
beq $t3, $t1, sumo
sigo: daddi $t0, $t0, 1
bnez $t3, loop
j fin

sumo: daddi $t4, $t4, 1
j sigo
fin: sd $t4, cant($0)
halt