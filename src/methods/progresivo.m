
%metodo de sustitucion progresiva para
% sistemas de ecuaciones lineales
function [x] = progresivo(A,b)
% ¿Es válido el sistema?
[M,N] = size(A)
tam = length(b)
if (M ~= N) || (tam ~= M)
    error('Las dimensiones del sistema no son válidas');
end
% Vector de Soluciones
x = zeros(tam,1);
x(1) = b(1)/A(1,1);
for k = 2:1:tam
    suma = x(1:k-1)'*A(k,1:k-1)';
    x(k) = (b(k)-suma)/A(k,k);
end

