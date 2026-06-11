;   Escribir un programa que implemente el siguiente fragmento escrito en un lenguaje de alto nivel:  
;   while a > 0 do 
;   begin 
;     x := x + y; 
;     a := a - 1; 
;    end; 
;   Ejecutar con la opción Delay Slot habilitada

.data
x: .word 0
y: .word 1
a: .word 3
res: .word 0

.code

ld $t0, x($0)
ld $t1, y($0)
ld $t2, a($0)

beqz $t2, fin
slti $t3, $t2, 0
bnez $t3, fin
nop

loop: daddi $t2, $t2, -1
bnez $t2, loop
dadd $t0, $t0, $t1

sd $t0, res($0)

fin: halt
