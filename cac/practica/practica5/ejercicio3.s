;   Escribir  un  programa  que  calcule  la  superficie  de  un  triángulo  rectángulo  de  base  5,85  cm  y  altura  13,47  cm. 
;   Pista: la superficie de un triángulo se calcula como:   
;   Superficie = (base x altura) / 2

.data
base: .double 5.85
altura: .double 13.47
res: .double 0

.code
l.d f1, base($0)
l.d f2, altura($0)
daddi $t0, $0, 2
mtc1 $t0, f3
cvt.d.l f3, f3

mul.d f4, f1, f2
div.d f4, f4, f3

s.d f4, res($0)
halt