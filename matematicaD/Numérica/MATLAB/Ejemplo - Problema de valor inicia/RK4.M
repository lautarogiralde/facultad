function [T,Y] = rk4(f,a,b,ya,m,salida)
%---------------------------------------------------------------------------
%RK4   Metodo de Runge-Kutta para calcular la solucion 
%      aproximada de y' = f(t,y) con la condicion inicial y(a) = ya.
% Como llamarla
%   [T,Y] = rk4('f',a,b,ya,m,salida)
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
  k1 = h*feval(f,tj,yj);
  k2 = h*feval(f,tj+h/2,yj+k1/2);
  k3 = h*feval(f,tj+h/2,yj+k2/2);
  k4 = h*feval(f,tj+h,yj+k3);
  Y(j+1) = yj + (k1 + 2*k2 + 2*k3 + k4)/6;
  T(j+1) = a + h*j;
end

if salida==1
   plot (T,Y,'*r')
end   