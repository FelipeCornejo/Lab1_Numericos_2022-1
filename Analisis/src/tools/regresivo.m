function [x] = regresivo(A,b)
%Se reciben de izquierda a derecha: La matriz triangular superior | vector
%de terminos independientes | orden de la matriz
tam = length(b);
%Vector de soluciones
x = zeros(tam,1);
x(tam) = b(tam)/A(tam,tam);
for i = tam-1:-1:1
    sum = x(i+1:tam)'*A(i,i+1:tam)';
    x(i) = (b(i)-sum)/A(i,i);
    
end
end



