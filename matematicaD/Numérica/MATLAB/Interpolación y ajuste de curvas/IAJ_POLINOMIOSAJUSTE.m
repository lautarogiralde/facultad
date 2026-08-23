%programa4 Programa que permite cargar las cordenadas de n puntos,
%dibujarlos y encontrar los polinomios de ajuste hasta grado n-1
%dibujándolos en distintos colores y en punteado la interpolación cúbica
%segmentaria
clear
n=input('Ingrese la cantidad de puntos ');
[x,y]=ingresatablaxy(n);
hold off
plot(x,y,'ro')
grid
figure(1)

%vector para colores de graficación
c=['m' 'c' 'r' 'g' 'b' 'k' 'y'];

%abcsisas para el dibujo de los polinomios de ajuste
minimox=min(x);
maximox=max(x);
xd=minimox:.0001:maximox;

hold on
axis([minimox maximox min(y) max(y)])
for i=1:n-1
    %generación de los polinomios de ajuste p(1).x^i + p(2).x^(i-1)...
    p=polyfit(x,y,i)
    yd=polyval(p,xd);
    %dibujo con distintos colores de los polinomios de ajuste
    plot(xd,yd,c(i))
    leyenda=['grado ' int2str(i)];
    text(x(i),polyval(p,x(i)),leyenda,'Color',c(i))
    figure(1)
    pause
end
yspline=spline(x,y,xd);
plot(xd,yspline,':b')
figure(1)
