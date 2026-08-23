function [H]=hermite(x,y,y1)
H=zeros(2.*length(x));
z=zeros(1,length(x)+1);
for i=1:length(x)
    z(2.*i-1)=x(i);
    z(2.*i)=x(i);
    H(2.*i-1,1)=y(i);
    H(2.*i,1)=y(i);
    H(2.*i,2)=y1(i);

    if i~=1
        H(2.*i-1,2)=(H(2.*i-1,1)-H(2.*i-2,1))./(z(2.*i-1)-z(2.*i-2));
    end
end

for i=3:2.*length(x)
    for j=3:i
        H(i,j)=(H(i,j-1)-H(i-1,j-1))/(z(i)-z(i-j+1));
    end
end

%Toma como par{ametros de entrada el vector de las abscisas (x), el de las
%ordenadas (y) y el de la derivada en cada punto (y1), devuelve una matriz.
%De la matriz de salida se utilizan los coeficientes de la diagonal para obtener el polinomio de Hermite,
%H(x)=H(1,1)+(x-x(1)*H(2,2)+(x-x(1))^2*H(3,3)+(x-x(1))^2*(x-x(3))*H(4,4)+(x-x(1))^2*(x-x(3))^2*H(5,5)+
%(x-x(1))^2*(x-x(3))^2*(x-x(5))*H(6,6)....