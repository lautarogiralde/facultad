.data
A: .word 1
B: .word 2
.code
ld r1, A(r0)
ld r2, B(r0)
sd r2, A(r0)
sd r1, B(r0)
halt

a)  Si no se activa el forwarding, el prgrama tiene 2 stalls (atascos) RAW. Porque hasta que la instruccion ld r2, 
    B(r0) no llega al final no se puede usar el registro r2.
    Tiene un promedio de 2.5 ciclos por instruccion. Ejecuta 4 instrucciones en 10 ciclos

b)  Cuando el forwarding esta activado, el programa no tiene stalls porque el registro r2 obtiene el dato en 
    la etapa Ex, mientras que el sd r2, A(r0) necesita el dato en la etapa Id. Entonces saca el resultado 
    directamente de la ALU en el mismo ciclo que lo requiere la instruccion siguiente.
    El color de los registros indican que se cargó un dato en ese registro, cambia de color cuando llega a la etapa
    WB