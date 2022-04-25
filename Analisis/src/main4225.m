function [errores4225,erroresPeso4225,tiempos4225,tiemposPeso4225] = main4225(A4225,b4225,n,tol,iters,nombres)

disp("Empecé 4225");

[iteracionesGJ, solucionesGJ, errorGJ] = GaussJacobiE(A4225, b4225, n, iters);
[iteracionesLU, solucionesLU, errorLU] = LUDoolittleE(A4225, b4225);
[solucionesLSQR, errorLSQR] = LSQRE(A4225,b4225,tol);
[solucionesLSQRD, errorLSQRD] = LSQRDE(A4225,b4225,tol);
[solucionesCh, errorCh] = CholeskyE(A4225,b4225);
[solucionesGS,errorGS] = GramSchmidthE(A4225,b4225);
[solucionesGSe,errorGSe] = GaussSeidelE(A4225,b4225,n,iters);

[solucionesGJ, tiempoGJ] = GaussJacobiT(A4225, b4225, n, iters);
[solucionesLU, tiempoLU] = LUDoolittleT(A4225, b4225);
[solucionesLSQR, tiempoLSQR] = LSQRT(A4225,b4225,tol);
[solucionesLSQRD, tiempoLSQRD] = LSQRDT(A4225,b4225,tol);
[solucionesCh, tiempoCh] = CholeskyT(A4225,b4225);
[solucionesGS,tiempoGS] = GramSchmidthT(A4225,b4225);
[solucionesGSe,tiempoGSe] = GaussSeidelT(A4225,b4225,n,iters);

%Errores 4225
%'Gauss.Jacobi', 'Gauss.Seidel', 'LU', 'Cholesky', 'QR', 'LSQR', 'LSQR-Disperso'
errores4225 = [errorGJ, errorGSe, errorLU, errorCh, errorGS, errorLSQR, errorLSQRD];
figure
hold on
bar(nombres,errores4225)
title('Error de cada método para matriz 4225 x 4225')
ylabel('Error') 
xlabel('Nombre del método')
hold off

%Errores peso 4225
maxiE = max(errores4225);
erroresPeso4225 = errores4225/maxiE;
figure
hold on
bar(nombres,erroresPeso4225)
title('Error de cada método para matriz 4225 x 4225')
ylabel('Error') 
xlabel('Nombre del método')
hold off

%Costo Temporal
tiempos4225 = [tiempoGJ, tiempoGSe, tiempoLU, tiempoCh, tiempoGS, tiempoLSQR, tiempoLSQRD];
figure
hold on
bar(nombres,tiempos4225)
title('Costo espacial y temporal de cada método para matriz 4225 x 4225')
ylabel('Número de operaciones')
xlabel('Nombre del método y su costo temporal')
hold off

%Costo Temporal Peso
maxiT = max(tiempos4225);
tiemposPeso4225 = tiempos4225/maxiT;
figure
hold on
bar(nombres,tiemposPeso4225)
title('Costo espacial y temporal de cada método para matriz 4225 x 4225')
ylabel('Número de operaciones')
xlabel('Nombre del método y su costo temporal')
hold off

disp("Terminé 4225");
end
