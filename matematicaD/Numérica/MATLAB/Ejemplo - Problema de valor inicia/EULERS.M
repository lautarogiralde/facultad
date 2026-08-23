function [T,Y] = eulers(f,a,b,ya,m,salida)
%---------------------------------------------------------------------------
%Metodo de EULER solucion a y' = f(t,y) con condicion inicialy(a) = ya.
% Para llamarla
% [T,Y] = eulers('f',a,b,ya,m,salida)
% Entrada
%   f    = nombre de la funcion
%   a    = punto inicial en el intervalo [a,b]
%   b    = punto final en el intervalo [a,b]
%   ya   = valor inicial
%   m    = numero de pasos
% salida = igual a 1 visualiza los resultados
%
% Salida
%   T    = puntos donde se calcula la solucion aproximada (grilla)
%   Y    = solucion aproximada
%
%---------------------------------------------------------------------------

h = (b - a)/m;
T = zeros(1,m+1);
Y = zeros(1,m+1);
T(1) = a;
Y(1) = ya;
for j=1:m,
  Y(j+1) = Y(j) + h*feval(f,T(j),Y(j));
  T(j+1) = a + h*j;
end

if salida==1
   plot (T,Y,'*r')
end   