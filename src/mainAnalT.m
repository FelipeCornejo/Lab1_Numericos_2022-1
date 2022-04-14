clear

%Se cargan las matrices de 1089 x 1089
A1089 = load('./data/A1089.dat');
b1089 = load('./data/b1089.dat');
tol = 0.0000000001; % e-10
n = 1089;

%Métodos escogidos: Iterativo = Jacobi | Directo = Doolittle | Normal =
%LSQR
[iteracionesGJ, solucionesGJ, errorGJ, operacionesGJ,tiempoGJ,erroresGJ] = GaussJacobi(A1089, b1089, n, tol);
[iteracionesDL, solucionesDL, errorDL, operacionesDL,tiempoDL,erroresDL] = metodoLUDoolittle(A1089, b1089);
[solucionLSQR, errorLSQR,operacionesLSQR,tiempoLSQR] = lsqr(A1089,b1089, tol);

%Errores
vectorErrores1089 = [errorGJ errorDL errorLSQR];
vectorNombre = categorical({'Gauss-Jacobi','Doolittle','LSQR'});
figure
hold on
bar(vectorNombre,vectorErrores1089)
title('Error de cada método para matriz 1089 x 1089')
ylabel('Error') 
xlabel('Nombre del método')
hold off

%Costo espacial
vectorOperaciones1089 = [operacionesGJ operacionesDL operacionesLSQR];

%Costo Temporal
vectorTiempos1089 = ['Gauss Jacobi - '+string(tiempoGJ)+'[s]' 'LU - '+ string(tiempoDL)+'[s]' 'LSQR - '+string(tiempoLSQR)+'[s]'];
vectorTiempos1089 = categorical(vectorTiempos1089);
figure
hold on
bar(vectorTiempos1089,vectorOperaciones1089)
title('Costo espacial y temporal de cada método para matriz 1089 x 1089')
ylabel('Número de operaciones')
xlabel('Nombre del método y su costo temporal')
hold off