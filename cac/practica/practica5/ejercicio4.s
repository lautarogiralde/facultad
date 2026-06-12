;   El índice de masa corporal (IMC) es una medida de asociación entre el peso y la talla de un individuo . 
;   Se  calcula  a  partir  del  peso  (expresado  en  kilogramos,  por  ejemplo:  75,7  kg)  y  la  estatura  
;   (expresada  en  metros, por ejemplo 1,73 m), usando la fórmula: 
;   IMC = peso / (estatura)2 
;   De acuerdo al valor calculado con este índice, puede clasificarse el estado nutricional de una persona en: 
;   Infrapeso (IMC < 18,5),  Normal (18,5 ≤ IMC < 25), Sobrepeso (25 ≤ IMC < 30) y Obeso (IMC ≥ 30). 

;   Escriba un programa que dado el peso y la estatura de una persona calcule su IMC y lo guarde en la dirección 
;   etiquetada IMC. También deberá guardar en la dirección etiquetada estado un valor según la siguiente tabla: 
;   IMC     Clasificación   Valor guardado 
;   <18,5   Infrapeso       1
;   <25     Normal          2
;   <30     Sobrepeso       3
;   ≥30     Obeso           4

.data
peso: .double 70.7
altura: .double 1.73
IMC: .double 0
estado: .double 0
Infrapeso: .double 18.5
Normal: .double 25
Sobrepeso: .double 30

.code
l.d f0, peso($0)
l.d f1, altura($0)

mul.d f2, f1, f1
div.d f3, f0, f2
s.d f3, IMC($0)

l.d f4, Infrapeso($0)
l.d f5, Normal($0)
l.d f6, Sobrepeso($0)

;bc1f   offN Salta a la dirección rotulada offN si flag FP=0 (ó false) (en punto flotante) 
;bc1t   offN Salta a la dirección rotulada offN si flag FP=1 (ó true) (en punto flotante) 

;c.lt.d  fd, ff Compara fd con ff, dejando flag FP=1 si fd es menor que ff (en punto flotante) 
;c.le.d  fd, ff Compara fd con ff, dejando flag FP=1 si fd es menor o igual que ff (en punto flotante) 
;c.eq.d  fd, ff Compara fd con ff, dejando flag FP=1 si fd es igual que ff (en punto flotante)

c.lt.d f3, f4
bc1t resInfrapeso

c.lt.d f3, f5
bc1t resNormal

c.lt.d f3, f6
bc1t resSobrepeso 

j resObeso


resInfrapeso: daddi $t3, $0, 1
j fin

resNormal: daddi $t3, $0, 2
j fin

resSobrepeso: daddi $t3, $0, 3
j fin

resObeso: daddi $t3, $0, 4

fin: sd $t3, estado($0)
halt

