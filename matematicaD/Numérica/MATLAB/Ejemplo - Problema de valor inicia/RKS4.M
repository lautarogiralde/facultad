function [T,Z] = rks4(Fn,a,b,Za,m,salida)
%---------------------------------------------------------------------------
%RKS4   metodo de Runge-Kutta para sistemas de ecuaciones difernciales
%       Z' = F(t,Z) con la condicion inicial Z(a) = Za.
% Forma de llamarla
%   [T,Y] = rks4('f',a,b,Za,m,salida)
% 
% Entrada
%   Fn   = nombre de la funcion
%   a    = punto inicial en el intervalo [a,b]
%   b    = punto final en el intervalo [a,b]
%   Za   = vector de los valores inicial
%   m    = numero de pasos
% salida = igual a 1 visualiza los resultados
% Salida

%   T    = puntos donde se calcula las soluciones aproximadas (grilla)
%   Y    = matriz de los vectores solucion
%---------------------------------------------------------------------------

h = (b - a)/m;
T = zeros(1,m+1);
Z = zeros(m+1,length(Za));
T(1) = a;
Z(1,:) = Za;
for j=1:m,
  tj = T(j);
  Zj = Z(j,:);
  K1 = h*feval(Fn,tj,Zj);
  K2 = h*feval(Fn,tj+h/2,Zj+K1/2);
  K3 = h*feval(Fn,tj+h/2,Zj+K2/2);
  K4 = h*feval(Fn,tj+h,Zj+K3);
  % En cada columna tenemos una de las soluciones del sistema
  Z(j+1,:) = Zj + (K1 + 2*K2 + 2*K3 + K4)/6;
  T(j+1) = a + h*j;
end

if salida==1
   hold on
   for i=1:size(Z,2)
      plot (T,Z(:,i),'.g')
   end   
end   