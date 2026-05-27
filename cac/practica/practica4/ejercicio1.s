a) dadd r1, r2, r0
Suma el registro 2 con el registro 0 (siempre vale 0) y guarda el resultado en el registro 1,
MOV AX, DX
b) daddi r3, r0, 5
Suma 5 al registro 0 y guarda el resultado en el registro 3
MOV AX, 5
c) dsub r4, r4, r4
Resta el registro 4 con el registro 4 y guarda el resultado en el registro 4
SUB AX, AX
d) daddi r5, r5, -1
Suma -1 al registro 5 y guarda el resultado en el registro 5
DEC AX
e) xori r6, r6, 0xffffffffffffffff
Hace un xor al registro 6 con el valor inmediato 0xffffffffffffffff
XOR AX, 0FFh