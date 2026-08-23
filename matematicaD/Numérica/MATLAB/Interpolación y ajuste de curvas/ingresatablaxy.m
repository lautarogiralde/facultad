function[x,y]=ingresatablaxy(n);
equi=input('Escriba 1 si las abscisas son equiespaciadas:');
if equi==1
   vi=input('Valor inferior de x=');
   vs=input('Valor superior de x=');
   dx=input('Delta x=');
   x=vi:dx:vs;
   if (vs-vi)./dx+1==n
      for i=1:n
         b=['y(' int2str(i) ')='];
         y(i)=input(b);
      end
   else
      error('no coincide la cantidad de puntos con los valores ingresados')
   end
else
   for i=1:n
     	a=['x(' int2str(i) ')='];
      x(i)=input(a);
      b=['y(' int2str(i) ')='];
      y(i)=input(b);
   end
end
bien=2;
while bien==2
  bien=input('ingresa 1 si los datos son correctos o 2 si corrige datos ');
  if bien==2

    xoy=input('ingrese 1 si corrige x ')
    if xoy==1
       i=input('numero de orden de la abcsisa a corregir=');
       nv=input('nuevo valor=')
       x(i)=nv;
    end

    xoy=input('ingrese 1 si corrige y ')
    if xoy==1
      i=input('numero de orden de la ordenada a corregir=');
      nv=input('nuevo valor=')
      y(i)=nv;
    end
  end
end

