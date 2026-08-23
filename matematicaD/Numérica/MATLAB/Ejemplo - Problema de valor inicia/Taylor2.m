function [T,Y] = taylor2(f,a,b,ya,m,delta_t,delta_y,salida)
%---------------------------------------------------------------------------
%TAYLOR    Metodo de taylor de segundo orden
%          para calcular la solucion aproximada
%          de y' = f(t,y) con condicion inicial y(a) = ya.
%          y'' es calculada en forma numerica
% Para llamarla
%   [T,Y] = taylor2('f',a,b,ya,m,delta_t,delta_y,salida)
%
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
%---------------------------------------------------------------------------

h = (b - a)/m;
T = zeros(1,m+1);
Y = zeros(1,m+1);
T(1) = a;
Y(1) = ya;
for j=1:m,
  tj = T(j);
  yj = Y(j);
    
  D(1) = feval(f,tj,yj);
  df_dt=(feval(f,tj+delta_t,yj)-D(1))/delta_t;
  df_dy=(feval(f,tj,yj+delta_y)-D(1))/delta_y;
  D(2)=df_dt+df_dy*D(1);
  
  Y(j+1) = yj + h*D(1)+h^2/2*D(2);
  T(j+1) = a + h*j;
end

if salida==1
   plot (T,Y,'*r')
end   