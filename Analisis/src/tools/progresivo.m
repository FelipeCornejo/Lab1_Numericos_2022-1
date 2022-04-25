function [x] = progresivo(A,b)
tam = length(b);
% Vector de Soluciones
x = zeros(tam,1);
x(1) = b(1)/A(1,1);
for k = 2:1:tam
    suma = x(1:k-1)'*A(k,1:k-1)';
    x(k) = (b(k)-suma)/A(k,k);
end
end

