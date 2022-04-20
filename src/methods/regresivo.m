function [x,error,tiempo] = regresivo(A,b)
%Se reciben de izquierda a derecha: La matriz triangular superior | vector
%de terminos independientes | orden de la matriz
n = length(b);
[M,N] = size(A)
tam=n;
errores = [];
if (M~=N) || (tam ~= M)
    error('Las dimensiones del sistema no son válidas');
end
%Vector de soluciones
x = zeros(n,1);
x(n) = b(n)/A(n,n);
tic
for i = n-1:-1:1
    sum = x(i+1:tam)'*A(i,i+1:tam)';
    x(i) = (b(i)-sum)/A(i,i);
    
end
tiempo = toc;
disp(x);
%calculo de error
    %er1 = 

end



