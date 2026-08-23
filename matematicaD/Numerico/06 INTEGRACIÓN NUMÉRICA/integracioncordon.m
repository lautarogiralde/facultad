% integracion
% programa que aplica trapecios compuesto y simpson compuesto para el cálculo de un volumen de relleno

clc
clear vars
clear all
% DATOS
x=[6.88 7.6 10.1 12.6 15.1 17.6 20.1 22.6 25.1 27.6 30.1 35.1 40.1 45.1];
y=[11.1 9.66 7.19 7.7 8.03 8.3 8.63 9 9.18 9.46 9.74 10.3 10.7 11.1];
cotaagua=11.1;
hold off
plot(x,y)

% Sup1: volumen de agua hasta la cota 11.1m
% Sup12: volumen de suelo hasta la cota del cordón cuneta

% Cálculo del Sup1
Sup1=cotaagua*(x(end)-x(1));

% Cálculo de Sup2 por suma de Trapecios Simple
suma=0;
for i=1:length(x)-1   %%% también puede escribirse for i=2:12
  suma=suma+(y(i)+y(i+1))*(x(i+1)-x(i))/2;
end
Sup2=suma
SupAgua=Sup1-Sup2
Q=0.6*SupAgua


