% integracion
% programa que aplica trapecios compuesto y simpson compuesto para el cálculo de un volumen de relleno

clc
clear vars

% DATOS
x=0:10:120;
y=[11 11.3 11.5 12 13 13.2 13.3 13.3 14 12.9 12.8 12.6 12];
cotarelleno=15;
h=10;

% Vol1: volumen de suelo hasta la cota 15m
% Vol2: volumen de suelo hasta la cota del TN

% Cálculo del Vol1
Vol1=cotarelleno*100*120;

% Cálculo de Vol2 por Trapecios Compuesto
suma=0;
for i=2:length(x)-1   %%% también puede escribirse for i=2:12
  suma=suma+y(i);
end
IntTC=(h/2)*(y(1)+2*suma+y(end))    %%% en vez de y(end) podría escribir y(13)
Vol2TC=IntTC*100
RellenoTC=Vol1-Vol2TC


% Cálculo de Vol2 por Simpson Compuesto

% suma de los pares del método
sumap=0
for i=3:2:length(x)-1
  sumap=sumap+y(i);
end

% suma de los impares del método
sumai=0
for i=2:2:length(x)
  sumai=sumai+y(i);
end

% Integral por Simpson Compuesto
IntSC=(h/3)*(y(1)+2*sumap+4*sumai+y(end))
Vol2SC=IntSC*100
RellenoSC=Vol1-Vol2SC




