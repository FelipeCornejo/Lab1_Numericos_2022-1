function [veri] = dispercion(A,n)

%Obtiene el grado de disperción y devuelve un bool en relación si la matriz
%es dispersa o no.

k = find(A);
disp = k/n;
veri = false;
if (disp>0.5)
    veri = true;
end
end
