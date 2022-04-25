function [x, tiempo] = LUDoolittleM(A,b)
    tam = length(A);
    columnas = size(A,1);
    L = zeros(columnas);
    U = zeros(columnas);
    L(1, 1) = 1;
    U(1, 1) = A(1, 1);
    tic
    for i = 2:columnas
        L(i, i) = 1;
        U(1, i) = A(1, i);
        L(i, 1) = A(i, 1)/U(1, 1);
    end
    for j = 2:columnas
        for i = j:columnas
            sumaL = 0;
            sumaU = 0;
            for k = 1:j-1
                if (U(k, i) ~= 0) && (L(j, k) ~= 0)
                    sumaL = sumaL + U(k, i)*L(j, k);
                end
                if(U(k, j) ~= 0) && (L(i, k) ~= 0) && (i ~= j)
                    sumaU = sumaU + U(k, j)*L(i, k);
                end
            end
            U(j, i) = A(j, i) - sumaL;
            if (j < columnas) && (i > j)
                L(i, j) = (A(i, j) - sumaU)/U(j, j);
            end
        end
    end
    %Los sistemas a resolver serán:
    %L*y = b
    %U*x = y
    %Se procede a realizar una sistución progresiva
    % para obtener y
    y = progresivo(L,b);
    
    %Se hace una sustitución regresiva para obtener x 
    x = regresivo(U,y);
    tiempo = toc;
end