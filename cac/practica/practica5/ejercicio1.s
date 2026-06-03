.data
n1: .double 9.13
n2: .double 6.58
res1: .double 0.0
res2: .double 0.0
.code
l.d f1, n1(r0)
l.d f2, n2(r0)
;nop
add.d f3, f2, f1
mul.d f1, f2, f1
mul.d f4, f2, f1
s.d f3, res1(r0)
s.d f4, res2(r0)
halt

;a) Tomar nota de la cantidad de ciclos, instrucciones y CPI luego de la ejecución del programa.
;   Ciclos: 16
;   Instrucciones: 7
;   CPI: 2.286

;b) ¿Cuántos atascos por dependencia de datos se generan? Observar en cada caso cuál es el dato en conflicto y las 
;   instrucciones involucradas.
;   Se generan 4 atascos RAW, lo generan las instrucciones s.d. El programa se atasca porque necesita varios ciclos para operar con 
;   numeros en punto flotante. La suma requiere 4 ciclos para realizar una suma y 7 para la multiplicacion.

;c) ¿Por qué se producen los atascos estructurales? Observar cuales son las instrucciones que los generan y en qué
;   etapas del pipeline aparecen.
;   Los atascos estructurales se generan porque la instruccion s.d y la instruccion add.d/mul.d quieren entrar a la etapa 
;   Mem en el mismo ciclo, entra el que primero entro a la etapa Ex.

;d) Modificar el programa agregando la instrucción mul.d f1, f2, f1 entre las instrucciones add.d y mul.d.
;   Repetir la ejecución y observar los resultados. ¿Por qué aparece un atasco tipo WAR?
;   El atasco WAR se genra porque se intenta escribir un registro que todavia no se termino de cargar. 
;   Hasta que el l.d no termina la etapa WB no se puede escribir el registro.

;e) Explicar por qué colocando un NOP antes de la suma, se soluciona el RAW de la instrucción ADD y como
;   consecuencia se elimina el WAR.
;   Se soluciona el atasco RAW porque se atrasa un ciclo, ahora le da tiempo a escribir el registro antes de intentar leerlo.
