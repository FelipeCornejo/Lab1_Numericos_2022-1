function[iteraciones, soluciones, error, operaciones, tiempo, errores] = GaussJacobi(A, b, n, tol)
    iteraciones = 0;
    %se define el número de operaciones aritméticas
    operaciones = 0;
    %Se inicializa la matriz de soluciones como una matriz de ceros
    x = zeros(1, n);
    %Se obtiene la matriz traspuesta
    x = x';
    %Se define una matriz auxiliar para ir almacenando las soluciones
    aux = x; 
    %Se define una matriz para almacenar los errores de la solución
    errores = x;
    %Se construye una matriz aumentada.
    aumMat = [ A b ];
    operaciones = n;
    [ filas, columnas ] = size(aumMat);
    error = 1;
    tic;
    %Se itera de acuerdo a la tolerancia
    while error > tol
        %Se itera de acuerdo al tamaño de las filas de la matriz aumentada.
        for i = 1:filas
            %Se usa la fórmula del método de Jacobi.
            aux(i, 1) = (1/aumMat(i, i))*(aumMat(i, columnas) - sum(A(i, :)*x(:, 1)) + A(i, i)*x(i, 1));
            operaciones = operaciones + filas + 6;
            %Se guardan los errores
            errores(i, 1) = abs(aux(i, 1) - x(i, 1));
        end 
        %Se guardan las soluciones de la matriz auxiliar en la matriz x.
        x(:, 1) = aux(:, 1);
        error = norm(errores);
        iteraciones = iteraciones + 1;
    end
    tiempo = toc;
    soluciones = x;
end