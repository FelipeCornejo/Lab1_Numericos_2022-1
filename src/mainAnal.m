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

n289 = 289;
n1089 = 1089;
n4225 = 4225;

%-------------%
%---ERRORES---%
%-------------%

%n = 289
[iteracionesGJ, solucionesGJ, errorGJ] = GaussJacobiE(A289, b289, n, tol);
[iteracionesLU, solucionesLU, errorLU] = LUDoolittleE(A289, b289);
[solucionesLSQR, errorLSQR] = LSQRE(A289,b289,tol);
[solucionesCh, errorCh] = CholeskyE(A289,b289);

%n = 1089
[iteracionesGJ, solucionesGJ, errorGJ] = GaussJacobiE(A1089, b1089, n, tol);
[iteracionesLU, solucionesLU, errorLU] = LUDoolittleE(A1089, b1089);
[solucionesLSQR, errorLSQR] = LSQRE(A1089,b1089,tol);
[solucionesCh, errorCh] = CholeskyE(A1089,b1089);

%n = 4225
[iteracionesGJ, solucionesGJ, errorGJ] = GaussJacobiE(A4225, b4225, n, tol);
[iteracionesLU, solucionesLU, errorLU] = LUDoolittleE(A4225, b4225);
[solucionesLSQR, errorLSQR] = LSQRE(A4225,b4225,tol);
[solucionesCh, errorCh] = CholeskyE(A4225,b4225);


nombres = categorical({'Gauss-Jacobi','LU','LSQR','Cholesky'});

%Errores 1089
errores1089 = [errorGJ, errorLU, errorLSQR, errorCh];
figure
hold on
bar(nombres,errores1089)
title('Error de cada método para matriz 1089 x 1089')
ylabel('Error') 
xlabel('Nombre del método')
hold off

%Errores peso 1089
maxiE = max(errores1089);
erroresPeso1089 = errores1089/maxiE;
figure
hold on
bar(nombres,erroresPeso1089)
title('Error de cada método para matriz 1089 x 1089')
ylabel('Error') 
xlabel('Nombre del método')
hold off

%-------------%
%---TIEMPOS---%
%-------------%
[solucionesGJ, tiempoGJ] = GaussJacobiT(A1089, b1089, n1089, tol);
[solucionesLU, tiempoLU] = LUDoolittleT(A1089, b1089);
[solucionesLSQR, tiempoLSQR] = LSQRT(A1089,b1089,tol);
[solucionesCh, tiempoCh] = CholeskyT(A1089,b1089);

%Costo Temporal
tiempos1089 = [tiempoGJ, tiempoLU, tiempoLSQR, tiempoCh];
figure
hold on
bar(nombres,tiempos1089)
title('Costo espacial y temporal de cada método para matriz 1089 x 1089')
ylabel('Número de operaciones')
xlabel('Nombre del método y su costo temporal')
hold off

%Costo Temporal Peso
maxiT = max(tiempos1089);
tiemposPeso1089 = tiempos1089/maxiT;
figure
hold on
bar(nombres,tiemposPeso1089)
title('Costo espacial y temporal de cada método para matriz 1089 x 1089')
ylabel('Número de operaciones')
xlabel('Nombre del método y su costo temporal')
hold off