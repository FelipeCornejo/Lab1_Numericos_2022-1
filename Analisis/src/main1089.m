function [errores1089,erroresPeso1089,tiempos1089,tiemposPeso1089] = main1089(A1089,b1089,n,tol,iters,nombres)

disp("Empecé 1089");

[iteracionesGJ, solucionesGJ, errorGJ] = GaussJacobiE(A1089, b1089, n, iters);
[iteracionesLU, solucionesLU, errorLU] = LUDoolittleE(A1089, b1089);
[solucionesLSQR, errorLSQR] = LSQRE(A1089,b1089,tol);
[solucionesLSQRD, errorLSQRD] = LSQRDE(A1089,b1089,tol);
[solucionesCh, errorCh] = CholeskyE(A1089,b1089);
[solucionesGS,errorGS] = GramSchmidthE(A1089,b1089);
[solucionesGSe,errorGSe] = GaussSeidelE(A1089,b1089,n,iters);

[solucionesGJ, tiempoGJ] = GaussJacobiT(A1089, b1089, n, iters);
[solucionesLU, tiempoLU] = LUDoolittleT(A1089, b1089);
[solucionesLSQR, tiempoLSQR] = LSQRT(A1089,b1089,tol);
[solucionesLSQRD, tiempoLSQRD] = LSQRDT(A1089,b1089,tol);
[solucionesCh, tiempoCh] = CholeskyT(A1089,b1089);
[solucionesGS,tiempoGS] = GramSchmidthT(A1089,b1089);
[tiempoGSe,tiempoGSe] = GaussSeidelT(A1089,b1089,n,iters);

%Errores 1089
errores1089 = [errorGJ, errorGSe, errorLU, errorCh, errorGS, errorLSQR, errorLSQRD];
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

%Costo Temporal
tiempos1089 = [tiempoGJ, tiempoGSe, tiempoLU, tiempoCh, tiempoGS, tiempoLSQR, tiempoLSQRD];
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

disp("Terminé 1089");
end
