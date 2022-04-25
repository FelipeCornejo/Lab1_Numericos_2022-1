function [dist,col] = distancia(error,tiempo,matrixAPeso)
%Obtener la distancia entre 2 puntos, retornar la distancia, y el numero de
%la columna, punto es el punto a estudiar, matrizA es la matriz de
%analis y n es el tamaño de la matriz a estudiar.
[~,n] = size(matrixAPeso);
dist = 1;
col = 1;
for i=1:n
    aux = norm(matrixAPeso(:,i)'-[error,tiempo]);
    if dist > aux
        dist = aux;
        col = i;
    end
end
end