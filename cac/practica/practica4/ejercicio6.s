;   Escribir un programa que lea tres números enteros A, B y C de la memoria de datos y determine cuántos de ellos son 
;   iguales entre sí (0, 2 o 3). El resultado debe quedar almacenado en la dirección de memoria D.

.data
    ; Definición de las variables en la memoria de datos (64 bits)
    A: .word 5
    B: .word 2
    C: .word 5
    D: .word 0

.text
main:
    ; --- PASO 1: Cargar los valores de memoria a registros ---
    ld r1, A(r0)      ; r1 = A
    ld r2, B(r0)      ; r2 = B
    ld r3, C(r0)      ; r3 = C

    ; --- PASO 2: Verificar si los tres son iguales ---
    bne r1, r2, comp_parejas  ; Si A != B, no pueden ser los 3 iguales. Saltamos.
    bne r2, r3, caso_dos      ; Si A == B pero B != C, entonces hay 2 iguales.
    
    ; Si llegó aquí, A == B y B == C (por lo tanto, los 3 son iguales)
    daddi r4, r0, 3           ; r4 = 3
    sd r4, D(r0)              ; Guardar 3 en D
    halt                      ; Fin del programa

caso_dos:
    ; Caso específico donde A == B pero B != C (ej. 5, 5, 9)
    daddi r4, r0, 2           ; r4 = 2
    sd r4, D(r0)              ; Guardar 2 en D
    halt

comp_parejas:
    ; Si estamos aquí, ya sabemos que A != B. 
    ; Ahora falta ver si B == C o si A == C.
    beq r2, r3, hay_dos       ; Si B == C, entonces hay 2 iguales.
    beq r1, r3, hay_dos       ; Si A == C, entonces hay 2 iguales.

    ; --- PASO 3: Si ninguna pareja coincide, son 0 iguales ---
    daddi r4, r0, 0           ; r4 = 0
    sd r4, D(r0)              ; Guardar 0 en D
    halt

hay_dos:
    ; Si saltó aquí, se cumplió que (B == C) o (A == C)
    daddi r4, r0, 2           ; r4 = 2
    sd r4, D(r0)              ; Guardar 2 en D
    halt