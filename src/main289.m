function [errores289,erroresPeso289,tiempos289,tiemposPeso289] = main289(A289,b289,n,tol,iters,nombres)

disp("Empecé 289");

[iteracionesGJ, solucionesGJ, errorGJ] = GaussJacobiE(A289, b289, n, iters);
[iteracionesLU, solucionesLU, errorLU] = LUDoolittleE(A289, b289);
[solucionesLSQR, errorLSQR] = LSQRE(A289,b289,tol);
[solucionesLSQRD, errorLSQRD] = LSQRDE(A289,b289,tol);
[solucionesCh, errorCh] = CholeskyE(A289,b289);
[solucionesGS,errorGS] = GramSchmidthE(A289,b289);
[solucionesGSe,errorGSe] = GaussSeidelE(A289,b289,n,iters);

[solucionesGJ, tiempoGJ] = GaussJacobiT(A289, b289, n, iters);
[solucionesLU, tiempoLU] = LUDoolittleT(A289, b289);
[solucionesLSQR, tiempoLSQR] = LSQRT(A289,b289,tol);
[solucionesLSQRD, tiempoLSQRD] = LSQRDT(A289,b289,tol);
[solucionesCh, tiempoCh] = CholeskyT(A289,b289);
[solucionesGS,tiempoGS] = GramSchmidthT(A289,b289);
[solucionesGSe,tiempoGSe] = GaussSeidelT(A289,b289,n,iters);

soluciones289 = [solucionesGJ';solucionesLU';solucionesLSQR';solucionesLSQRD';solucionesCh';solucionesGS';solucionesGSe'];

%Errores 289
errores289 = [errorGJ, errorGSe, errorLU, errorCh, errorGS, errorLSQR, errorLSQRD];
figure
hold on
bar(nombres,errores289)
title('Error de cada método para matriz 289 x 289')
ylabel('Error') 
xlabel('Nombre del método')
hold off

%Errores peso 289
maxiE = max(errores289);
erroresPeso289 = errores289/maxiE;
figure
hold on
bar(nombres,erroresPeso289)
title('Error de cada método para matriz 289 x 289')
ylabel('Error') 
xlabel('Nombre del método')
hold off

%Costo Temporal
tiempos289 = [tiempoGJ, tiempoGSe, tiempoLU, tiempoCh, tiempoGS, tiempoLSQR, tiempoLSQRD];
figure
hold on
bar(nombres,tiempos289)
title('Costo espacial y temporal de cada método para matriz 289 x 289')
ylabel('Número de operaciones')
xlabel('Nombre del método y su costo temporal')
hold off

%Costo Temporal Peso
maxiT = max(tiempos289);
tiemposPeso289 = tiempos289/maxiT;
figure
hold on
bar(nombres,tiemposPeso289)
title('Costo espacial y temporal de cada método para matriz 289 x 289')
ylabel('Número de operaciones')
xlabel('Nombre del método y su costo temporal')
hold off

disp("Terminé 289");
end
