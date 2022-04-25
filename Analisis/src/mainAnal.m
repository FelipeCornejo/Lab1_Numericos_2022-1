clear
%Se cargan las matrices de 289 x 289
A289 = load('A289.dat');
b289 = load('b289.dat');
%Se cargan las matrices de 1089 x 1089
A1089 = load('A1089.dat');
b1089 = load('b1089.dat');
%Se cargan las matrices de 4225 x 4225
A4225 = load('A4225.dat');
b4225 = load('b4225.dat');

tol = 0.0000000001; % e-10

iter289 = 400;
iter1089 = 1500;
iter4225 = 3000;

n289 = 289;
n1089 = 1089;
n4225 = 4225;

nombres = categorical({'Gauss.Jacobi', 'Gauss.Seidel', 'LU', 'Cholesky', 'QR', 'LSQR', 'LSQR-Disperso'});

%n = 289
[errores289,erroresPeso289,tiempos289,tiemposPeso289] = main289(A289,b289,n289,tol,iter289,nombres);

%n = 1089
[errores1089,erroresPeso1089,tiempos1089,tiemposPeso1089] = main1089(A1089,b1089,n1089,tol,iter1089,nombres);

%n = 4225
[errores4225,erroresPeso4225,tiempos4225,tiemposPeso4225] = main4225(A4225,b4225,n4225,tol,iter4225,nombres);

analError = [errores289;errores1089;errores4225];
analTiempo = [tiempos289;tiempos1089;tiempos4225];
analPesoError = [erroresPeso289;erroresPeso1089;erroresPeso4225];
analPesoTiempo = [tiemposPeso289;tiemposPeso1089;tiemposPeso4225];
