% lagrange interpolación utilizando los polinomios de interpolacion de Lagrange
N=input('cantidad de puntos datos=');
Xint=input('abcisa a interpolar=');
%ingreso de las coordenadas de los datos
%for i=1:N
%   disp(' ')
%   disp('PUNTO DATO NRO:');
%   disp(i);
%   x(i)=input('valor de abcisa=');
%   y(i)=input('valor de ordenada=');
%end
[x,y]=ingresatablaxy(N);
% calculo de los lagrangianos
for i=1:N
   L(i)=1;
   for j=1:N
      if i~=j
         L(i)=L(i).*(Xint-x(j))./(x(i)-x(j))
      end
   end
end
% formacion del polinomio de Lagrange y calculo del valor a interpolar
PNL=0
for i=1:N
   PNL=PNL+y(i).*L(i);
end
disp('resultado de la interpolación')
disp(PNL)

