%Toma como valores de entrada el vector de las abscisas (x) y el
%correspondiente a las ordenadas (y), devuelve una matriz con las
%diferencias divididas

function [F]=difdivid(x,y)

F=zeros(length(x));
F(:,1)=y';
for i=2:length(x)
    for j=2:i
        F(i,j)=(F(i,j-1)-F(i-1,j-1))/(x(i)-x((i-j+1)));
    end
end
%x=sym('x');
P=zeros(1,length(y));
for i=1:length(x)  
P(i)=F(i,i);
end
P


