%---------------------
%---Carga de Datos----
%---------------------
%Carga de Matriz de información.
%Definirá los rangos para las decisiones de método a escoger.
%Por el momento será una carga estática
%Debería cambiarse a un seleccionador GUI!
A1089 = load('A1089.dat');
b1089 = load('b1089.dat');

%------------------------------
%---Definición de parametros---
%------------------------------
%Definición de Tolerancia para aceptación de los métodos estudiados.
%Al definirlo como variable global implicará que todos los métodos
%tienen el mismo estandar de parada.
tol = 0.0000000001; % e-10

%Tamaño de la matríz
n = size(A1089,1);

%Ingreso de eficiencia por consola.
%Como la eficiacia + eficacia = 1, entonces eficacia = 1 - eficiencia.
efici = input("Ingrese la eficacia para la resolución del problema sistema con un valor entre 0 y 1: ");
if (efici > 1) %Por si el usuario ingresa algo mayor a 1
    efici = 1;
end
efica = 1 - efici;

%Se obtienen las propiedades importantes de la matriz para saber que tipo
%de métodos se podrían realizar.
%DISPERCIÓN
disp = dispercion(A1089,n);