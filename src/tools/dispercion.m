function [ans] = dispercion(A,n)
%Obtiene el grado de disperción y devuelve un bool en relación si la matriz
%es dispersa o no.

k = find(A);
disp = k/n;
if (disp>0.5)
    ans = 1;
else
    ans = 0;
end
end

